.class public Lcom/xiaomi/aon/IMiAONListener$Default;
.super Ljava/lang/Object;
.source "IMiAONListener.java"

# interfaces
.implements Lcom/xiaomi/aon/IMiAONListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/aon/IMiAONListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Default"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .registers 2

    .line 25
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCallbackListener(I[I)V
    .registers 3
    .param p1, "Type"    # I
    .param p2, "data"    # [I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 18
    return-void
.end method

.method public onImageAvailiable(I)V
    .registers 2
    .param p1, "frame_id"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 22
    return-void
.end method
