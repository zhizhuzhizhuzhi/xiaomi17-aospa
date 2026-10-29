.class Lcom/android/server/display/DualSensorPolicy$1;
.super Ljava/lang/Object;
.source "DualSensorPolicy.java"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/display/DualSensorPolicy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/display/DualSensorPolicy;


# direct methods
.method constructor <init>(Lcom/android/server/display/DualSensorPolicy;)V
    .registers 2
    .param p1, "this$0"    # Lcom/android/server/display/DualSensorPolicy;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 141
    iput-object p1, p0, Lcom/android/server/display/DualSensorPolicy$1;->this$0:Lcom/android/server/display/DualSensorPolicy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .registers 3
    .param p1, "sensor"    # Landroid/hardware/Sensor;
    .param p2, "accuracy"    # I

    .line 152
    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .registers 6
    .param p1, "event"    # Landroid/hardware/SensorEvent;

    .line 144
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 145
    .local v0, "time":J
    iget-object v2, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v3, 0x0

    aget v2, v2, v3

    .line 146
    .local v2, "lux":F
    iget-object v3, p0, Lcom/android/server/display/DualSensorPolicy$1;->this$0:Lcom/android/server/display/DualSensorPolicy;

    invoke-static {v3, v0, v1, v2}, Lcom/android/server/display/DualSensorPolicy;->-$$Nest$mhandleAssistLightSensorEvent(Lcom/android/server/display/DualSensorPolicy;JF)V

    .line 147
    return-void
.end method
