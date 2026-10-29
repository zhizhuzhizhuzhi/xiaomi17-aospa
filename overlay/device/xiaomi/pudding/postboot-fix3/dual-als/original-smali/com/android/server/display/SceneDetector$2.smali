.class Lcom/android/server/display/SceneDetector$2;
.super Ljava/lang/Object;
.source "SceneDetector.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/display/SceneDetector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/display/SceneDetector;


# direct methods
.method public static synthetic $r8$lambda$r9gsUn1BbE2aPMxJ_OwOOIkgqwA(Lcom/android/server/display/SceneDetector$2;Landroid/os/IBinder;)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/android/server/display/SceneDetector$2;->lambda$onServiceConnected$0(Landroid/os/IBinder;)V

    return-void
.end method

.method public static synthetic $r8$lambda$xGX_LRudGbJ7RR7fGC-BPo4zdbU(Lcom/android/server/display/SceneDetector$2;)V
    .registers 1

    invoke-direct {p0}, Lcom/android/server/display/SceneDetector$2;->lambda$onServiceDisconnected$1()V

    return-void
.end method

.method constructor <init>(Lcom/android/server/display/SceneDetector;)V
    .registers 2
    .param p1, "this$0"    # Lcom/android/server/display/SceneDetector;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 378
    iput-object p1, p0, Lcom/android/server/display/SceneDetector$2;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private synthetic lambda$onServiceConnected$0(Landroid/os/IBinder;)V
    .registers 5
    .param p1, "service"    # Landroid/os/IBinder;

    .line 384
    const-string v0, "SceneDetector"

    :try_start_2
    iget-object v1, p0, Lcom/android/server/display/SceneDetector$2;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {p1}, Lcom/xiaomi/aon/IAONFlareService$Stub;->asInterface(Landroid/os/IBinder;)Lcom/xiaomi/aon/IAONFlareService;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/server/display/SceneDetector;->-$$Nest$fputmAonFlareService(Lcom/android/server/display/SceneDetector;Lcom/xiaomi/aon/IAONFlareService;)V

    .line 385
    iget-object v1, p0, Lcom/android/server/display/SceneDetector$2;->this$0:Lcom/android/server/display/SceneDetector;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/android/server/display/SceneDetector;->-$$Nest$fputmServiceConnected(Lcom/android/server/display/SceneDetector;Z)V

    .line 386
    iget-object v1, p0, Lcom/android/server/display/SceneDetector$2;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v1}, Lcom/android/server/display/SceneDetector;->-$$Nest$fgetmDeathRecipient(Lcom/android/server/display/SceneDetector;)Landroid/os/IBinder$DeathRecipient;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {p1, v1, v2}, Landroid/os/IBinder;->linkToDeath(Landroid/os/IBinder$DeathRecipient;I)V

    .line 387
    iget-object v1, p0, Lcom/android/server/display/SceneDetector$2;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v1}, Lcom/android/server/display/SceneDetector;->-$$Nest$fgetmShouldCheckAonStatusWhenConnected(Lcom/android/server/display/SceneDetector;)Z

    move-result v1

    if-eqz v1, :cond_2e

    .line 388
    iget-object v1, p0, Lcom/android/server/display/SceneDetector$2;->this$0:Lcom/android/server/display/SceneDetector;

    iget-object v2, p0, Lcom/android/server/display/SceneDetector$2;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v2}, Lcom/android/server/display/SceneDetector;->-$$Nest$fgetmPreAmbientLux(Lcom/android/server/display/SceneDetector;)F

    move-result v2

    invoke-static {v1, v2}, Lcom/android/server/display/SceneDetector;->-$$Nest$mcheckAonFlareStatus(Lcom/android/server/display/SceneDetector;F)V

    .line 390
    :cond_2e
    const-string/jumbo v1, "onServiceConnected: aon flare service connected."

    invoke-static {v0, v1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_34
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_34} :catch_35

    .line 393
    goto :goto_3c

    .line 391
    :catch_35
    move-exception v1

    .line 392
    .local v1, "e":Landroid/os/RemoteException;
    const-string/jumbo v2, "onServiceConnected: aon flare service connect failed."

    invoke-static {v0, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 394
    .end local v1    # "e":Landroid/os/RemoteException;
    :goto_3c
    return-void
.end method

.method private synthetic lambda$onServiceDisconnected$1()V
    .registers 3

    .line 401
    const-string v0, "SceneDetector"

    const-string/jumbo v1, "onServiceDisconnected: aon flare service disconnected."

    invoke-static {v0, v1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 402
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$2;->this$0:Lcom/android/server/display/SceneDetector;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/android/server/display/SceneDetector;->-$$Nest$fputmAonFlareService(Lcom/android/server/display/SceneDetector;Lcom/xiaomi/aon/IAONFlareService;)V

    .line 403
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$2;->this$0:Lcom/android/server/display/SceneDetector;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/android/server/display/SceneDetector;->-$$Nest$fputmAonState(Lcom/android/server/display/SceneDetector;I)V

    .line 404
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$2;->this$0:Lcom/android/server/display/SceneDetector;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/android/server/display/SceneDetector;->-$$Nest$fputmServiceConnected(Lcom/android/server/display/SceneDetector;Z)V

    .line 405
    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .registers 5
    .param p1, "name"    # Landroid/content/ComponentName;
    .param p2, "service"    # Landroid/os/IBinder;

    .line 382
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$2;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v0}, Lcom/android/server/display/SceneDetector;->-$$Nest$fgetmSceneDetectorHandler(Lcom/android/server/display/SceneDetector;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/android/server/display/SceneDetector$2$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p2}, Lcom/android/server/display/SceneDetector$2$$ExternalSyntheticLambda0;-><init>(Lcom/android/server/display/SceneDetector$2;Landroid/os/IBinder;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 395
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .registers 4
    .param p1, "name"    # Landroid/content/ComponentName;

    .line 400
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$2;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v0}, Lcom/android/server/display/SceneDetector;->-$$Nest$fgetmSceneDetectorHandler(Lcom/android/server/display/SceneDetector;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/android/server/display/SceneDetector$2$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Lcom/android/server/display/SceneDetector$2$$ExternalSyntheticLambda1;-><init>(Lcom/android/server/display/SceneDetector$2;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 406
    return-void
.end method
