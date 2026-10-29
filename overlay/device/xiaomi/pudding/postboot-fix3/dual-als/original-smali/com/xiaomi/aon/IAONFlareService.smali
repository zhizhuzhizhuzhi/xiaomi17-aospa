.class public interface abstract Lcom/xiaomi/aon/IAONFlareService;
.super Ljava/lang/Object;
.source "IAONFlareService.java"

# interfaces
.implements Landroid/os/IInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/aon/IAONFlareService$Stub;,
        Lcom/xiaomi/aon/IAONFlareService$Default;
    }
.end annotation


# static fields
.field public static final DESCRIPTOR:Ljava/lang/String; = "com.xiaomi.aon.IAONFlareService"


# virtual methods
.method public abstract registerListener(IFILcom/xiaomi/aon/IMiAONListener;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method

.method public abstract unregisterListener(ILcom/xiaomi/aon/IMiAONListener;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method
