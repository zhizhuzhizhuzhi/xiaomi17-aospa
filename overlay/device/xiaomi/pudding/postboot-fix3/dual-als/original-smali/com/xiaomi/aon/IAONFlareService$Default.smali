.class public Lcom/xiaomi/aon/IAONFlareService$Default;
.super Ljava/lang/Object;
.source "IAONFlareService.java"

# interfaces
.implements Lcom/xiaomi/aon/IAONFlareService;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/aon/IAONFlareService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Default"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .registers 2

    .line 23
    const/4 v0, 0x0

    return-object v0
.end method

.method public registerListener(IFILcom/xiaomi/aon/IMiAONListener;)V
    .registers 5
    .param p1, "type"    # I
    .param p2, "fps"    # F
    .param p3, "timeout"    # I
    .param p4, "listener"    # Lcom/xiaomi/aon/IMiAONListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 17
    return-void
.end method

.method public unregisterListener(ILcom/xiaomi/aon/IMiAONListener;)V
    .registers 3
    .param p1, "type"    # I
    .param p2, "listener"    # Lcom/xiaomi/aon/IMiAONListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 20
    return-void
.end method
