.class final Lcom/android/server/display/DualSensorPolicy$DualSensorPolicyHandler;
.super Landroid/os/Handler;
.source "DualSensorPolicy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/display/DualSensorPolicy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "DualSensorPolicyHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/display/DualSensorPolicy;


# direct methods
.method public constructor <init>(Lcom/android/server/display/DualSensorPolicy;Landroid/os/Looper;)V
    .registers 4
    .param p2, "looper"    # Landroid/os/Looper;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010,
            0x0
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 252
    iput-object p1, p0, Lcom/android/server/display/DualSensorPolicy$DualSensorPolicyHandler;->this$0:Lcom/android/server/display/DualSensorPolicy;

    .line 253
    const/4 p1, 0x0

    const/4 v0, 0x1

    invoke-direct {p0, p2, p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;Z)V

    .line 254
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 3
    .param p1, "msg"    # Landroid/os/Message;

    .line 258
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_e

    goto :goto_c

    .line 260
    :pswitch_6
    iget-object v0, p0, Lcom/android/server/display/DualSensorPolicy$DualSensorPolicyHandler;->this$0:Lcom/android/server/display/DualSensorPolicy;

    invoke-static {v0}, Lcom/android/server/display/DualSensorPolicy;->-$$Nest$mupdateAssistLightSensorAmbientLux(Lcom/android/server/display/DualSensorPolicy;)V

    .line 261
    nop

    .line 265
    :goto_c
    return-void

    nop

    :pswitch_data_e
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method
