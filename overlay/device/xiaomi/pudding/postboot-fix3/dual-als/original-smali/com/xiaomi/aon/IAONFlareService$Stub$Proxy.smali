.class final Lcom/xiaomi/aon/IAONFlareService$Stub$Proxy;
.super Ljava/lang/Object;
.source "IAONFlareService.java"

# interfaces
.implements Lcom/xiaomi/aon/IAONFlareService;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/aon/IAONFlareService$Stub;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Proxy"
.end annotation


# instance fields
.field private mRemote:Landroid/os/IBinder;


# direct methods
.method constructor <init>(Landroid/os/IBinder;)V
    .registers 2
    .param p1, "remote"    # Landroid/os/IBinder;

    .line 120
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 121
    iput-object p1, p0, Lcom/xiaomi/aon/IAONFlareService$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    .line 122
    return-void
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .registers 2

    .line 125
    iget-object v0, p0, Lcom/xiaomi/aon/IAONFlareService$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    return-object v0
.end method

.method public final getInterfaceDescriptor()Ljava/lang/String;
    .registers 2

    .line 129
    const-string v0, "com.xiaomi.aon.IAONFlareService"

    return-object v0
.end method

.method public registerListener(IFILcom/xiaomi/aon/IMiAONListener;)V
    .registers 9
    .param p1, "type"    # I
    .param p2, "fps"    # F
    .param p3, "timeout"    # I
    .param p4, "listener"    # Lcom/xiaomi/aon/IMiAONListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 133
    invoke-virtual {p0}, Lcom/xiaomi/aon/IAONFlareService$Stub$Proxy;->asBinder()Landroid/os/IBinder;

    move-result-object v0

    invoke-static {v0}, Landroid/os/Parcel;->obtain(Landroid/os/IBinder;)Landroid/os/Parcel;

    move-result-object v0

    .line 135
    .local v0, "_data":Landroid/os/Parcel;
    :try_start_8
    const-string v1, "com.xiaomi.aon.IAONFlareService"

    invoke-virtual {v0, v1}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 136
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeInt(I)V

    .line 137
    invoke-virtual {v0, p2}, Landroid/os/Parcel;->writeFloat(F)V

    .line 138
    invoke-virtual {v0, p3}, Landroid/os/Parcel;->writeInt(I)V

    .line 139
    invoke-virtual {v0, p4}, Landroid/os/Parcel;->writeStrongInterface(Landroid/os/IInterface;)V

    .line 140
    iget-object v1, p0, Lcom/xiaomi/aon/IAONFlareService$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-interface {v1, v3, v0, v2, v3}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    :try_end_20
    .catchall {:try_start_8 .. :try_end_20} :catchall_25

    .line 143
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 144
    nop

    .line 145
    return-void

    .line 143
    :catchall_25
    move-exception v1

    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 144
    throw v1
.end method

.method public unregisterListener(ILcom/xiaomi/aon/IMiAONListener;)V
    .registers 8
    .param p1, "type"    # I
    .param p2, "listener"    # Lcom/xiaomi/aon/IMiAONListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 148
    invoke-virtual {p0}, Lcom/xiaomi/aon/IAONFlareService$Stub$Proxy;->asBinder()Landroid/os/IBinder;

    move-result-object v0

    invoke-static {v0}, Landroid/os/Parcel;->obtain(Landroid/os/IBinder;)Landroid/os/Parcel;

    move-result-object v0

    .line 150
    .local v0, "_data":Landroid/os/Parcel;
    :try_start_8
    const-string v1, "com.xiaomi.aon.IAONFlareService"

    invoke-virtual {v0, v1}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 151
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeInt(I)V

    .line 152
    invoke-virtual {v0, p2}, Landroid/os/Parcel;->writeStrongInterface(Landroid/os/IInterface;)V

    .line 153
    iget-object v1, p0, Lcom/xiaomi/aon/IAONFlareService$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x2

    invoke-interface {v1, v4, v0, v2, v3}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    :try_end_1b
    .catchall {:try_start_8 .. :try_end_1b} :catchall_20

    .line 156
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 157
    nop

    .line 158
    return-void

    .line 156
    :catchall_20
    move-exception v1

    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 157
    throw v1
.end method
