.class public abstract Lcom/xiaomi/aon/IMiAONListener$Stub;
.super Landroid/os/Binder;
.source "IMiAONListener.java"

# interfaces
.implements Lcom/xiaomi/aon/IMiAONListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/aon/IMiAONListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/aon/IMiAONListener$Stub$Proxy;
    }
.end annotation


# static fields
.field static final TRANSACTION_onCallbackListener:I = 0x1

.field static final TRANSACTION_onImageAvailiable:I = 0x2


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 34
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    .line 35
    const-string v0, "com.xiaomi.aon.IMiAONListener"

    invoke-virtual {p0, p0, v0}, Lcom/xiaomi/aon/IMiAONListener$Stub;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    .line 36
    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Lcom/xiaomi/aon/IMiAONListener;
    .registers 3
    .param p0, "obj"    # Landroid/os/IBinder;

    .line 43
    if-nez p0, :cond_4

    .line 44
    const/4 v0, 0x0

    return-object v0

    .line 46
    :cond_4
    const-string v0, "com.xiaomi.aon.IMiAONListener"

    invoke-interface {p0, v0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    .line 47
    .local v0, "iin":Landroid/os/IInterface;
    if-eqz v0, :cond_14

    instance-of v1, v0, Lcom/xiaomi/aon/IMiAONListener;

    if-eqz v1, :cond_14

    .line 48
    move-object v1, v0

    check-cast v1, Lcom/xiaomi/aon/IMiAONListener;

    return-object v1

    .line 50
    :cond_14
    new-instance v1, Lcom/xiaomi/aon/IMiAONListener$Stub$Proxy;

    invoke-direct {v1, p0}, Lcom/xiaomi/aon/IMiAONListener$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

    return-object v1
.end method

.method public static getDefaultTransactionName(I)Ljava/lang/String;
    .registers 2
    .param p0, "transactionCode"    # I

    .line 59
    packed-switch p0, :pswitch_data_c

    .line 71
    const/4 v0, 0x0

    return-object v0

    .line 67
    :pswitch_5
    const-string v0, "onImageAvailiable"

    return-object v0

    .line 63
    :pswitch_8
    const-string v0, "onCallbackListener"

    return-object v0

    nop

    :pswitch_data_c
    .packed-switch 0x1
        :pswitch_8
        :pswitch_5
    .end packed-switch
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .registers 1

    .line 54
    return-object p0
.end method

.method public getTransactionName(I)Ljava/lang/String;
    .registers 3
    .param p1, "transactionCode"    # I

    .line 78
    invoke-static {p1}, Lcom/xiaomi/aon/IMiAONListener$Stub;->getDefaultTransactionName(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .registers 8
    .param p1, "code"    # I
    .param p2, "data"    # Landroid/os/Parcel;
    .param p3, "reply"    # Landroid/os/Parcel;
    .param p4, "flags"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 82
    const/4 v0, 0x1

    if-lt p1, v0, :cond_d

    const v1, 0xffffff

    if-gt p1, v1, :cond_d

    .line 83
    const-string v1, "com.xiaomi.aon.IMiAONListener"

    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 85
    :cond_d
    packed-switch p1, :pswitch_data_36

    .line 109
    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result v0

    return v0

    .line 101
    :pswitch_15
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 102
    .local v1, "_arg0":I
    invoke-virtual {p2}, Landroid/os/Parcel;->enforceNoDataAvail()V

    .line 103
    invoke-virtual {p0, v1}, Lcom/xiaomi/aon/IMiAONListener$Stub;->onImageAvailiable(I)V

    .line 104
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 105
    goto :goto_35

    .line 90
    .end local v1    # "_arg0":I
    :pswitch_23
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 92
    .restart local v1    # "_arg0":I
    invoke-virtual {p2}, Landroid/os/Parcel;->createIntArray()[I

    move-result-object v2

    .line 93
    .local v2, "_arg1":[I
    invoke-virtual {p2}, Landroid/os/Parcel;->enforceNoDataAvail()V

    .line 94
    invoke-virtual {p0, v1, v2}, Lcom/xiaomi/aon/IMiAONListener$Stub;->onCallbackListener(I[I)V

    .line 95
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 96
    nop

    .line 112
    .end local v1    # "_arg0":I
    .end local v2    # "_arg1":[I
    :goto_35
    return v0

    :pswitch_data_36
    .packed-switch 0x1
        :pswitch_23
        :pswitch_15
    .end packed-switch
.end method
