typedef int (*open2_fn)(const char *, int);
extern void *dlsym(void *, const char *);
extern int *__errno(void);
extern int __android_log_print(int,const char *,const char *,...);
static int same(const char *a,const char*b){if(!a||!b)return 0;for(;*a&&*a==*b;a++,b++) {}return *a==*b;}
/* This compatibility route is linked only into VPP. The BSP exposes the secure
 * legacy CDSP endpoint, while sysfs-discovered nsp1000 names only a nonsecure fd.
 * Keep every other open and all vendor retry behavior in the original library. */
__attribute__((visibility("default"))) int __open_2(const char *path,int flags){
 if(same(path,"/dev/fastrpc-nsp1000") && (flags&3)==0){
  const char *secure="/dev/fastrpc-cdsp-secure";
  register long a0 __asm__("x0")=-100;
  register long a1 __asm__("x1")=(long)secure;
  register long a2 __asm__("x2")=flags;
  register long a3 __asm__("x3")=0;
  register long nr __asm__("x8")=56;
  __asm__ volatile("svc 0":"+r"(a0):"r"(a1),"r"(a2),"r"(a3),"r"(nr):"memory","cc");
  if(a0<0){*__errno()=(int)-a0;return -1;}
  __android_log_print(4,"PuddingVppRoute","VPP CDSP session uses existing secure legacy endpoint");
  return (int)a0;
 }
 open2_fn original=(open2_fn)dlsym((void*)-1L,"__open_2");
 if(!original){*__errno()=38;return -1;}
 return original(path,flags);
}
