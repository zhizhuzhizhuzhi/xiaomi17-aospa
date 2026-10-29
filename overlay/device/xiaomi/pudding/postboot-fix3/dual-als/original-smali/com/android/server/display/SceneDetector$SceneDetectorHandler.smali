.class final Lcom/android/server/display/SceneDetector$SceneDetectorHandler;
.super Landroid/os/Handler;
.source "SceneDetector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/display/SceneDetector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "SceneDetectorHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/display/SceneDetector;


# direct methods
.method public static synthetic $r8$lambda$SoHL9u8Du-uSJGeIOMaXvLrLI2c(Lcom/android/server/display/SceneDetector$SceneDetectorHandler;)V
    .registers 1

    invoke-direct {p0}, Lcom/android/server/display/SceneDetector$SceneDetectorHandler;->lambda$handleMessage$0()V

    return-void
.end method

.method public constructor <init>(Lcom/android/server/display/SceneDetector;Landroid/os/Looper;)V
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

    .line 537
    iput-object p1, p0, Lcom/android/server/display/SceneDetector$SceneDetectorHandler;->this$0:Lcom/android/server/display/SceneDetector;

    .line 538
    const/4 p1, 0x0

    const/4 v0, 0x1

    invoke-direct {p0, p2, p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;Z)V

    .line 539
    return-void
.end method

.method private synthetic lambda$handleMessage$0()V
    .registers 3

    .line 581
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$SceneDetectorHandler;->this$0:Lcom/android/server/display/SceneDetector;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/android/server/display/SceneDetector;->-$$Nest$fputmIsReflectiveScene(Lcom/android/server/display/SceneDetector;Z)V

    .line 582
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 8
    .param p1, "msg"    # Landroid/os/Message;

    .line 543
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x3

    const/4 v4, 0x0

    .line 587
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    .line 543
    packed-switch v0, :pswitch_data_128

    :pswitch_d
    goto/16 :goto_126

    .line 600
    :pswitch_f
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$SceneDetectorHandler;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v0}, Lcom/android/server/display/SceneDetector;->-$$Nest$mcheckProximitySensorStatus(Lcom/android/server/display/SceneDetector;)V

    goto/16 :goto_126

    .line 586
    :pswitch_16
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$SceneDetectorHandler;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v0, v4}, Lcom/android/server/display/SceneDetector;->-$$Nest$fputmIsStepMode(Lcom/android/server/display/SceneDetector;Z)V

    .line 587
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$SceneDetectorHandler;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v0}, Lcom/android/server/display/SceneDetector;->-$$Nest$fgetmMainHandler(Lcom/android/server/display/SceneDetector;)Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, v3, v5}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .line 588
    .local v0, "msg1":Landroid/os/Message;
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 590
    .end local v0    # "msg1":Landroid/os/Message;
    :pswitch_28
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$SceneDetectorHandler;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v0}, Lcom/android/server/display/SceneDetector;->-$$Nest$fgetmProxState(Lcom/android/server/display/SceneDetector;)I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_126

    .line 591
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$SceneDetectorHandler;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v0}, Lcom/android/server/display/SceneDetector;->-$$Nest$fgetmIsMainDarkenEvent(Lcom/android/server/display/SceneDetector;)Z

    move-result v0

    if-eqz v0, :cond_54

    iget-object v0, p0, Lcom/android/server/display/SceneDetector$SceneDetectorHandler;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v0}, Lcom/android/server/display/SceneDetector;->-$$Nest$fgetmAonState(Lcom/android/server/display/SceneDetector;)I

    move-result v0

    if-ne v0, v2, :cond_54

    .line 592
    const-string v0, "SceneDetector"

    const-string/jumbo v1, "prox data not report in time!"

    invoke-static {v0, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 593
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$SceneDetectorHandler;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v0, v4}, Lcom/android/server/display/SceneDetector;->-$$Nest$fputmNeedCheckProximitySensor(Lcom/android/server/display/SceneDetector;Z)V

    .line 594
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$SceneDetectorHandler;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v0}, Lcom/android/server/display/SceneDetector;->-$$Nest$mupdateAutoBrightness(Lcom/android/server/display/SceneDetector;)V

    .line 596
    :cond_54
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$SceneDetectorHandler;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-virtual {v0, v4}, Lcom/android/server/display/SceneDetector;->setStreamProximitySensorEnabled(Z)V

    goto/16 :goto_126

    .line 565
    :pswitch_5b
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$SceneDetectorHandler;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v0}, Lcom/android/server/display/SceneDetector;->-$$Nest$fgetmUseAonFlareEnabled(Lcom/android/server/display/SceneDetector;)Z

    move-result v0

    if-eqz v0, :cond_7a

    .line 566
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$SceneDetectorHandler;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v0}, Lcom/android/server/display/SceneDetector;->-$$Nest$fgetmAonState(Lcom/android/server/display/SceneDetector;)I

    move-result v0

    if-ne v0, v1, :cond_70

    .line 567
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$SceneDetectorHandler;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v0}, Lcom/android/server/display/SceneDetector;->-$$Nest$munregisterAonFlareListener(Lcom/android/server/display/SceneDetector;)V

    .line 569
    :cond_70
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$SceneDetectorHandler;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v0, v4}, Lcom/android/server/display/SceneDetector;->-$$Nest$fputmIsMainDarkenEvent(Lcom/android/server/display/SceneDetector;Z)V

    .line 570
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$SceneDetectorHandler;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v0, v4}, Lcom/android/server/display/SceneDetector;->-$$Nest$mresetServiceConnectedStatus(Lcom/android/server/display/SceneDetector;Z)V

    .line 572
    :cond_7a
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$SceneDetectorHandler;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v0}, Lcom/android/server/display/SceneDetector;->-$$Nest$fgetmUseStepEnabled(Lcom/android/server/display/SceneDetector;)Z

    move-result v0

    if-eqz v0, :cond_a1

    iget-object v0, p0, Lcom/android/server/display/SceneDetector$SceneDetectorHandler;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v0}, Lcom/android/server/display/SceneDetector;->-$$Nest$fgetmStepSensor(Lcom/android/server/display/SceneDetector;)Landroid/hardware/Sensor;

    move-result-object v0

    if-eqz v0, :cond_a1

    .line 573
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$SceneDetectorHandler;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v0, v4}, Lcom/android/server/display/SceneDetector;->-$$Nest$msetStepSensorEnabled(Lcom/android/server/display/SceneDetector;Z)V

    .line 574
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$SceneDetectorHandler;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v0, v4}, Lcom/android/server/display/SceneDetector;->-$$Nest$fputmIsStepMode(Lcom/android/server/display/SceneDetector;Z)V

    .line 575
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$SceneDetectorHandler;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v0}, Lcom/android/server/display/SceneDetector;->-$$Nest$fgetmMainHandler(Lcom/android/server/display/SceneDetector;)Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, v3, v5}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .line 576
    .restart local v0    # "msg1":Landroid/os/Message;
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 578
    .end local v0    # "msg1":Landroid/os/Message;
    :cond_a1
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$SceneDetectorHandler;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v0}, Lcom/android/server/display/SceneDetector;->-$$Nest$fgetmScreenPostureSenseSensor(Lcom/android/server/display/SceneDetector;)Landroid/hardware/Sensor;

    move-result-object v0

    if-eqz v0, :cond_126

    iget-object v0, p0, Lcom/android/server/display/SceneDetector$SceneDetectorHandler;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v0}, Lcom/android/server/display/SceneDetector;->-$$Nest$fgetmDisplayId(Lcom/android/server/display/SceneDetector;)I

    move-result v0

    if-nez v0, :cond_126

    .line 579
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$SceneDetectorHandler;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v0, v4}, Lcom/android/server/display/SceneDetector;->-$$Nest$msetScreenPostureSensorEnabled(Lcom/android/server/display/SceneDetector;Z)V

    .line 580
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$SceneDetectorHandler;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v0}, Lcom/android/server/display/SceneDetector;->-$$Nest$fgetmMainHandler(Lcom/android/server/display/SceneDetector;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/android/server/display/SceneDetector$SceneDetectorHandler$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lcom/android/server/display/SceneDetector$SceneDetectorHandler$$ExternalSyntheticLambda0;-><init>(Lcom/android/server/display/SceneDetector$SceneDetectorHandler;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_126

    .line 556
    :pswitch_c5
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$SceneDetectorHandler;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v0}, Lcom/android/server/display/SceneDetector;->-$$Nest$fgetmUseStepEnabled(Lcom/android/server/display/SceneDetector;)Z

    move-result v0

    if-eqz v0, :cond_da

    iget-object v0, p0, Lcom/android/server/display/SceneDetector$SceneDetectorHandler;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v0}, Lcom/android/server/display/SceneDetector;->-$$Nest$fgetmStepSensor(Lcom/android/server/display/SceneDetector;)Landroid/hardware/Sensor;

    move-result-object v0

    if-eqz v0, :cond_da

    .line 557
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$SceneDetectorHandler;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v0, v2}, Lcom/android/server/display/SceneDetector;->-$$Nest$msetStepSensorEnabled(Lcom/android/server/display/SceneDetector;Z)V

    .line 559
    :cond_da
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$SceneDetectorHandler;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v0}, Lcom/android/server/display/SceneDetector;->-$$Nest$fgetmScreenPostureSenseSensor(Lcom/android/server/display/SceneDetector;)Landroid/hardware/Sensor;

    move-result-object v0

    if-eqz v0, :cond_126

    iget-object v0, p0, Lcom/android/server/display/SceneDetector$SceneDetectorHandler;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v0}, Lcom/android/server/display/SceneDetector;->-$$Nest$fgetmDisplayId(Lcom/android/server/display/SceneDetector;)I

    move-result v0

    if-nez v0, :cond_126

    .line 561
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$SceneDetectorHandler;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v0, v2}, Lcom/android/server/display/SceneDetector;->-$$Nest$msetScreenPostureSensorEnabled(Lcom/android/server/display/SceneDetector;Z)V

    goto :goto_126

    .line 545
    :pswitch_f0
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$SceneDetectorHandler;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v0}, Lcom/android/server/display/SceneDetector;->-$$Nest$fgetmAonState(Lcom/android/server/display/SceneDetector;)I

    move-result v0

    if-ne v0, v1, :cond_126

    .line 546
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$SceneDetectorHandler;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v0}, Lcom/android/server/display/SceneDetector;->-$$Nest$fgetmBrightnessControllerImpl(Lcom/android/server/display/SceneDetector;)Lcom/android/server/display/AutomaticBrightnessControllerImpl;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/display/SceneDetector$SceneDetectorHandler;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v1}, Lcom/android/server/display/SceneDetector;->-$$Nest$fgetmPreAmbientLux(Lcom/android/server/display/SceneDetector;)F

    move-result v1

    invoke-virtual {v0, v3, v1}, Lcom/android/server/display/AutomaticBrightnessControllerImpl;->notifyAonFlareEvents(IF)V

    .line 548
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$SceneDetectorHandler;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v0}, Lcom/android/server/display/SceneDetector;->-$$Nest$fgetmIsMainDarkenEvent(Lcom/android/server/display/SceneDetector;)Z

    move-result v0

    if-eqz v0, :cond_121

    iget-object v0, p0, Lcom/android/server/display/SceneDetector$SceneDetectorHandler;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v0}, Lcom/android/server/display/SceneDetector;->-$$Nest$fgetmProximityStatus(Lcom/android/server/display/SceneDetector;)Z

    move-result v0

    if-nez v0, :cond_121

    .line 549
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$SceneDetectorHandler;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v0, v4}, Lcom/android/server/display/SceneDetector;->-$$Nest$fputmNeedCheckAonFlare(Lcom/android/server/display/SceneDetector;Z)V

    .line 550
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$SceneDetectorHandler;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v0}, Lcom/android/server/display/SceneDetector;->-$$Nest$mupdateAutoBrightness(Lcom/android/server/display/SceneDetector;)V

    .line 552
    :cond_121
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$SceneDetectorHandler;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v0}, Lcom/android/server/display/SceneDetector;->-$$Nest$munregisterAonFlareListener(Lcom/android/server/display/SceneDetector;)V

    .line 604
    :cond_126
    :goto_126
    return-void

    nop

    :pswitch_data_128
    .packed-switch 0x1
        :pswitch_f0
        :pswitch_c5
        :pswitch_5b
        :pswitch_16
        :pswitch_d
        :pswitch_28
        :pswitch_d
        :pswitch_d
        :pswitch_d
        :pswitch_f
    .end packed-switch
.end method
