.class Lcom/android/server/display/SceneDetector$4;
.super Ljava/lang/Object;
.source "SceneDetector.java"

# interfaces
.implements Landroid/hardware/SensorEventListener;


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
.method public static synthetic $r8$lambda$e4VCByrKCwf8CidYxPo9XC45BLM(Lcom/android/server/display/SceneDetector$4;Landroid/hardware/SensorEvent;)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/android/server/display/SceneDetector$4;->lambda$onSensorChanged$0(Landroid/hardware/SensorEvent;)V

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

    .line 498
    iput-object p1, p0, Lcom/android/server/display/SceneDetector$4;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private synthetic lambda$onSensorChanged$0(Landroid/hardware/SensorEvent;)V
    .registers 5
    .param p1, "event"    # Landroid/hardware/SensorEvent;

    .line 517
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "screen posture sensor value: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v2, 0x0

    aget v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "SceneDetector"

    invoke-static {v1, v0}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 518
    iget-object v0, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v0, v0, v2

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v1

    .line 521
    iget-object v1, p0, Lcom/android/server/display/SceneDetector$4;->this$0:Lcom/android/server/display/SceneDetector;

    .line 518
    if-nez v0, :cond_2f

    .line 519
    const/4 v0, 0x1

    invoke-static {v1, v0}, Lcom/android/server/display/SceneDetector;->-$$Nest$fputmIsReflectiveScene(Lcom/android/server/display/SceneDetector;Z)V

    goto :goto_32

    .line 521
    :cond_2f
    invoke-static {v1, v2}, Lcom/android/server/display/SceneDetector;->-$$Nest$fputmIsReflectiveScene(Lcom/android/server/display/SceneDetector;Z)V

    .line 523
    :goto_32
    return-void
.end method


# virtual methods
.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .registers 3
    .param p1, "sensor"    # Landroid/hardware/Sensor;
    .param p2, "accuracy"    # I

    .line 533
    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .registers 6
    .param p1, "event"    # Landroid/hardware/SensorEvent;

    .line 501
    iget-object v0, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    invoke-virtual {v0}, Landroid/hardware/Sensor;->getType()I

    move-result v0

    sparse-switch v0, :sswitch_data_5c

    goto :goto_5a

    .line 516
    :sswitch_a
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$4;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v0}, Lcom/android/server/display/SceneDetector;->-$$Nest$fgetmMainHandler(Lcom/android/server/display/SceneDetector;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/android/server/display/SceneDetector$4$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1}, Lcom/android/server/display/SceneDetector$4$$ExternalSyntheticLambda0;-><init>(Lcom/android/server/display/SceneDetector$4;Landroid/hardware/SensorEvent;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 524
    goto :goto_5a

    .line 513
    :sswitch_19
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$4;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-virtual {v0, p1}, Lcom/android/server/display/SceneDetector;->onProximitySensorChanged(Landroid/hardware/SensorEvent;)V

    .line 514
    goto :goto_5a

    .line 503
    :sswitch_1f
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$4;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v0}, Lcom/android/server/display/SceneDetector;->-$$Nest$fgetmIsStepMode(Lcom/android/server/display/SceneDetector;)Z

    move-result v0

    if-nez v0, :cond_3f

    .line 504
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$4;->this$0:Lcom/android/server/display/SceneDetector;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/android/server/display/SceneDetector;->-$$Nest$fputmIsStepMode(Lcom/android/server/display/SceneDetector;Z)V

    .line 505
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$4;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v0}, Lcom/android/server/display/SceneDetector;->-$$Nest$fgetmMainHandler(Lcom/android/server/display/SceneDetector;)Landroid/os/Handler;

    move-result-object v0

    const/4 v2, 0x3

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .line 506
    .local v0, "msg":Landroid/os/Message;
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 508
    .end local v0    # "msg":Landroid/os/Message;
    :cond_3f
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$4;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v0}, Lcom/android/server/display/SceneDetector;->-$$Nest$fgetmSceneDetectorHandler(Lcom/android/server/display/SceneDetector;)Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 509
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$4;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v0}, Lcom/android/server/display/SceneDetector;->-$$Nest$fgetmSceneDetectorHandler(Lcom/android/server/display/SceneDetector;)Landroid/os/Handler;

    move-result-object v0

    iget-object v2, p0, Lcom/android/server/display/SceneDetector$4;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v2}, Lcom/android/server/display/SceneDetector;->-$$Nest$fgetmStepModeEffectivenessTime(Lcom/android/server/display/SceneDetector;)I

    move-result v2

    int-to-long v2, v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 511
    nop

    .line 528
    :goto_5a
    return-void

    nop

    :sswitch_data_5c
    .sparse-switch
        0x12 -> :sswitch_1f
        0x1fa263d -> :sswitch_19
        0x1fa2721 -> :sswitch_a
    .end sparse-switch
.end method
