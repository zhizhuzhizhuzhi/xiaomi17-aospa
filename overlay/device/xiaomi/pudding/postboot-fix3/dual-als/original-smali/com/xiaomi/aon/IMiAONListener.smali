.class public interface abstract Lcom/xiaomi/aon/IMiAONListener;
.super Ljava/lang/Object;
.source "IMiAONListener.java"

# interfaces
.implements Landroid/os/IInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/aon/IMiAONListener$Stub;,
        Lcom/xiaomi/aon/IMiAONListener$Default;
    }
.end annotation


# static fields
.field public static final DESCRIPTOR:Ljava/lang/String; = "com.xiaomi.aon.IMiAONListener"


# virtual methods
.method public abstract onCallbackListener(I[I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method

.method public abstract onImageAvailiable(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method
