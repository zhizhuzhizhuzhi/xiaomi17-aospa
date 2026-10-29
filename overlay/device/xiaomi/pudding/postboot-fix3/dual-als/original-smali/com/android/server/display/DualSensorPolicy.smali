.class public Lcom/android/server/display/DualSensorPolicy;
.super Ljava/lang/Object;
.source "DualSensorPolicy.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/display/DualSensorPolicy$DualSensorPolicyHandler;
    }
.end annotation


# static fields
.field private static final ASSISTANT_LIGHT_SENSOR_TYPE:I = 0x1fa266f

.field private static DEBUG:Z = false

.field private static final MAIN_LUX_THRESHOLD:F = 10.0f

.field private static final MSG_UPDATE_ASSISTANT_LIGHT_SENSOR_AMBIENT_LUX:I


# instance fields
.field private TAG:Ljava/lang/String;

.field private mAmbientLightHorizonLong:I

.field private mAmbientLightHorizonShort:I

.field private mAssistAmbientLuxValid:Z

.field private mAssistBrighteningSmallThreshold:F

.field private mAssistBrighteningThreshold:F

.field private mAssistDarkeningThreshold:F

.field private mAssistFastAmbientLux:F

.field private mAssistFovAmplifyFactor:F

.field private mAssistLightSensor:Landroid/hardware/Sensor;

.field private mAssistLightSensorBrighteningDebounce:J

.field private mAssistLightSensorDarkeningDebounce:J

.field private mAssistLightSensorEnable:Z

.field private mAssistLightSensorEnableTime:J

.field private mAssistLightSensorRingBuffer:Lcom/android/server/display/AmbientLightRingBuffer;

.field private mAssistLightSensorSmallBrighteningDebounce:J

.field private mAssistLightSensorWarmUpTime:I

.field private mAssistSlowAmbientLux:F

.field private mBrightnessControllerImpl:Lcom/android/server/display/AutomaticBrightnessControllerImpl;

.field private mCurrentAssistLightSensorRate:I

.field private mDisplayId:I

.field private mFovAmplifyFactor:F

.field private mHysteresisLevelsImpl:Lcom/android/server/display/HysteresisLevelsStub;

.field private mLightSensorRate:I

.field private mListener:Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;

.field private mMainFastAmbientLux:F

.field private mMainSlowAmbientLux:F

.field private mOtherDisplayState:I

.field private mPolicyHandler:Landroid/os/Handler;

.field private mSceneDetector:Lcom/android/server/display/SceneDetector;

.field private mSensorListener:Landroid/hardware/SensorEventListener;

.field private mSensorManager:Landroid/hardware/SensorManager;

.field private mSupportAssistFovSensor:Z

.field private mSupportFovSensor:Z

.field private mUseLightSensorFlag:I


# direct methods
.method static bridge synthetic -$$Nest$mhandleAssistLightSensorEvent(Lcom/android/server/display/DualSensorPolicy;JF)V
    .registers 4

    invoke-direct {p0, p1, p2, p3}, Lcom/android/server/display/DualSensorPolicy;->handleAssistLightSensorEvent(JF)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mupdateAssistLightSensorAmbientLux(Lcom/android/server/display/DualSensorPolicy;)V
    .registers 1

    invoke-direct {p0}, Lcom/android/server/display/DualSensorPolicy;->updateAssistLightSensorAmbientLux()V

    return-void
.end method

.method static constructor <clinit>()V
    .registers 1

    .line 30
    const/4 v0, 0x0

    sput-boolean v0, Lcom/android/server/display/DualSensorPolicy;->DEBUG:Z

    return-void
.end method

.method public constructor <init>(Landroid/os/Looper;Landroid/hardware/SensorManager;IIJJIILcom/android/server/display/HysteresisLevelsStub;Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;Lcom/android/server/display/AutomaticBrightnessControllerImpl;ZZFF)V
    .registers 34
    .param p1, "looper"    # Landroid/os/Looper;
    .param p2, "sensormanager"    # Landroid/hardware/SensorManager;
    .param p3, "lightSensorWarmUpTime"    # I
    .param p4, "lightSensorRate"    # I
    .param p5, "brighteningLightDebounceConfig"    # J
    .param p7, "darkeningLightDebounceConfig"    # J
    .param p9, "ambientLightHorizonLong"    # I
    .param p10, "ambientLightHorizonShort"    # I
    .param p11, "hysteresisLevelsImpl"    # Lcom/android/server/display/HysteresisLevelsStub;
    .param p12, "listener"    # Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;
    .param p13, "brightnessControllerImpl"    # Lcom/android/server/display/AutomaticBrightnessControllerImpl;
    .param p14, "supportFov"    # Z
    .param p15, "supportAssistFov"    # Z
    .param p16, "fovAmplifyFactor"    # F
    .param p17, "assistFovAmplifyFactor"    # F

    .line 85
    move-object/from16 v0, p0

    move/from16 v7, p9

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 29
    const-string v1, "DualSensorPolicy"

    iput-object v1, v0, Lcom/android/server/display/DualSensorPolicy;->TAG:Ljava/lang/String;

    .line 44
    const/4 v1, -0x1

    iput v1, v0, Lcom/android/server/display/DualSensorPolicy;->mCurrentAssistLightSensorRate:I

    .line 63
    const/high16 v1, -0x40800000    # -1.0f

    iput v1, v0, Lcom/android/server/display/DualSensorPolicy;->mMainFastAmbientLux:F

    .line 64
    iput v1, v0, Lcom/android/server/display/DualSensorPolicy;->mMainSlowAmbientLux:F

    .line 66
    iput v1, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistFastAmbientLux:F

    .line 67
    iput v1, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistSlowAmbientLux:F

    .line 69
    iput v1, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistBrighteningThreshold:F

    .line 70
    iput v1, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistBrighteningSmallThreshold:F

    .line 71
    iput v1, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistDarkeningThreshold:F

    .line 141
    new-instance v1, Lcom/android/server/display/DualSensorPolicy$1;

    invoke-direct {v1, v0}, Lcom/android/server/display/DualSensorPolicy$1;-><init>(Lcom/android/server/display/DualSensorPolicy;)V

    iput-object v1, v0, Lcom/android/server/display/DualSensorPolicy;->mSensorListener:Landroid/hardware/SensorEventListener;

    .line 86
    new-instance v1, Lcom/android/server/display/DualSensorPolicy$DualSensorPolicyHandler;

    move-object/from16 v8, p1

    invoke-direct {v1, v0, v8}, Lcom/android/server/display/DualSensorPolicy$DualSensorPolicyHandler;-><init>(Lcom/android/server/display/DualSensorPolicy;Landroid/os/Looper;)V

    iput-object v1, v0, Lcom/android/server/display/DualSensorPolicy;->mPolicyHandler:Landroid/os/Handler;

    .line 87
    move-object/from16 v9, p2

    iput-object v9, v0, Lcom/android/server/display/DualSensorPolicy;->mSensorManager:Landroid/hardware/SensorManager;

    .line 88
    iget-object v1, v0, Lcom/android/server/display/DualSensorPolicy;->mSensorManager:Landroid/hardware/SensorManager;

    const v2, 0x1fa266f

    invoke-virtual {v1, v2}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v1

    iput-object v1, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistLightSensor:Landroid/hardware/Sensor;

    .line 89
    move/from16 v10, p14

    iput-boolean v10, v0, Lcom/android/server/display/DualSensorPolicy;->mSupportFovSensor:Z

    .line 90
    move/from16 v11, p15

    iput-boolean v11, v0, Lcom/android/server/display/DualSensorPolicy;->mSupportAssistFovSensor:Z

    .line 91
    move/from16 v12, p16

    iput v12, v0, Lcom/android/server/display/DualSensorPolicy;->mFovAmplifyFactor:F

    .line 92
    move/from16 v13, p17

    iput v13, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistFovAmplifyFactor:F

    .line 94
    iget-boolean v1, v0, Lcom/android/server/display/DualSensorPolicy;->mSupportFovSensor:Z

    if-eqz v1, :cond_64

    iget v1, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistFovAmplifyFactor:F

    const/high16 v2, 0x3f800000    # 1.0f

    cmpl-float v1, v1, v2

    if-eqz v1, :cond_64

    .line 95
    iget-object v1, v0, Lcom/android/server/display/DualSensorPolicy;->mSensorManager:Landroid/hardware/SensorManager;

    const v2, 0x1fa2a90

    invoke-virtual {v1, v2}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v1

    iput-object v1, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistLightSensor:Landroid/hardware/Sensor;

    .line 98
    :cond_64
    move-object/from16 v14, p12

    iput-object v14, v0, Lcom/android/server/display/DualSensorPolicy;->mListener:Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;

    .line 99
    move/from16 v15, p3

    iput v15, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistLightSensorWarmUpTime:I

    .line 100
    move/from16 v1, p4

    iput v1, v0, Lcom/android/server/display/DualSensorPolicy;->mLightSensorRate:I

    .line 101
    move-wide/from16 v2, p5

    iput-wide v2, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistLightSensorBrighteningDebounce:J

    .line 102
    iget-object v4, v0, Lcom/android/server/display/DualSensorPolicy;->mListener:Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;

    invoke-interface {v4}, Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;->getSmallBrighteningDebounce()J

    move-result-wide v4

    iput-wide v4, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistLightSensorSmallBrighteningDebounce:J

    .line 103
    move-wide/from16 v4, p7

    iput-wide v4, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistLightSensorDarkeningDebounce:J

    .line 104
    iput v7, v0, Lcom/android/server/display/DualSensorPolicy;->mAmbientLightHorizonLong:I

    .line 105
    move/from16 v6, p10

    iput v6, v0, Lcom/android/server/display/DualSensorPolicy;->mAmbientLightHorizonShort:I

    .line 106
    move-object/from16 v8, p11

    iput-object v8, v0, Lcom/android/server/display/DualSensorPolicy;->mHysteresisLevelsImpl:Lcom/android/server/display/HysteresisLevelsStub;

    .line 107
    new-instance v1, Lcom/android/server/display/AmbientLightRingBuffer;

    iget v2, v0, Lcom/android/server/display/DualSensorPolicy;->mLightSensorRate:I

    int-to-long v2, v2

    invoke-direct {v1, v2, v3, v7}, Lcom/android/server/display/AmbientLightRingBuffer;-><init>(JI)V

    iput-object v1, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistLightSensorRingBuffer:Lcom/android/server/display/AmbientLightRingBuffer;

    .line 108
    iget-wide v1, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistLightSensorBrighteningDebounce:J

    iget-wide v3, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistLightSensorDarkeningDebounce:J

    iget-wide v5, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistLightSensorSmallBrighteningDebounce:J

    invoke-direct/range {v0 .. v6}, Lcom/android/server/display/DualSensorPolicy;->setUpDebounceConfig(JJJ)V

    .line 110
    move-object/from16 v1, p13

    iput-object v1, v0, Lcom/android/server/display/DualSensorPolicy;->mBrightnessControllerImpl:Lcom/android/server/display/AutomaticBrightnessControllerImpl;

    .line 111
    return-void
.end method

.method private getAssistBrighteningThreshold()F
    .registers 3

    .line 492
    iget v0, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistFastAmbientLux:F

    iget v1, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistBrighteningThreshold:F

    cmpg-float v0, v0, v1

    if-gez v0, :cond_b

    .line 493
    iget v0, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistBrighteningSmallThreshold:F

    goto :goto_d

    :cond_b
    iget v0, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistBrighteningThreshold:F

    .line 492
    :goto_d
    return v0
.end method

.method private getBrighteningThreshold()F
    .registers 3

    .line 497
    iget-object v0, p0, Lcom/android/server/display/DualSensorPolicy;->mListener:Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;

    invoke-interface {v0}, Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;->getBrighteningThreshold()F

    move-result v0

    .line 498
    .local v0, "mainBrighteningThreshold":F
    iget v1, p0, Lcom/android/server/display/DualSensorPolicy;->mMainFastAmbientLux:F

    cmpg-float v1, v1, v0

    if-gez v1, :cond_13

    .line 499
    iget-object v1, p0, Lcom/android/server/display/DualSensorPolicy;->mListener:Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;

    invoke-interface {v1}, Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;->getSmallBrighteningThreshold()F

    move-result v1

    goto :goto_14

    :cond_13
    move v1, v0

    .line 498
    :goto_14
    return v1
.end method

.method private handleAssistLightSensorEvent(JF)V
    .registers 9
    .param p1, "time"    # J
    .param p3, "lux"    # F

    .line 161
    iget-object v0, p0, Lcom/android/server/display/DualSensorPolicy;->mPolicyHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 163
    iget-object v0, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistLightSensorRingBuffer:Lcom/android/server/display/AmbientLightRingBuffer;

    invoke-virtual {v0}, Lcom/android/server/display/AmbientLightRingBuffer;->size()I

    move-result v0

    if-nez v0, :cond_2e

    .line 164
    iget v0, p0, Lcom/android/server/display/DualSensorPolicy;->mLightSensorRate:I

    iget v1, p0, Lcom/android/server/display/DualSensorPolicy;->mCurrentAssistLightSensorRate:I

    if-eq v0, v1, :cond_2e

    .line 165
    iget v0, p0, Lcom/android/server/display/DualSensorPolicy;->mLightSensorRate:I

    iput v0, p0, Lcom/android/server/display/DualSensorPolicy;->mCurrentAssistLightSensorRate:I

    .line 166
    iget-object v0, p0, Lcom/android/server/display/DualSensorPolicy;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/android/server/display/DualSensorPolicy;->mSensorListener:Landroid/hardware/SensorEventListener;

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 167
    iget-object v0, p0, Lcom/android/server/display/DualSensorPolicy;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/android/server/display/DualSensorPolicy;->mSensorListener:Landroid/hardware/SensorEventListener;

    iget-object v2, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistLightSensor:Landroid/hardware/Sensor;

    iget v3, p0, Lcom/android/server/display/DualSensorPolicy;->mCurrentAssistLightSensorRate:I

    mul-int/lit16 v3, v3, 0x3e8

    iget-object v4, p0, Lcom/android/server/display/DualSensorPolicy;->mPolicyHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;ILandroid/os/Handler;)Z

    .line 172
    :cond_2e
    iget-object v0, p0, Lcom/android/server/display/DualSensorPolicy;->mBrightnessControllerImpl:Lcom/android/server/display/AutomaticBrightnessControllerImpl;

    invoke-virtual {v0}, Lcom/android/server/display/AutomaticBrightnessControllerImpl;->getIsTorchOpen()Z

    move-result v0

    if-nez v0, :cond_7d

    iget-object v0, p0, Lcom/android/server/display/DualSensorPolicy;->mBrightnessControllerImpl:Lcom/android/server/display/AutomaticBrightnessControllerImpl;

    invoke-virtual {v0}, Lcom/android/server/display/AutomaticBrightnessControllerImpl;->checkAssistSensorValid()Z

    move-result v0

    if-nez v0, :cond_3f

    goto :goto_7d

    .line 178
    :cond_3f
    iget-object v0, p0, Lcom/android/server/display/DualSensorPolicy;->mBrightnessControllerImpl:Lcom/android/server/display/AutomaticBrightnessControllerImpl;

    invoke-virtual {v0}, Lcom/android/server/display/AutomaticBrightnessControllerImpl;->isRearScreenDevice()Z

    move-result v0

    if-eqz v0, :cond_6b

    iget v0, p0, Lcom/android/server/display/DualSensorPolicy;->mOtherDisplayState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_6b

    iget v0, p0, Lcom/android/server/display/DualSensorPolicy;->mMainFastAmbientLux:F

    const/high16 v1, 0x41200000    # 10.0f

    cmpg-float v0, v0, v1

    if-gtz v0, :cond_6b

    .line 180
    iget-object v0, p0, Lcom/android/server/display/DualSensorPolicy;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "handleAssistantLightSensorEvent: drop assistant light sensor lux due to the other screen is on."

    invoke-static {v0, v1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 182
    iget-object v0, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistLightSensorRingBuffer:Lcom/android/server/display/AmbientLightRingBuffer;

    invoke-virtual {v0}, Lcom/android/server/display/AmbientLightRingBuffer;->clear()V

    .line 183
    iget-object v0, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistLightSensorRingBuffer:Lcom/android/server/display/AmbientLightRingBuffer;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, p2, v1}, Lcom/android/server/display/AmbientLightRingBuffer;->push(JF)V

    .line 184
    invoke-direct {p0, p1, p2}, Lcom/android/server/display/DualSensorPolicy;->updateAssistLightSensorAmbientLux(J)V

    .line 185
    return-void

    .line 187
    :cond_6b
    iget-object v0, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistLightSensorRingBuffer:Lcom/android/server/display/AmbientLightRingBuffer;

    const-wide/16 v1, 0x1388

    sub-long v1, p1, v1

    invoke-virtual {v0, v1, v2}, Lcom/android/server/display/AmbientLightRingBuffer;->prune(J)V

    .line 188
    iget-object v0, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistLightSensorRingBuffer:Lcom/android/server/display/AmbientLightRingBuffer;

    invoke-virtual {v0, p1, p2, p3}, Lcom/android/server/display/AmbientLightRingBuffer;->push(JF)V

    .line 190
    invoke-direct {p0, p1, p2}, Lcom/android/server/display/DualSensorPolicy;->updateAssistLightSensorAmbientLux(J)V

    .line 191
    return-void

    .line 173
    :cond_7d
    :goto_7d
    iget-object v0, p0, Lcom/android/server/display/DualSensorPolicy;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "handleAssistantLightSensorEvent: drop assistant light sensor lux due to flash events or within one second of turning off the torch."

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 175
    return-void
.end method

.method private setUpDebounceConfig(JJJ)V
    .registers 8
    .param p1, "brighteningDebounce"    # J
    .param p3, "darkeningDebounce"    # J
    .param p5, "smallBrighteningDebounce"    # J

    .line 224
    iget-object v0, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistLightSensorRingBuffer:Lcom/android/server/display/AmbientLightRingBuffer;

    invoke-virtual {v0, p1, p2}, Lcom/android/server/display/AmbientLightRingBuffer;->setBrighteningDebounce(J)V

    .line 225
    iget-object v0, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistLightSensorRingBuffer:Lcom/android/server/display/AmbientLightRingBuffer;

    invoke-virtual {v0, p3, p4}, Lcom/android/server/display/AmbientLightRingBuffer;->setDarkeningDebounce(J)V

    .line 226
    iget-object v0, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistLightSensorRingBuffer:Lcom/android/server/display/AmbientLightRingBuffer;

    invoke-virtual {v0, p5, p6}, Lcom/android/server/display/AmbientLightRingBuffer;->setSmallBrighteningDebounce(J)V

    .line 227
    return-void
.end method

.method private updateAssistLightSensorAmbientLux()V
    .registers 6

    .line 230
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 231
    .local v0, "time":J
    iget-object v2, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistLightSensorRingBuffer:Lcom/android/server/display/AmbientLightRingBuffer;

    const-wide/16 v3, 0x1388

    sub-long v3, v0, v3

    invoke-virtual {v2, v3, v4}, Lcom/android/server/display/AmbientLightRingBuffer;->prune(J)V

    .line 232
    invoke-direct {p0, v0, v1}, Lcom/android/server/display/DualSensorPolicy;->updateAssistLightSensorAmbientLux(J)V

    .line 233
    return-void
.end method

.method private updateAssistLightSensorAmbientLux(J)V
    .registers 8
    .param p1, "time"    # J

    .line 236
    iget-boolean v0, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistAmbientLuxValid:Z

    if-nez v0, :cond_2a

    .line 237
    iget v0, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistLightSensorWarmUpTime:I

    int-to-long v0, v0

    iget-wide v2, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistLightSensorEnableTime:J

    add-long/2addr v0, v2

    .line 238
    .local v0, "timeWhenAssistSensorWarmedUp":J
    cmp-long v2, p1, v0

    if-gez v2, :cond_15

    .line 239
    iget-object v2, p0, Lcom/android/server/display/DualSensorPolicy;->mPolicyHandler:Landroid/os/Handler;

    const/4 v3, 0x0

    invoke-virtual {v2, v3, v0, v1}, Landroid/os/Handler;->sendEmptyMessageAtTime(IJ)Z

    .line 241
    return-void

    .line 244
    :cond_15
    iget-object v2, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistLightSensorRingBuffer:Lcom/android/server/display/AmbientLightRingBuffer;

    iget v3, p0, Lcom/android/server/display/DualSensorPolicy;->mAmbientLightHorizonShort:I

    int-to-long v3, v3

    invoke-virtual {v2, p1, p2, v3, v4}, Lcom/android/server/display/AmbientLightRingBuffer;->calculateAmbientLux(JJ)F

    move-result v2

    iput v2, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistFastAmbientLux:F

    .line 245
    sget v2, Lcom/android/server/display/AutomaticBrightnessControllerStub;->HANDLE_ASSIST_LUX_EVENT:I

    iget v3, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistFastAmbientLux:F

    invoke-virtual {p0, v2, v3}, Lcom/android/server/display/DualSensorPolicy;->setAmbientLuxWhenInvalid(IF)V

    .line 246
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistAmbientLuxValid:Z

    .line 248
    .end local v0    # "timeWhenAssistSensorWarmedUp":J
    :cond_2a
    sget v0, Lcom/android/server/display/AutomaticBrightnessControllerStub;->HANDLE_ASSIST_LUX_EVENT:I

    invoke-virtual {p0, p1, p2, v0}, Lcom/android/server/display/DualSensorPolicy;->updateDualSensorPolicy(JI)Z

    .line 249
    return-void
.end method


# virtual methods
.method protected dump(Ljava/io/PrintWriter;)V
    .registers 5
    .param p1, "pw"    # Ljava/io/PrintWriter;

    .line 568
    invoke-virtual {p1}, Ljava/io/PrintWriter;->println()V

    .line 569
    const-string v0, "Dual Sensor Policy State:"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 570
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "  mUseLightSensorFlag="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/server/display/DualSensorPolicy;->mUseLightSensorFlag:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 571
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "  mAssistAmbientLuxValid="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistAmbientLuxValid:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 572
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "  mAssistFastAmbientLux="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistFastAmbientLux:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 573
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "  mAssistSlowAmbientLux="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistSlowAmbientLux:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 574
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "  mAssistBrighteningThreshold="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistBrighteningThreshold:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 575
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "  mAssistBrighteningSmallThreshold="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistBrighteningSmallThreshold:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 576
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "  mAssistDarkeningThreshold="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistDarkeningThreshold:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 577
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "  mAssistLightSensorRingBuffer="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistLightSensorRingBuffer:Lcom/android/server/display/AmbientLightRingBuffer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 578
    const-string v0, "Dual Sensor Policy Configuration:"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 579
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "  mAssistLightSensorBrighteningDebounce="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistLightSensorBrighteningDebounce:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 580
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "  mAssistLightSensorSmallBrighteningDebounce="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistLightSensorSmallBrighteningDebounce:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 581
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "  mAssistLightSensorDarkeningDebounce="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistLightSensorDarkeningDebounce:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 582
    sget-boolean v0, Lcom/android/server/display/DisplayDebugConfig;->DEBUG_ABC:Z

    sput-boolean v0, Lcom/android/server/display/DualSensorPolicy;->DEBUG:Z

    .line 583
    return-void
.end method

.method protected getAmbientLux(FFZ)F
    .registers 5
    .param p1, "preLux"    # F
    .param p2, "updateLux"    # F
    .param p3, "needUpdateLux"    # Z

    .line 276
    if-eqz p3, :cond_4

    move v0, p2

    goto :goto_5

    :cond_4
    move v0, p1

    :goto_5
    return v0
.end method

.method protected getAssistFastAmbientLux()F
    .registers 2

    .line 593
    iget v0, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistFastAmbientLux:F

    return v0
.end method

.method protected getAssistLightSensor()Landroid/hardware/Sensor;
    .registers 2

    .line 586
    iget-object v0, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistLightSensor:Landroid/hardware/Sensor;

    return-object v0
.end method

.method protected getMainAmbientLux()F
    .registers 2

    .line 280
    iget v0, p0, Lcom/android/server/display/DualSensorPolicy;->mMainFastAmbientLux:F

    return v0
.end method

.method protected getMainFastAmbientLux()F
    .registers 2

    .line 607
    iget v0, p0, Lcom/android/server/display/DualSensorPolicy;->mMainFastAmbientLux:F

    return v0
.end method

.method setAmbientLuxWhenInvalid(IF)V
    .registers 8
    .param p1, "event"    # I
    .param p2, "lux"    # F

    .line 530
    sget v0, Lcom/android/server/display/AutomaticBrightnessControllerStub;->HANDLE_MAIN_LUX_EVENT:I

    const/4 v1, 0x1

    if-ne p1, v0, :cond_51

    .line 531
    iget v0, p0, Lcom/android/server/display/DualSensorPolicy;->mUseLightSensorFlag:I

    sget v2, Lcom/android/server/display/AutomaticBrightnessControllerStub;->USE_MAIN_LIGHT_SENSOR:I

    const/4 v3, 0x0

    if-eq v0, v2, :cond_43

    iget v0, p0, Lcom/android/server/display/DualSensorPolicy;->mUseLightSensorFlag:I

    sget v2, Lcom/android/server/display/AutomaticBrightnessControllerStub;->DUAL_SENSOR_LUX_INVALID:I

    if-eq v0, v2, :cond_43

    iget v0, p0, Lcom/android/server/display/DualSensorPolicy;->mUseLightSensorFlag:I

    sget v2, Lcom/android/server/display/AutomaticBrightnessControllerStub;->USE_ASSIST_LIGHT_SENSOR:I

    if-ne v0, v2, :cond_1f

    iget v0, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistFastAmbientLux:F

    cmpl-float v0, p2, v0

    if-ltz v0, :cond_1f

    goto :goto_43

    .line 540
    :cond_1f
    iput p2, p0, Lcom/android/server/display/DualSensorPolicy;->mMainSlowAmbientLux:F

    .line 541
    iput p2, p0, Lcom/android/server/display/DualSensorPolicy;->mMainFastAmbientLux:F

    .line 542
    iget-object v0, p0, Lcom/android/server/display/DualSensorPolicy;->mListener:Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;

    invoke-interface {v0, p1, p2, v3, v3}, Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;->updateAmbientLux(IFZZ)V

    .line 543
    iget-object v0, p0, Lcom/android/server/display/DualSensorPolicy;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "setAmbientLuxWhenInvalid: update brightness using assist light sensor in process, mMainFastAmbientLux: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_b8

    .line 535
    :cond_43
    :goto_43
    sget v0, Lcom/android/server/display/AutomaticBrightnessControllerStub;->USE_MAIN_LIGHT_SENSOR:I

    iput v0, p0, Lcom/android/server/display/DualSensorPolicy;->mUseLightSensorFlag:I

    .line 536
    iput p2, p0, Lcom/android/server/display/DualSensorPolicy;->mMainSlowAmbientLux:F

    .line 537
    iput p2, p0, Lcom/android/server/display/DualSensorPolicy;->mMainFastAmbientLux:F

    .line 538
    iget-object v0, p0, Lcom/android/server/display/DualSensorPolicy;->mListener:Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;

    invoke-interface {v0, p1, p2, v1, v3}, Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;->updateAmbientLux(IFZZ)V

    goto :goto_b8

    .line 545
    :cond_51
    sget v0, Lcom/android/server/display/AutomaticBrightnessControllerStub;->HANDLE_ASSIST_LUX_EVENT:I

    if-ne p1, v0, :cond_b8

    .line 546
    iput p2, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistFastAmbientLux:F

    .line 547
    iput p2, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistSlowAmbientLux:F

    .line 548
    iget-object v0, p0, Lcom/android/server/display/DualSensorPolicy;->mListener:Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;

    invoke-interface {v0}, Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;->getBrighteningThreshold()F

    move-result v0

    .line 549
    .local v0, "mainBrighteningThreshold":F
    iget-object v2, p0, Lcom/android/server/display/DualSensorPolicy;->mListener:Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;

    invoke-interface {v2}, Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;->useDaemonSensorPolicyInProgress()Z

    move-result v2

    .line 550
    .local v2, "useDaemonSensorPolicy":Z
    iget v3, p0, Lcom/android/server/display/DualSensorPolicy;->mUseLightSensorFlag:I

    sget v4, Lcom/android/server/display/AutomaticBrightnessControllerStub;->DUAL_SENSOR_LUX_INVALID:I

    if-ne v3, v4, :cond_6d

    if-nez v2, :cond_8f

    :cond_6d
    iget v3, p0, Lcom/android/server/display/DualSensorPolicy;->mUseLightSensorFlag:I

    sget v4, Lcom/android/server/display/AutomaticBrightnessControllerStub;->USE_MAIN_LIGHT_SENSOR:I

    if-ne v3, v4, :cond_79

    iget v3, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistFastAmbientLux:F

    cmpl-float v3, v3, v0

    if-gtz v3, :cond_8f

    :cond_79
    iget v3, p0, Lcom/android/server/display/DualSensorPolicy;->mUseLightSensorFlag:I

    sget v4, Lcom/android/server/display/AutomaticBrightnessControllerStub;->USE_ASSIST_LIGHT_SENSOR:I

    if-ne v3, v4, :cond_9a

    iget v3, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistFastAmbientLux:F

    iget v4, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistBrighteningThreshold:F

    cmpl-float v3, v3, v4

    if-ltz v3, :cond_9a

    iget v3, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistFastAmbientLux:F

    iget v4, p0, Lcom/android/server/display/DualSensorPolicy;->mMainFastAmbientLux:F

    cmpl-float v3, v3, v4

    if-lez v3, :cond_9a

    .line 557
    :cond_8f
    sget v3, Lcom/android/server/display/AutomaticBrightnessControllerStub;->USE_ASSIST_LIGHT_SENSOR:I

    iput v3, p0, Lcom/android/server/display/DualSensorPolicy;->mUseLightSensorFlag:I

    .line 559
    iget-object v3, p0, Lcom/android/server/display/DualSensorPolicy;->mListener:Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;

    xor-int/lit8 v4, v2, 0x1

    invoke-interface {v3, p1, p2, v1, v4}, Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;->updateAmbientLux(IFZZ)V

    .line 561
    :cond_9a
    iget-object v1, p0, Lcom/android/server/display/DualSensorPolicy;->mHysteresisLevelsImpl:Lcom/android/server/display/HysteresisLevelsStub;

    iget v3, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistFastAmbientLux:F

    invoke-virtual {v1, v3}, Lcom/android/server/display/HysteresisLevelsStub;->getBrighteningThreshold(F)F

    move-result v1

    iput v1, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistBrighteningThreshold:F

    .line 562
    iget-object v1, p0, Lcom/android/server/display/DualSensorPolicy;->mHysteresisLevelsImpl:Lcom/android/server/display/HysteresisLevelsStub;

    iget v3, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistFastAmbientLux:F

    invoke-virtual {v1, v3}, Lcom/android/server/display/HysteresisLevelsStub;->getDarkeningThreshold(F)F

    move-result v1

    iput v1, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistDarkeningThreshold:F

    .line 563
    iget-object v1, p0, Lcom/android/server/display/DualSensorPolicy;->mHysteresisLevelsImpl:Lcom/android/server/display/HysteresisLevelsStub;

    iget v3, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistFastAmbientLux:F

    invoke-virtual {v1, v3}, Lcom/android/server/display/HysteresisLevelsStub;->getBrighteningSmallThreshold(F)F

    move-result v1

    iput v1, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistBrighteningSmallThreshold:F

    .line 565
    .end local v0    # "mainBrighteningThreshold":F
    .end local v2    # "useDaemonSensorPolicy":Z
    :cond_b8
    :goto_b8
    return-void
.end method

.method setDisplayId(I)V
    .registers 4
    .param p1, "displayId"    # I

    .line 125
    iput p1, p0, Lcom/android/server/display/DualSensorPolicy;->mDisplayId:I

    .line 126
    iget v0, p0, Lcom/android/server/display/DualSensorPolicy;->mDisplayId:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_2a

    .line 127
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/android/server/display/DualSensorPolicy;->TAG:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/server/display/DualSensorPolicy;->mDisplayId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/display/DualSensorPolicy;->TAG:Ljava/lang/String;

    .line 129
    :cond_2a
    return-void
.end method

.method setOtherDisplayState(I)V
    .registers 5
    .param p1, "state"    # I

    .line 118
    iget v0, p0, Lcom/android/server/display/DualSensorPolicy;->mOtherDisplayState:I

    if-eq v0, p1, :cond_2a

    .line 119
    iput p1, p0, Lcom/android/server/display/DualSensorPolicy;->mOtherDisplayState:I

    .line 120
    iget-object v0, p0, Lcom/android/server/display/DualSensorPolicy;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "displayId:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/android/server/display/DualSensorPolicy;->mDisplayId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", otherDisplayState:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 122
    :cond_2a
    return-void
.end method

.method setSceneDetector(Lcom/android/server/display/SceneDetector;)V
    .registers 2
    .param p1, "sceneDetector"    # Lcom/android/server/display/SceneDetector;

    .line 114
    iput-object p1, p0, Lcom/android/server/display/DualSensorPolicy;->mSceneDetector:Lcom/android/server/display/SceneDetector;

    .line 115
    return-void
.end method

.method protected setSensorEnabled(Z)V
    .registers 7
    .param p1, "enable"    # Z

    .line 194
    if-eqz p1, :cond_4a

    iget-boolean v0, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistLightSensorEnable:Z

    if-nez v0, :cond_4a

    .line 195
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistLightSensorEnable:Z

    .line 196
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistLightSensorEnableTime:J

    .line 197
    iget v0, p0, Lcom/android/server/display/DualSensorPolicy;->mLightSensorRate:I

    iput v0, p0, Lcom/android/server/display/DualSensorPolicy;->mCurrentAssistLightSensorRate:I

    .line 198
    iget-object v0, p0, Lcom/android/server/display/DualSensorPolicy;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/android/server/display/DualSensorPolicy;->mSensorListener:Landroid/hardware/SensorEventListener;

    iget-object v2, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistLightSensor:Landroid/hardware/Sensor;

    iget v3, p0, Lcom/android/server/display/DualSensorPolicy;->mCurrentAssistLightSensorRate:I

    mul-int/lit16 v3, v3, 0x3e8

    iget-object v4, p0, Lcom/android/server/display/DualSensorPolicy;->mPolicyHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;ILandroid/os/Handler;)Z

    .line 200
    iget-object v0, p0, Lcom/android/server/display/DualSensorPolicy;->TAG:Ljava/lang/String;

    iget-object v1, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistLightSensor:Landroid/hardware/Sensor;

    if-eqz v1, :cond_43

    .line 201
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "register the assist light sensor. type is:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistLightSensor:Landroid/hardware/Sensor;

    invoke-virtual {v2}, Landroid/hardware/Sensor;->getType()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_46

    :cond_43
    const-string/jumbo v1, "register the assist light sensor fail!"

    .line 200
    :goto_46
    invoke-static {v0, v1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_81

    .line 202
    :cond_4a
    if-nez p1, :cond_81

    iget-boolean v0, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistLightSensorEnable:Z

    if-eqz v0, :cond_81

    .line 203
    iget-object v0, p0, Lcom/android/server/display/DualSensorPolicy;->TAG:Ljava/lang/String;

    const-string/jumbo v1, "setSensorEnabled: unregister the assist light sensor."

    invoke-static {v0, v1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 204
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistLightSensorEnable:Z

    .line 205
    iput-boolean v0, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistAmbientLuxValid:Z

    .line 206
    iget-object v1, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistLightSensorRingBuffer:Lcom/android/server/display/AmbientLightRingBuffer;

    invoke-virtual {v1}, Lcom/android/server/display/AmbientLightRingBuffer;->clear()V

    .line 207
    const/4 v1, -0x1

    iput v1, p0, Lcom/android/server/display/DualSensorPolicy;->mCurrentAssistLightSensorRate:I

    .line 208
    sget v1, Lcom/android/server/display/AutomaticBrightnessControllerStub;->DUAL_SENSOR_LUX_INVALID:I

    iput v1, p0, Lcom/android/server/display/DualSensorPolicy;->mUseLightSensorFlag:I

    .line 209
    const/high16 v1, -0x40800000    # -1.0f

    iput v1, p0, Lcom/android/server/display/DualSensorPolicy;->mMainFastAmbientLux:F

    .line 210
    iput v1, p0, Lcom/android/server/display/DualSensorPolicy;->mMainSlowAmbientLux:F

    .line 211
    iput v1, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistFastAmbientLux:F

    .line 212
    iput v1, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistSlowAmbientLux:F

    .line 213
    iget-object v1, p0, Lcom/android/server/display/DualSensorPolicy;->mPolicyHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeMessages(I)V

    .line 214
    iget-object v0, p0, Lcom/android/server/display/DualSensorPolicy;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/android/server/display/DualSensorPolicy;->mSensorListener:Landroid/hardware/SensorEventListener;

    iget-object v2, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistLightSensor:Landroid/hardware/Sensor;

    invoke-virtual {v0, v1, v2}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;)V

    .line 216
    :cond_81
    :goto_81
    return-void
.end method

.method updateAssistLightSensor()V
    .registers 4

    .line 132
    iget-boolean v0, p0, Lcom/android/server/display/DualSensorPolicy;->mSupportFovSensor:Z

    if-eqz v0, :cond_18

    iget v0, p0, Lcom/android/server/display/DualSensorPolicy;->mFovAmplifyFactor:F

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_18

    .line 133
    iget-object v0, p0, Lcom/android/server/display/DualSensorPolicy;->mSensorManager:Landroid/hardware/SensorManager;

    const v1, 0x1fa2a8f

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistLightSensor:Landroid/hardware/Sensor;

    goto :goto_21

    .line 135
    :cond_18
    iget-object v0, p0, Lcom/android/server/display/DualSensorPolicy;->mSensorManager:Landroid/hardware/SensorManager;

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistLightSensor:Landroid/hardware/Sensor;

    .line 137
    :goto_21
    iget-object v0, p0, Lcom/android/server/display/DualSensorPolicy;->TAG:Ljava/lang/String;

    iget-object v1, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistLightSensor:Landroid/hardware/Sensor;

    if-eqz v1, :cond_42

    .line 138
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "update assist light sensor for rear display, type:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/server/display/DualSensorPolicy;->mAssistLightSensor:Landroid/hardware/Sensor;

    invoke-virtual {v2}, Landroid/hardware/Sensor;->getType()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_45

    :cond_42
    const-string/jumbo v1, "update assist light sensor fail!"

    .line 137
    :goto_45
    invoke-static {v0, v1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    return-void
.end method

.method protected updateBrightnessUsingMainLightSensor()Z
    .registers 3

    .line 299
    iget v0, p0, Lcom/android/server/display/DualSensorPolicy;->mUseLightSensorFlag:I

    sget v1, Lcom/android/server/display/AutomaticBrightnessControllerStub;->USE_MAIN_LIGHT_SENSOR:I

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    return v0
.end method

.method protected updateDualSensorPolicy(JI)Z
    .registers 27
    .param p1, "time"    # J
    .param p3, "event"    # I

    .line 336
    move-object/from16 v0, p0

    move-wide/from16 v2, p1

    move/from16 v7, p3

    sget v1, Lcom/android/server/display/AutomaticBrightnessControllerStub;->HANDLE_MAIN_LUX_EVENT:I

    const-string v8, ", mAssistSlowAmbientLux: "

    const-string v9, ", mMainSlowAmbientLux: "

    if-ne v7, v1, :cond_2e4

    .line 337
    iget-object v1, v0, Lcom/android/server/display/DualSensorPolicy;->mListener:Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;

    invoke-interface {v1, v2, v3}, Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;->calculateSlowAmbientLux(J)F

    move-result v1

    iput v1, v0, Lcom/android/server/display/DualSensorPolicy;->mMainSlowAmbientLux:F

    .line 338
    iget-object v1, v0, Lcom/android/server/display/DualSensorPolicy;->mListener:Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;

    invoke-interface {v1, v2, v3}, Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;->calculateFastAmbientLux(J)F

    move-result v1

    iput v1, v0, Lcom/android/server/display/DualSensorPolicy;->mMainFastAmbientLux:F

    .line 339
    invoke-direct {v0}, Lcom/android/server/display/DualSensorPolicy;->getBrighteningThreshold()F

    move-result v1

    .line 340
    .local v1, "mainBrighteningThreshold":F
    iget-object v4, v0, Lcom/android/server/display/DualSensorPolicy;->mListener:Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;

    invoke-interface {v4}, Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;->getDarkeningThreshold()F

    move-result v4

    .line 341
    .local v4, "mainDarkeningThreshold":F
    iget-object v5, v0, Lcom/android/server/display/DualSensorPolicy;->mListener:Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;

    iget v6, v0, Lcom/android/server/display/DualSensorPolicy;->mMainFastAmbientLux:F

    invoke-interface {v5, v2, v3, v6}, Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;->updateNextBrighteningTransition(JF)J

    move-result-wide v5

    .line 342
    .local v5, "nextBrightenTransition":J
    iget-object v12, v0, Lcom/android/server/display/DualSensorPolicy;->mListener:Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;

    invoke-interface {v12, v2, v3}, Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;->updateNextDarkeningTransition(J)J

    move-result-wide v12

    .line 343
    .local v12, "nextDarkenTransition":J
    iget v14, v0, Lcom/android/server/display/DualSensorPolicy;->mMainSlowAmbientLux:F

    cmpl-float v14, v14, v1

    const-string v15, ", next small brightening threshold of main light sensor: "

    const-string v11, ", next darkening threshold of main light sensor: "

    const-string/jumbo v10, "updateDualSensorPolicy: next brightening threshold of main light sensor: "

    move-wide/from16 v17, v5

    .end local v5    # "nextBrightenTransition":J
    .local v17, "nextBrightenTransition":J
    const-string/jumbo v5, "updateDualSensorPolicy: update brightness using assist light sensor in process, mMainFastAmbientLux: "

    const-string v6, ", mainDarkeningThreshold: "

    move-wide/from16 v19, v12

    .end local v12    # "nextDarkenTransition":J
    .local v19, "nextDarkenTransition":J
    const-string v12, ", mainBrighteningThreshold: "

    const-string/jumbo v13, "updateDualSensorPolicy: update ambient lux using main light sensor, mMainFastAmbientLux: "

    move/from16 v21, v14

    const-string v14, ", mAssistFastAmbientLux: "

    if-ltz v21, :cond_13a

    move-object/from16 v21, v8

    iget v8, v0, Lcom/android/server/display/DualSensorPolicy;->mMainFastAmbientLux:F

    cmpl-float v8, v8, v1

    if-ltz v8, :cond_13c

    cmp-long v8, v17, v2

    if-gtz v8, :cond_13c

    .line 346
    iget v8, v0, Lcom/android/server/display/DualSensorPolicy;->mUseLightSensorFlag:I

    move-object/from16 v22, v15

    sget v15, Lcom/android/server/display/AutomaticBrightnessControllerStub;->USE_MAIN_LIGHT_SENSOR:I

    if-eq v8, v15, :cond_a3

    iget v8, v0, Lcom/android/server/display/DualSensorPolicy;->mUseLightSensorFlag:I

    sget v15, Lcom/android/server/display/AutomaticBrightnessControllerStub;->USE_ASSIST_LIGHT_SENSOR:I

    if-ne v8, v15, :cond_78

    iget v8, v0, Lcom/android/server/display/DualSensorPolicy;->mMainFastAmbientLux:F

    iget v15, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistFastAmbientLux:F

    cmpl-float v8, v8, v15

    if-ltz v8, :cond_78

    goto :goto_a3

    .line 362
    :cond_78
    iget-object v6, v0, Lcom/android/server/display/DualSensorPolicy;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v8, v0, Lcom/android/server/display/DualSensorPolicy;->mMainFastAmbientLux:F

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v8, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistFastAmbientLux:F

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v6, v5}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 365
    iget-object v5, v0, Lcom/android/server/display/DualSensorPolicy;->mListener:Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;

    iget v6, v0, Lcom/android/server/display/DualSensorPolicy;->mMainFastAmbientLux:F

    const/4 v8, 0x0

    invoke-interface {v5, v7, v6, v8, v8}, Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;->updateAmbientLux(IFZZ)V

    goto :goto_f2

    .line 349
    :cond_a3
    :goto_a3
    sget v5, Lcom/android/server/display/AutomaticBrightnessControllerStub;->USE_MAIN_LIGHT_SENSOR:I

    iput v5, v0, Lcom/android/server/display/DualSensorPolicy;->mUseLightSensorFlag:I

    .line 350
    iget-object v5, v0, Lcom/android/server/display/DualSensorPolicy;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v13, v0, Lcom/android/server/display/DualSensorPolicy;->mMainFastAmbientLux:F

    invoke-virtual {v8, v13}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, v0, Lcom/android/server/display/DualSensorPolicy;->mMainSlowAmbientLux:F

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 355
    iget-object v5, v0, Lcom/android/server/display/DualSensorPolicy;->mBrightnessControllerImpl:Lcom/android/server/display/AutomaticBrightnessControllerImpl;

    invoke-virtual {v5}, Lcom/android/server/display/AutomaticBrightnessControllerImpl;->isAonFlareEnabled()Z

    move-result v5

    if-eqz v5, :cond_ea

    .line 356
    iget-object v5, v0, Lcom/android/server/display/DualSensorPolicy;->mSceneDetector:Lcom/android/server/display/SceneDetector;

    iget v6, v0, Lcom/android/server/display/DualSensorPolicy;->mMainFastAmbientLux:F

    const/4 v8, 0x0

    invoke-virtual {v5, v7, v6, v8}, Lcom/android/server/display/SceneDetector;->updateAmbientLux(IFZ)V

    goto :goto_f2

    .line 358
    :cond_ea
    iget-object v5, v0, Lcom/android/server/display/DualSensorPolicy;->mListener:Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;

    iget v6, v0, Lcom/android/server/display/DualSensorPolicy;->mMainFastAmbientLux:F

    const/4 v8, 0x1

    invoke-interface {v5, v7, v6, v8, v8}, Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;->updateAmbientLux(IFZZ)V

    .line 367
    :goto_f2
    iget-object v5, v0, Lcom/android/server/display/DualSensorPolicy;->mListener:Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;

    invoke-interface {v5, v2, v3}, Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;->updateNextBrighteningTransition(J)J

    move-result-wide v5

    .line 368
    .end local v17    # "nextBrightenTransition":J
    .restart local v5    # "nextBrightenTransition":J
    iget-object v8, v0, Lcom/android/server/display/DualSensorPolicy;->mListener:Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;

    invoke-interface {v8, v2, v3}, Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;->updateNextDarkeningTransition(J)J

    move-result-wide v12

    .line 369
    .end local v19    # "nextDarkenTransition":J
    .restart local v12    # "nextDarkenTransition":J
    iget-object v8, v0, Lcom/android/server/display/DualSensorPolicy;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, v0, Lcom/android/server/display/DualSensorPolicy;->mListener:Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;

    invoke-interface {v10}, Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;->getBrighteningThreshold()F

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, v0, Lcom/android/server/display/DualSensorPolicy;->mListener:Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;

    .line 370
    invoke-interface {v10}, Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;->getDarkeningThreshold()F

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v9

    move-object/from16 v15, v22

    invoke-virtual {v9, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, v0, Lcom/android/server/display/DualSensorPolicy;->mListener:Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;

    .line 371
    invoke-interface {v10}, Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;->getSmallBrighteningThreshold()F

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 369
    invoke-static {v8, v9}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2aa

    .line 343
    .end local v5    # "nextBrightenTransition":J
    .end local v12    # "nextDarkenTransition":J
    .restart local v17    # "nextBrightenTransition":J
    .restart local v19    # "nextDarkenTransition":J
    :cond_13a
    move-object/from16 v21, v8

    .line 372
    :cond_13c
    iget v8, v0, Lcom/android/server/display/DualSensorPolicy;->mMainFastAmbientLux:F

    cmpg-float v8, v8, v4

    if-gtz v8, :cond_2a6

    cmp-long v8, v19, v2

    if-gtz v8, :cond_2a6

    .line 373
    iget v8, v0, Lcom/android/server/display/DualSensorPolicy;->mUseLightSensorFlag:I

    move-object/from16 v22, v15

    sget v15, Lcom/android/server/display/AutomaticBrightnessControllerStub;->USE_MAIN_LIGHT_SENSOR:I

    if-eq v8, v15, :cond_154

    iget v8, v0, Lcom/android/server/display/DualSensorPolicy;->mUseLightSensorFlag:I

    sget v15, Lcom/android/server/display/AutomaticBrightnessControllerStub;->USE_ASSIST_LIGHT_SENSOR:I

    if-ne v8, v15, :cond_1b8

    :cond_154
    iget v8, v0, Lcom/android/server/display/DualSensorPolicy;->mMainFastAmbientLux:F

    iget v15, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistFastAmbientLux:F

    cmpl-float v8, v8, v15

    if-ltz v8, :cond_1b8

    .line 376
    sget v5, Lcom/android/server/display/AutomaticBrightnessControllerStub;->USE_MAIN_LIGHT_SENSOR:I

    iput v5, v0, Lcom/android/server/display/DualSensorPolicy;->mUseLightSensorFlag:I

    .line 377
    iget-object v5, v0, Lcom/android/server/display/DualSensorPolicy;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v13, v0, Lcom/android/server/display/DualSensorPolicy;->mMainFastAmbientLux:F

    invoke-virtual {v8, v13}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, v0, Lcom/android/server/display/DualSensorPolicy;->mMainSlowAmbientLux:F

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 382
    iget-object v5, v0, Lcom/android/server/display/DualSensorPolicy;->mBrightnessControllerImpl:Lcom/android/server/display/AutomaticBrightnessControllerImpl;

    invoke-virtual {v5}, Lcom/android/server/display/AutomaticBrightnessControllerImpl;->isAonFlareEnabled()Z

    move-result v5

    if-nez v5, :cond_1ae

    iget-object v5, v0, Lcom/android/server/display/DualSensorPolicy;->mSceneDetector:Lcom/android/server/display/SceneDetector;

    .line 383
    invoke-virtual {v5}, Lcom/android/server/display/SceneDetector;->isNeedStreamProximitySensorEnabled()Z

    move-result v5

    if-eqz v5, :cond_1a4

    const/4 v8, 0x1

    goto :goto_1af

    .line 386
    :cond_1a4
    iget-object v5, v0, Lcom/android/server/display/DualSensorPolicy;->mListener:Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;

    iget v6, v0, Lcom/android/server/display/DualSensorPolicy;->mMainFastAmbientLux:F

    const/4 v8, 0x1

    invoke-interface {v5, v7, v6, v8, v8}, Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;->updateAmbientLux(IFZZ)V

    goto/16 :goto_25f

    .line 382
    :cond_1ae
    const/4 v8, 0x1

    .line 384
    :goto_1af
    iget-object v5, v0, Lcom/android/server/display/DualSensorPolicy;->mSceneDetector:Lcom/android/server/display/SceneDetector;

    iget v6, v0, Lcom/android/server/display/DualSensorPolicy;->mMainFastAmbientLux:F

    invoke-virtual {v5, v7, v6, v8}, Lcom/android/server/display/SceneDetector;->updateAmbientLux(IFZ)V

    goto/16 :goto_25f

    .line 388
    :cond_1b8
    iget v6, v0, Lcom/android/server/display/DualSensorPolicy;->mUseLightSensorFlag:I

    sget v8, Lcom/android/server/display/AutomaticBrightnessControllerStub;->USE_MAIN_LIGHT_SENSOR:I

    if-ne v6, v8, :cond_235

    .line 389
    sget v5, Lcom/android/server/display/AutomaticBrightnessControllerStub;->USE_ASSIST_LIGHT_SENSOR:I

    iput v5, v0, Lcom/android/server/display/DualSensorPolicy;->mUseLightSensorFlag:I

    .line 390
    iget-object v5, v0, Lcom/android/server/display/DualSensorPolicy;->mHysteresisLevelsImpl:Lcom/android/server/display/HysteresisLevelsStub;

    iget v6, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistFastAmbientLux:F

    invoke-virtual {v5, v6}, Lcom/android/server/display/HysteresisLevelsStub;->getBrighteningThreshold(F)F

    move-result v5

    iput v5, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistBrighteningThreshold:F

    .line 391
    iget-object v5, v0, Lcom/android/server/display/DualSensorPolicy;->mHysteresisLevelsImpl:Lcom/android/server/display/HysteresisLevelsStub;

    iget v6, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistFastAmbientLux:F

    invoke-virtual {v5, v6}, Lcom/android/server/display/HysteresisLevelsStub;->getDarkeningThreshold(F)F

    move-result v5

    iput v5, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistDarkeningThreshold:F

    .line 392
    iget-object v5, v0, Lcom/android/server/display/DualSensorPolicy;->mHysteresisLevelsImpl:Lcom/android/server/display/HysteresisLevelsStub;

    iget v6, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistFastAmbientLux:F

    invoke-virtual {v5, v6}, Lcom/android/server/display/HysteresisLevelsStub;->getBrighteningSmallThreshold(F)F

    move-result v5

    iput v5, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistBrighteningSmallThreshold:F

    .line 393
    iget-object v5, v0, Lcom/android/server/display/DualSensorPolicy;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "updateDualSensorPolicy: switch assist light sensor for lux update from main light sensor, mMainFastAmbientLux: "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v8, v0, Lcom/android/server/display/DualSensorPolicy;->mMainFastAmbientLux:F

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v8, v0, Lcom/android/server/display/DualSensorPolicy;->mMainSlowAmbientLux:F

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v8, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistFastAmbientLux:F

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v8, v21

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v8, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistSlowAmbientLux:F

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 398
    iget-object v5, v0, Lcom/android/server/display/DualSensorPolicy;->mBrightnessControllerImpl:Lcom/android/server/display/AutomaticBrightnessControllerImpl;

    invoke-virtual {v5}, Lcom/android/server/display/AutomaticBrightnessControllerImpl;->isAonFlareEnabled()Z

    move-result v5

    if-eqz v5, :cond_22c

    .line 399
    iget-object v5, v0, Lcom/android/server/display/DualSensorPolicy;->mSceneDetector:Lcom/android/server/display/SceneDetector;

    iget v6, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistFastAmbientLux:F

    const/4 v8, 0x0

    invoke-virtual {v5, v7, v6, v8}, Lcom/android/server/display/SceneDetector;->updateAmbientLux(IFZ)V

    goto :goto_25f

    .line 401
    :cond_22c
    iget-object v5, v0, Lcom/android/server/display/DualSensorPolicy;->mListener:Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;

    iget v6, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistFastAmbientLux:F

    const/4 v8, 0x1

    invoke-interface {v5, v7, v6, v8, v8}, Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;->updateAmbientLux(IFZZ)V

    goto :goto_25f

    .line 404
    :cond_235
    iget-object v6, v0, Lcom/android/server/display/DualSensorPolicy;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v8, v0, Lcom/android/server/display/DualSensorPolicy;->mMainFastAmbientLux:F

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v8, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistFastAmbientLux:F

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v6, v5}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 407
    iget-object v5, v0, Lcom/android/server/display/DualSensorPolicy;->mListener:Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;

    iget v6, v0, Lcom/android/server/display/DualSensorPolicy;->mMainFastAmbientLux:F

    const/4 v8, 0x0

    invoke-interface {v5, v7, v6, v8, v8}, Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;->updateAmbientLux(IFZZ)V

    .line 409
    :goto_25f
    iget-object v5, v0, Lcom/android/server/display/DualSensorPolicy;->mListener:Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;

    invoke-interface {v5, v2, v3}, Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;->updateNextBrighteningTransition(J)J

    move-result-wide v5

    .line 410
    .end local v17    # "nextBrightenTransition":J
    .restart local v5    # "nextBrightenTransition":J
    iget-object v8, v0, Lcom/android/server/display/DualSensorPolicy;->mListener:Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;

    invoke-interface {v8, v2, v3}, Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;->updateNextDarkeningTransition(J)J

    move-result-wide v12

    .line 411
    .end local v19    # "nextDarkenTransition":J
    .restart local v12    # "nextDarkenTransition":J
    iget-object v8, v0, Lcom/android/server/display/DualSensorPolicy;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, v0, Lcom/android/server/display/DualSensorPolicy;->mListener:Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;

    invoke-interface {v10}, Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;->getBrighteningThreshold()F

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, v0, Lcom/android/server/display/DualSensorPolicy;->mListener:Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;

    .line 412
    invoke-interface {v10}, Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;->getDarkeningThreshold()F

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v9

    move-object/from16 v15, v22

    invoke-virtual {v9, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, v0, Lcom/android/server/display/DualSensorPolicy;->mListener:Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;

    .line 413
    invoke-interface {v10}, Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;->getSmallBrighteningThreshold()F

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 411
    invoke-static {v8, v9}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2aa

    .line 415
    .end local v5    # "nextBrightenTransition":J
    .end local v12    # "nextDarkenTransition":J
    .restart local v17    # "nextBrightenTransition":J
    .restart local v19    # "nextDarkenTransition":J
    :cond_2a6
    move-wide/from16 v5, v17

    move-wide/from16 v12, v19

    .end local v17    # "nextBrightenTransition":J
    .end local v19    # "nextDarkenTransition":J
    .restart local v5    # "nextBrightenTransition":J
    .restart local v12    # "nextDarkenTransition":J
    :goto_2aa
    invoke-static {v12, v13, v5, v6}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v8

    .line 416
    .local v8, "nextTransitionTime":J
    cmp-long v10, v8, v2

    if-lez v10, :cond_2b4

    move-wide v10, v8

    goto :goto_2b8

    :cond_2b4
    iget v10, v0, Lcom/android/server/display/DualSensorPolicy;->mLightSensorRate:I

    int-to-long v10, v10

    add-long/2addr v10, v2

    .line 417
    .end local v8    # "nextTransitionTime":J
    .local v10, "nextTransitionTime":J
    :goto_2b8
    sget-boolean v8, Lcom/android/server/display/DualSensorPolicy;->DEBUG:Z

    if-eqz v8, :cond_2dd

    .line 418
    iget-object v8, v0, Lcom/android/server/display/DualSensorPolicy;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "updateDualSensorPolicy: next transition time of main light sensor: "

    invoke-virtual {v9, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 419
    invoke-static {v10, v11}, Landroid/util/TimeUtils;->formatUptime(J)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v9, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 418
    invoke-static {v8, v9}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 421
    :cond_2dd
    iget-object v8, v0, Lcom/android/server/display/DualSensorPolicy;->mListener:Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;

    invoke-interface {v8, v10, v11}, Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;->sendUpdateAmbientLuxMessage(J)V

    .end local v1    # "mainBrighteningThreshold":F
    .end local v4    # "mainDarkeningThreshold":F
    .end local v5    # "nextBrightenTransition":J
    .end local v10    # "nextTransitionTime":J
    .end local v12    # "nextDarkenTransition":J
    goto/16 :goto_4d1

    .line 422
    :cond_2e4
    sget v1, Lcom/android/server/display/AutomaticBrightnessControllerStub;->HANDLE_ASSIST_LUX_EVENT:I

    if-ne v7, v1, :cond_4d1

    .line 423
    iget-object v1, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistLightSensorRingBuffer:Lcom/android/server/display/AmbientLightRingBuffer;

    iget v4, v0, Lcom/android/server/display/DualSensorPolicy;->mAmbientLightHorizonLong:I

    int-to-long v4, v4

    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/android/server/display/AmbientLightRingBuffer;->calculateAmbientLux(JJ)F

    move-result v1

    iput v1, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistSlowAmbientLux:F

    .line 424
    iget-object v1, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistLightSensorRingBuffer:Lcom/android/server/display/AmbientLightRingBuffer;

    iget v4, v0, Lcom/android/server/display/DualSensorPolicy;->mAmbientLightHorizonShort:I

    int-to-long v4, v4

    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/android/server/display/AmbientLightRingBuffer;->calculateAmbientLux(JJ)F

    move-result v1

    iput v1, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistFastAmbientLux:F

    .line 425
    iget-object v1, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistLightSensorRingBuffer:Lcom/android/server/display/AmbientLightRingBuffer;

    iget v4, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistFastAmbientLux:F

    iget v5, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistBrighteningThreshold:F

    iget v6, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistBrighteningSmallThreshold:F

    invoke-virtual/range {v1 .. v6}, Lcom/android/server/display/AmbientLightRingBuffer;->nextAmbientLightBrighteningTransition(JFFF)J

    move-result-wide v4

    .line 427
    .local v4, "nextBrightenTransition":J
    iget-object v1, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistLightSensorRingBuffer:Lcom/android/server/display/AmbientLightRingBuffer;

    iget v6, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistDarkeningThreshold:F

    invoke-virtual {v1, v2, v3, v6}, Lcom/android/server/display/AmbientLightRingBuffer;->nextAmbientLightDarkeningTransition(JF)J

    move-result-wide v10

    .line 429
    .local v10, "nextDarkenTransition":J
    iget-object v1, v0, Lcom/android/server/display/DualSensorPolicy;->mListener:Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;

    invoke-interface {v1}, Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;->getBrighteningThreshold()F

    move-result v1

    .line 430
    .restart local v1    # "mainBrighteningThreshold":F
    invoke-direct {v0}, Lcom/android/server/display/DualSensorPolicy;->getAssistBrighteningThreshold()F

    move-result v6

    .line 431
    .local v6, "assistBrighteningThreshold":F
    iget v12, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistSlowAmbientLux:F

    cmpl-float v12, v12, v6

    if-ltz v12, :cond_32c

    iget v12, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistFastAmbientLux:F

    cmpl-float v12, v12, v6

    if-ltz v12, :cond_32c

    cmp-long v12, v4, v2

    if-lez v12, :cond_338

    :cond_32c
    iget v12, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistFastAmbientLux:F

    iget v13, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistDarkeningThreshold:F

    cmpg-float v12, v12, v13

    if-gtz v12, :cond_497

    cmp-long v12, v10, v2

    if-gtz v12, :cond_497

    .line 436
    :cond_338
    iget v12, v0, Lcom/android/server/display/DualSensorPolicy;->mUseLightSensorFlag:I

    sget v13, Lcom/android/server/display/AutomaticBrightnessControllerStub;->USE_MAIN_LIGHT_SENSOR:I

    if-ne v12, v13, :cond_34a

    iget v12, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistSlowAmbientLux:F

    cmpl-float v12, v12, v1

    if-lez v12, :cond_34a

    iget v12, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistFastAmbientLux:F

    cmpl-float v12, v12, v1

    if-gtz v12, :cond_358

    :cond_34a
    iget v12, v0, Lcom/android/server/display/DualSensorPolicy;->mUseLightSensorFlag:I

    sget v13, Lcom/android/server/display/AutomaticBrightnessControllerStub;->USE_ASSIST_LIGHT_SENSOR:I

    if-ne v12, v13, :cond_3d8

    iget v12, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistFastAmbientLux:F

    iget v13, v0, Lcom/android/server/display/DualSensorPolicy;->mMainFastAmbientLux:F

    cmpl-float v12, v12, v13

    if-lez v12, :cond_3d8

    .line 441
    :cond_358
    iget-object v9, v0, Lcom/android/server/display/DualSensorPolicy;->mBrightnessControllerImpl:Lcom/android/server/display/AutomaticBrightnessControllerImpl;

    invoke-virtual {v9}, Lcom/android/server/display/AutomaticBrightnessControllerImpl;->isRearScreenDevice()Z

    move-result v9

    if-eqz v9, :cond_371

    iget-object v9, v0, Lcom/android/server/display/DualSensorPolicy;->mSceneDetector:Lcom/android/server/display/SceneDetector;

    .line 442
    invoke-virtual {v9}, Lcom/android/server/display/SceneDetector;->isReflectiveScene()Z

    move-result v9

    if-eqz v9, :cond_371

    .line 443
    iget-object v8, v0, Lcom/android/server/display/DualSensorPolicy;->TAG:Ljava/lang/String;

    const-string v9, "drop this brightness because of is reflective scene!"

    invoke-static {v8, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_436

    .line 445
    :cond_371
    sget v9, Lcom/android/server/display/AutomaticBrightnessControllerStub;->USE_ASSIST_LIGHT_SENSOR:I

    iput v9, v0, Lcom/android/server/display/DualSensorPolicy;->mUseLightSensorFlag:I

    .line 446
    iget-object v9, v0, Lcom/android/server/display/DualSensorPolicy;->TAG:Ljava/lang/String;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v13, "updateDualSensorPolicy: update ambient lux using assist light sensor, mAssistFastAmbientLux: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget v13, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistFastAmbientLux:F

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v12, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistSlowAmbientLux:F

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v12, ", mAssistBrighteningThreshold: "

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v12, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistBrighteningThreshold:F

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v12, ", mAssistBrighteningSmallThreshold: "

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v12, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistBrighteningSmallThreshold:F

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v12, ", mAssistDarkeningThreshold: "

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v12, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistDarkeningThreshold:F

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v9, v8}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 452
    iget-object v8, v0, Lcom/android/server/display/DualSensorPolicy;->mBrightnessControllerImpl:Lcom/android/server/display/AutomaticBrightnessControllerImpl;

    invoke-virtual {v8}, Lcom/android/server/display/AutomaticBrightnessControllerImpl;->isAonFlareEnabled()Z

    move-result v8

    if-eqz v8, :cond_3cf

    .line 453
    iget-object v8, v0, Lcom/android/server/display/DualSensorPolicy;->mSceneDetector:Lcom/android/server/display/SceneDetector;

    iget v9, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistFastAmbientLux:F

    const/4 v12, 0x0

    invoke-virtual {v8, v7, v9, v12}, Lcom/android/server/display/SceneDetector;->updateAmbientLux(IFZ)V

    goto :goto_436

    .line 455
    :cond_3cf
    iget-object v8, v0, Lcom/android/server/display/DualSensorPolicy;->mListener:Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;

    iget v9, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistFastAmbientLux:F

    const/4 v12, 0x1

    invoke-interface {v8, v7, v9, v12, v12}, Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;->updateAmbientLux(IFZZ)V

    goto :goto_436

    .line 458
    :cond_3d8
    iget v12, v0, Lcom/android/server/display/DualSensorPolicy;->mUseLightSensorFlag:I

    sget v13, Lcom/android/server/display/AutomaticBrightnessControllerStub;->USE_ASSIST_LIGHT_SENSOR:I

    if-ne v12, v13, :cond_436

    .line 459
    sget v12, Lcom/android/server/display/AutomaticBrightnessControllerStub;->USE_MAIN_LIGHT_SENSOR:I

    iput v12, v0, Lcom/android/server/display/DualSensorPolicy;->mUseLightSensorFlag:I

    .line 460
    iget-object v12, v0, Lcom/android/server/display/DualSensorPolicy;->TAG:Ljava/lang/String;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "updateDualSensorPolicy: switch main light sensor for lux update from assist light sensor, mAssistFastAmbientLux: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget v14, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistFastAmbientLux:F

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v13, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistSlowAmbientLux:F

    invoke-virtual {v8, v13}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v13, ", mMainFastAmbientLux: "

    invoke-virtual {v8, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v13, v0, Lcom/android/server/display/DualSensorPolicy;->mMainFastAmbientLux:F

    invoke-virtual {v8, v13}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, v0, Lcom/android/server/display/DualSensorPolicy;->mMainSlowAmbientLux:F

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v12, v8}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 465
    iget-object v8, v0, Lcom/android/server/display/DualSensorPolicy;->mBrightnessControllerImpl:Lcom/android/server/display/AutomaticBrightnessControllerImpl;

    invoke-virtual {v8}, Lcom/android/server/display/AutomaticBrightnessControllerImpl;->isAonFlareEnabled()Z

    move-result v8

    if-eqz v8, :cond_42e

    .line 466
    iget-object v8, v0, Lcom/android/server/display/DualSensorPolicy;->mSceneDetector:Lcom/android/server/display/SceneDetector;

    iget v9, v0, Lcom/android/server/display/DualSensorPolicy;->mMainFastAmbientLux:F

    const/4 v12, 0x0

    invoke-virtual {v8, v7, v9, v12}, Lcom/android/server/display/SceneDetector;->updateAmbientLux(IFZ)V

    goto :goto_436

    .line 468
    :cond_42e
    iget-object v8, v0, Lcom/android/server/display/DualSensorPolicy;->mListener:Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;

    iget v9, v0, Lcom/android/server/display/DualSensorPolicy;->mMainFastAmbientLux:F

    const/4 v12, 0x1

    invoke-interface {v8, v7, v9, v12, v12}, Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;->updateAmbientLux(IFZZ)V

    .line 471
    :cond_436
    :goto_436
    iget-object v8, v0, Lcom/android/server/display/DualSensorPolicy;->mHysteresisLevelsImpl:Lcom/android/server/display/HysteresisLevelsStub;

    iget v9, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistFastAmbientLux:F

    invoke-virtual {v8, v9}, Lcom/android/server/display/HysteresisLevelsStub;->getBrighteningThreshold(F)F

    move-result v8

    iput v8, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistBrighteningThreshold:F

    .line 472
    iget-object v8, v0, Lcom/android/server/display/DualSensorPolicy;->mHysteresisLevelsImpl:Lcom/android/server/display/HysteresisLevelsStub;

    iget v9, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistFastAmbientLux:F

    invoke-virtual {v8, v9}, Lcom/android/server/display/HysteresisLevelsStub;->getDarkeningThreshold(F)F

    move-result v8

    iput v8, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistDarkeningThreshold:F

    .line 473
    iget-object v8, v0, Lcom/android/server/display/DualSensorPolicy;->mHysteresisLevelsImpl:Lcom/android/server/display/HysteresisLevelsStub;

    iget v9, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistFastAmbientLux:F

    invoke-virtual {v8, v9}, Lcom/android/server/display/HysteresisLevelsStub;->getBrighteningSmallThreshold(F)F

    move-result v8

    iput v8, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistBrighteningSmallThreshold:F

    .line 474
    iget-object v8, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistLightSensorRingBuffer:Lcom/android/server/display/AmbientLightRingBuffer;

    iget v9, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistBrighteningThreshold:F

    invoke-virtual {v8, v2, v3, v9}, Lcom/android/server/display/AmbientLightRingBuffer;->nextAmbientLightBrighteningTransition(JF)J

    move-result-wide v4

    .line 475
    iget-object v8, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistLightSensorRingBuffer:Lcom/android/server/display/AmbientLightRingBuffer;

    iget v9, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistDarkeningThreshold:F

    invoke-virtual {v8, v2, v3, v9}, Lcom/android/server/display/AmbientLightRingBuffer;->nextAmbientLightDarkeningTransition(JF)J

    move-result-wide v10

    .line 476
    iget-object v8, v0, Lcom/android/server/display/DualSensorPolicy;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "updateDualSensorPolicy: next brightening threshold of assist light sensor: "

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget v12, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistBrighteningThreshold:F

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v12, ", next darkening threshold of assist light sensor: "

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget v12, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistDarkeningThreshold:F

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v12, ", next small brightening threshold of assist light sensor: "

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget v12, v0, Lcom/android/server/display/DualSensorPolicy;->mAssistBrighteningSmallThreshold:F

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 480
    :cond_497
    invoke-static {v10, v11, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v8

    .line 481
    .restart local v8    # "nextTransitionTime":J
    cmp-long v12, v8, v2

    if-lez v12, :cond_4a1

    move-wide v12, v8

    goto :goto_4a5

    :cond_4a1
    iget v12, v0, Lcom/android/server/display/DualSensorPolicy;->mLightSensorRate:I

    int-to-long v12, v12

    add-long/2addr v12, v2

    .line 482
    .end local v8    # "nextTransitionTime":J
    .local v12, "nextTransitionTime":J
    :goto_4a5
    sget-boolean v8, Lcom/android/server/display/DualSensorPolicy;->DEBUG:Z

    if-eqz v8, :cond_4ca

    .line 483
    iget-object v8, v0, Lcom/android/server/display/DualSensorPolicy;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "updateDualSensorPolicy: next transition time of assist light sensor: "

    invoke-virtual {v9, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 484
    invoke-static {v12, v13}, Landroid/util/TimeUtils;->formatUptime(J)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v9, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 483
    invoke-static {v8, v9}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 486
    :cond_4ca
    iget-object v8, v0, Lcom/android/server/display/DualSensorPolicy;->mPolicyHandler:Landroid/os/Handler;

    const/4 v9, 0x0

    invoke-virtual {v8, v9, v12, v13}, Landroid/os/Handler;->sendEmptyMessageAtTime(IJ)Z

    goto :goto_4d2

    .line 422
    .end local v1    # "mainBrighteningThreshold":F
    .end local v4    # "nextBrightenTransition":J
    .end local v6    # "assistBrighteningThreshold":F
    .end local v10    # "nextDarkenTransition":J
    .end local v12    # "nextTransitionTime":J
    :cond_4d1
    :goto_4d1
    nop

    .line 488
    :goto_4d2
    const/16 v16, 0x1

    return v16
.end method

.method protected updateMainLightSensorAmbientThreshold(I)Z
    .registers 4
    .param p1, "event"    # I

    .line 289
    sget v0, Lcom/android/server/display/AutomaticBrightnessControllerStub;->HANDLE_MAIN_LUX_EVENT:I

    if-eq p1, v0, :cond_11

    iget v0, p0, Lcom/android/server/display/DualSensorPolicy;->mUseLightSensorFlag:I

    sget v1, Lcom/android/server/display/AutomaticBrightnessControllerStub;->USE_MAIN_LIGHT_SENSOR:I

    if-ne v0, v1, :cond_f

    sget v0, Lcom/android/server/display/AutomaticBrightnessControllerStub;->HANDLE_ASSIST_LUX_EVENT:I

    if-ne p1, v0, :cond_f

    goto :goto_11

    :cond_f
    const/4 v0, 0x0

    goto :goto_12

    :cond_11
    :goto_11
    const/4 v0, 0x1

    :goto_12
    return v0
.end method

.method protected updateMainLuxStatus(F)V
    .registers 3
    .param p1, "currentLux"    # F

    .line 597
    sget v0, Lcom/android/server/display/AutomaticBrightnessControllerStub;->HANDLE_MAIN_LUX_EVENT:I

    iput v0, p0, Lcom/android/server/display/DualSensorPolicy;->mUseLightSensorFlag:I

    .line 598
    iput p1, p0, Lcom/android/server/display/DualSensorPolicy;->mMainSlowAmbientLux:F

    .line 599
    iput p1, p0, Lcom/android/server/display/DualSensorPolicy;->mMainFastAmbientLux:F

    .line 600
    return-void
.end method

.method public updateSingleSensorPolicy(J)Z
    .registers 15
    .param p1, "time"    # J

    .line 503
    iget-object v0, p0, Lcom/android/server/display/DualSensorPolicy;->mListener:Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;

    invoke-interface {v0, p1, p2}, Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;->calculateSlowAmbientLux(J)F

    move-result v0

    iput v0, p0, Lcom/android/server/display/DualSensorPolicy;->mMainSlowAmbientLux:F

    .line 504
    iget-object v0, p0, Lcom/android/server/display/DualSensorPolicy;->mListener:Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;

    invoke-interface {v0, p1, p2}, Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;->calculateFastAmbientLux(J)F

    move-result v0

    iput v0, p0, Lcom/android/server/display/DualSensorPolicy;->mMainFastAmbientLux:F

    .line 505
    iget-object v0, p0, Lcom/android/server/display/DualSensorPolicy;->mListener:Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;

    iget v1, p0, Lcom/android/server/display/DualSensorPolicy;->mMainFastAmbientLux:F

    invoke-interface {v0, p1, p2, v1}, Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;->updateNextBrighteningTransition(JF)J

    move-result-wide v0

    .line 506
    .local v0, "nextBrightenTransition":J
    iget-object v2, p0, Lcom/android/server/display/DualSensorPolicy;->mListener:Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;

    invoke-interface {v2, p1, p2}, Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;->updateNextDarkeningTransition(J)J

    move-result-wide v2

    .line 507
    .local v2, "nextDarkenTransition":J
    invoke-direct {p0}, Lcom/android/server/display/DualSensorPolicy;->getBrighteningThreshold()F

    move-result v4

    .line 508
    .local v4, "mainBrighteningThreshold":F
    iget-object v5, p0, Lcom/android/server/display/DualSensorPolicy;->mListener:Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;

    invoke-interface {v5}, Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;->getDarkeningThreshold()F

    move-result v5

    .line 509
    .local v5, "mainDarkeningThreshold":F
    iget v6, p0, Lcom/android/server/display/DualSensorPolicy;->mMainFastAmbientLux:F

    cmpl-float v6, v6, v4

    const/4 v7, 0x1

    if-ltz v6, :cond_39

    iget v6, p0, Lcom/android/server/display/DualSensorPolicy;->mMainSlowAmbientLux:F

    cmpl-float v6, v6, v4

    if-ltz v6, :cond_39

    cmp-long v6, v0, p1

    if-lez v6, :cond_43

    :cond_39
    iget v6, p0, Lcom/android/server/display/DualSensorPolicy;->mMainFastAmbientLux:F

    cmpg-float v6, v6, v5

    if-gtz v6, :cond_58

    cmp-long v6, v2, p1

    if-gtz v6, :cond_58

    .line 514
    :cond_43
    iget-object v6, p0, Lcom/android/server/display/DualSensorPolicy;->mListener:Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;

    sget v8, Lcom/android/server/display/AutomaticBrightnessControllerStub;->HANDLE_MAIN_LUX_EVENT:I

    iget v9, p0, Lcom/android/server/display/DualSensorPolicy;->mMainFastAmbientLux:F

    invoke-interface {v6, v8, v9, v7, v7}, Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;->updateAmbientLux(IFZZ)V

    .line 515
    iget-object v6, p0, Lcom/android/server/display/DualSensorPolicy;->mListener:Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;

    invoke-interface {v6, p1, p2}, Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;->updateNextBrighteningTransition(J)J

    move-result-wide v0

    .line 516
    iget-object v6, p0, Lcom/android/server/display/DualSensorPolicy;->mListener:Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;

    invoke-interface {v6, p1, p2}, Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;->updateNextDarkeningTransition(J)J

    move-result-wide v2

    .line 518
    :cond_58
    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v8

    .line 519
    .local v8, "nextTransitionTime":J
    cmp-long v6, v8, p1

    if-lez v6, :cond_62

    move-wide v10, v8

    goto :goto_66

    :cond_62
    iget v6, p0, Lcom/android/server/display/DualSensorPolicy;->mLightSensorRate:I

    int-to-long v10, v6

    add-long/2addr v10, p1

    .line 520
    .end local v8    # "nextTransitionTime":J
    .local v10, "nextTransitionTime":J
    :goto_66
    iget-object v6, p0, Lcom/android/server/display/DualSensorPolicy;->mListener:Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;

    invoke-interface {v6, v10, v11}, Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;->sendUpdateAmbientLuxMessage(J)V

    .line 521
    return v7
.end method
