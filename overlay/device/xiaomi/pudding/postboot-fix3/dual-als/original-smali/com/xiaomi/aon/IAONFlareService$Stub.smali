.class public abstract Lcom/xiaomi/aon/IAONFlareService$Stub;
.super Landroid/os/Binder;
.source "IAONFlareService.java"

# interfaces
.implements Lcom/xiaomi/aon/IAONFlareService;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/aon/IAONFlareService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/aon/IAONFlareService$Stub$Proxy;
    }
.end annotation


# static fields
.field static final TRANSACTION_registerListener:I = 0x1

.field static final TRANSACTION_unregisterListener:I = 0x2


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 32
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    .line 33
    const-string v0, "com.xiaomi.aon.IAONFlareService"

    invoke-virtual {p0, p0, v0}, Lcom/xiaomi/aon/IAONFlareService$Stub;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    .line 34
    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Lcom/xiaomi/aon/IAONFlareService;
    .registers 3
    .param p0, "obj"    # Landroid/os/IBinder;

    .line 41
    if-nez p0, :cond_4

    .line 42
    const/4 v0, 0x0

    return-object v0

    .line 44
    :cond_4
    const-string v0, "com.xiaomi.aon.IAONFlareService"

    invoke-interface {p0, v0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    .line 45
    .local v0, "iin":Landroid/os/IInterface;
    if-eqz v0, :cond_14

    instance-of v1, v0, Lcom/xiaomi/aon/IAONFlareService;

    if-eqz v1, :cond_14

    .line 46
    move-object v1, v0

    check-cast v1, Lcom/xiaomi/aon/IAONFlareService;

    return-object v1

    .line 48
    :cond_14
    new-instance v1, Lcom/xiaomi/aon/IAONFlareService$Stub$Proxy;

    invoke-direct {v1, p0}, Lcom/xiaomi/aon/IAONFlareService$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

    return-object v1
.end method

.method public static getDefaultTransactionName(I)Ljava/lang/String;
    .registers 2
    .param p0, "transactionCode"    # I

    .line 57
    packed-switch p0, :pswitch_data_c

    .line 69
    const/4 v0, 0x0

    return-object v0

    .line 65
    :pswitch_5
    const-string/jumbo v0, "unregisterListener"

    return-object v0

    .line 61
    :pswitch_9
    const-string v0, "registerListener"

    return-object v0

    :pswitch_data_c
    .packed-switch 0x1
        :pswitch_9
        :pswitch_5
    .end packed-switch
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .registers 1

    .line 52
    return-object p0
.end method

.method public getTransactionName(I)Ljava/lang/String;
    .registers 3
    .param p1, "transactionCode"    # I

    .line 76
    invoke-static {p1}, Lcom/xiaomi/aon/IAONFlareService$Stub;->getDefaultTransactionName(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .registers 10
    .param p1, "code"    # I
    .param p2, "data"    # Landroid/os/Parcel;
    .param p3, "reply"    # Landroid/os/Parcel;
    .param p4, "flags"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 80
    const/4 v0, 0x1

    if-lt p1, v0, :cond_d

    const v1, 0xffffff

    if-gt p1, v1, :cond_d

    .line 81
    const-string v1, "com.xiaomi.aon.IAONFlareService"

    invoke-virtual {p2, v1}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 83
    :cond_d
    packed-switch p1, :pswitch_data_44

    .line 111
    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result v0

    return v0

    .line 102
    :pswitch_15
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 104
    .local v1, "_arg0":I
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/xiaomi/aon/IMiAONListener$Stub;->asInterface(Landroid/os/IBinder;)Lcom/xiaomi/aon/IMiAONListener;

    move-result-object v2

    .line 105
    .local v2, "_arg1":Lcom/xiaomi/aon/IMiAONListener;
    invoke-virtual {p2}, Landroid/os/Parcel;->enforceNoDataAvail()V

    .line 106
    invoke-virtual {p0, v1, v2}, Lcom/xiaomi/aon/IAONFlareService$Stub;->unregisterListener(ILcom/xiaomi/aon/IMiAONListener;)V

    .line 107
    goto :goto_43

    .line 88
    .end local v1    # "_arg0":I
    .end local v2    # "_arg1":Lcom/xiaomi/aon/IMiAONListener;
    :pswitch_28
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 90
    .restart local v1    # "_arg0":I
    invoke-virtual {p2}, Landroid/os/Parcel;->readFloat()F

    move-result v2

    .line 92
    .local v2, "_arg1":F
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v3

    .line 94
    .local v3, "_arg2":I
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v4

    invoke-static {v4}, Lcom/xiaomi/aon/IMiAONListener$Stub;->asInterface(Landroid/os/IBinder;)Lcom/xiaomi/aon/IMiAONListener;

    move-result-object v4

    .line 95
    .local v4, "_arg3":Lcom/xiaomi/aon/IMiAONListener;
    invoke-virtual {p2}, Landroid/os/Parcel;->enforceNoDataAvail()V

    .line 96
    invoke-virtual {p0, v1, v2, v3, v4}, Lcom/xiaomi/aon/IAONFlareService$Stub;->registerListener(IFILcom/xiaomi/aon/IMiAONListener;)V

    .line 97
    nop

    .line 114
    .end local v1    # "_arg0":I
    .end local v2    # "_arg1":F
    .end local v3    # "_arg2":I
    .end local v4    # "_arg3":Lcom/xiaomi/aon/IMiAONListener;
    :goto_43
    return v0

    :pswitch_data_44
    .packed-switch 0x1
        :pswitch_28
        :pswitch_15
    .end packed-switch
.end method
