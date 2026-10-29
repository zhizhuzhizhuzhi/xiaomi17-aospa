.class public Lcom/android/server/display/SceneDetector;
.super Ljava/lang/Object;
.source "SceneDetector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/display/SceneDetector$SceneDetectorHandler;
    }
.end annotation


# static fields
.field private static final ACTION_CLIENT_SERVICE:Ljava/lang/String; = "com.xiaomi.aon.AonFlareService"

.field private static final AON_WAIT_DATA_STATE:I = 0x2

.field private static final AON_WAIT_REGISTER_STATE:I = 0x1

.field private static final CHECK_PROX_DATA_READY_MILLISECOND:I = 0x1f4

.field private static final DEFAULT_FRAMES_PER_SECOND:F = 1.0f

.field private static final DEFAULT_MAX_DELAY_TIME:I = 0x1388

.field private static final IS_REAR_DEVICE:Z

.field private static final MSG_CHECK_AON_DATA_RETURN:I = 0x1

.field private static final MSG_CHECK_PROXIMITY_SENSOR_STATE:I = 0xa

.field private static final MSG_CHECK_PROX_DATA_RETURN:I = 0x6

.field private static final MSG_DISABLE_PROXIMITY:I = 0x9

.field private static final MSG_RESET_STEP_STATUS:I = 0x4

.field private static final MSG_UPDATE_AUTO_BRIGHTNESS_OFF_STATUS:I = 0x3

.field private static final MSG_UPDATE_AUTO_BRIGHTNESS_ON_STATUS:I = 0x2

.field private static final POLL_CHECK_PROX_SECOND:I = 0x4e20

.field private static final PROX_THRESHOLD:I = 0xc8

.field private static final PROX_WAIT_DATA_STATE:I = 0x8

.field private static final PROX_WAIT_REGISTER_STATE:I = 0x7

.field private static final SENSOR_TYPE_SCREEN_POSTURE:I = 0x1fa2721

.field private static final SENSOR_TYPE_STREAM_PROXIMITY:I = 0x1fa263d

.field private static final SUPPRESS_DARKEN_EVENT:I = 0x1

.field private static final TAG:Ljava/lang/String; = "SceneDetector"

.field private static final TYPE_AON_FLARE:I = 0x5

.field private static sDEBUG:Z


# instance fields
.field private mAmbientLux:F

.field private mAonFlareMaxDelayTime:I

.field private mAonFlareService:Lcom/xiaomi/aon/IAONFlareService;

.field private mAonState:I

.field private mAutomaticBrightnessEnable:Z

.field private mBrightnessControllerImpl:Lcom/android/server/display/AutomaticBrightnessControllerImpl;

.field private mComponentName:Ljava/lang/String;

.field private mContext:Landroid/content/Context;

.field private mDeathRecipient:Landroid/os/IBinder$DeathRecipient;

.field private mDisplayId:I

.field private mDualSensorPolicyListener:Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;

.field private mIsMainDarkenEvent:Z

.field private mIsReflectiveScene:Z

.field private mIsStepMode:Z

.field private mMainHandler:Landroid/os/Handler;

.field private mMaxAonFlareEnableLux:F

.field private mMiAONListener:Lcom/xiaomi/aon/IMiAONListener;

.field private mMinAonFlareEnableLux:F

.field private volatile mNeedCheckAonFlare:Z

.field private volatile mNeedCheckProximitySensor:Z

.field private mPreAmbientLux:F

.field private mProxState:I

.field private mProximityStatus:Z

.field private mSceneDetectorHandler:Landroid/os/Handler;

.field private mScreenPostureSenseSensor:Landroid/hardware/Sensor;

.field private mSensorListener:Landroid/hardware/SensorEventListener;

.field private mSensorManager:Landroid/hardware/SensorManager;

.field private final mServiceComponent:Landroid/content/ComponentName;

.field private mServiceConnected:Z

.field private mServiceConnection:Landroid/content/ServiceConnection;

.field private mShouldCheckAonStatusWhenConnected:Z

.field private mStepModeEffectivenessTime:I

.field private mStepSensor:Landroid/hardware/Sensor;

.field private mStreamProximitySensor:Landroid/hardware/Sensor;

.field private mTransientProximityEnabled:Z

.field private mUseAonFlareEnabled:Z

.field private mUseProximityInGameEnabled:Z

.field private mUseStepEnabled:Z


# direct methods
.method public static synthetic $r8$lambda$2kIudXlfDU-PvEfA0TeGgmmmb8I(Lcom/android/server/display/SceneDetector;)V
    .registers 1

    invoke-direct {p0}, Lcom/android/server/display/SceneDetector;->lambda$updateAmbientLux$2()V

    return-void
.end method

.method public static synthetic $r8$lambda$5UNDayle3E3Z4JaMt8JT-uK9OBI(Lcom/android/server/display/SceneDetector;Landroid/hardware/SensorEvent;)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/android/server/display/SceneDetector;->lambda$onProximitySensorChanged$4(Landroid/hardware/SensorEvent;)V

    return-void
.end method

.method public static synthetic $r8$lambda$QEI6iSPYg2MalsaWyKzaReyawYY(Lcom/android/server/display/SceneDetector;)V
    .registers 1

    invoke-direct {p0}, Lcom/android/server/display/SceneDetector;->lambda$updateAutoBrightness$3()V

    return-void
.end method

.method public static synthetic $r8$lambda$bBAntDiQqnzwGnWBF03q6Nmy5dY(Lcom/android/server/display/SceneDetector;F)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/android/server/display/SceneDetector;->lambda$updateAmbientLux$1(F)V

    return-void
.end method

.method public static synthetic $r8$lambda$n7W-99Tyc9noFzzvLUZ52e4HrR8(Lcom/android/server/display/SceneDetector;Z)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/android/server/display/SceneDetector;->lambda$updateAmbientLux$0(Z)V

    return-void
.end method

.method static bridge synthetic -$$Nest$fgetmAonState(Lcom/android/server/display/SceneDetector;)I
    .registers 1

    iget p0, p0, Lcom/android/server/display/SceneDetector;->mAonState:I

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetmBrightnessControllerImpl(Lcom/android/server/display/SceneDetector;)Lcom/android/server/display/AutomaticBrightnessControllerImpl;
    .registers 1

    iget-object p0, p0, Lcom/android/server/display/SceneDetector;->mBrightnessControllerImpl:Lcom/android/server/display/AutomaticBrightnessControllerImpl;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmDeathRecipient(Lcom/android/server/display/SceneDetector;)Landroid/os/IBinder$DeathRecipient;
    .registers 1

    iget-object p0, p0, Lcom/android/server/display/SceneDetector;->mDeathRecipient:Landroid/os/IBinder$DeathRecipient;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmDisplayId(Lcom/android/server/display/SceneDetector;)I
    .registers 1

    iget p0, p0, Lcom/android/server/display/SceneDetector;->mDisplayId:I

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetmIsMainDarkenEvent(Lcom/android/server/display/SceneDetector;)Z
    .registers 1

    iget-boolean p0, p0, Lcom/android/server/display/SceneDetector;->mIsMainDarkenEvent:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetmIsStepMode(Lcom/android/server/display/SceneDetector;)Z
    .registers 1

    iget-boolean p0, p0, Lcom/android/server/display/SceneDetector;->mIsStepMode:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetmMainHandler(Lcom/android/server/display/SceneDetector;)Landroid/os/Handler;
    .registers 1

    iget-object p0, p0, Lcom/android/server/display/SceneDetector;->mMainHandler:Landroid/os/Handler;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmPreAmbientLux(Lcom/android/server/display/SceneDetector;)F
    .registers 1

    iget p0, p0, Lcom/android/server/display/SceneDetector;->mPreAmbientLux:F

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetmProxState(Lcom/android/server/display/SceneDetector;)I
    .registers 1

    iget p0, p0, Lcom/android/server/display/SceneDetector;->mProxState:I

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetmProximityStatus(Lcom/android/server/display/SceneDetector;)Z
    .registers 1

    iget-boolean p0, p0, Lcom/android/server/display/SceneDetector;->mProximityStatus:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetmSceneDetectorHandler(Lcom/android/server/display/SceneDetector;)Landroid/os/Handler;
    .registers 1

    iget-object p0, p0, Lcom/android/server/display/SceneDetector;->mSceneDetectorHandler:Landroid/os/Handler;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmScreenPostureSenseSensor(Lcom/android/server/display/SceneDetector;)Landroid/hardware/Sensor;
    .registers 1

    iget-object p0, p0, Lcom/android/server/display/SceneDetector;->mScreenPostureSenseSensor:Landroid/hardware/Sensor;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmShouldCheckAonStatusWhenConnected(Lcom/android/server/display/SceneDetector;)Z
    .registers 1

    iget-boolean p0, p0, Lcom/android/server/display/SceneDetector;->mShouldCheckAonStatusWhenConnected:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetmStepModeEffectivenessTime(Lcom/android/server/display/SceneDetector;)I
    .registers 1

    iget p0, p0, Lcom/android/server/display/SceneDetector;->mStepModeEffectivenessTime:I

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetmStepSensor(Lcom/android/server/display/SceneDetector;)Landroid/hardware/Sensor;
    .registers 1

    iget-object p0, p0, Lcom/android/server/display/SceneDetector;->mStepSensor:Landroid/hardware/Sensor;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmUseAonFlareEnabled(Lcom/android/server/display/SceneDetector;)Z
    .registers 1

    iget-boolean p0, p0, Lcom/android/server/display/SceneDetector;->mUseAonFlareEnabled:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetmUseStepEnabled(Lcom/android/server/display/SceneDetector;)Z
    .registers 1

    iget-boolean p0, p0, Lcom/android/server/display/SceneDetector;->mUseStepEnabled:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fputmAonFlareService(Lcom/android/server/display/SceneDetector;Lcom/xiaomi/aon/IAONFlareService;)V
    .registers 2

    iput-object p1, p0, Lcom/android/server/display/SceneDetector;->mAonFlareService:Lcom/xiaomi/aon/IAONFlareService;

    return-void
.end method

.method static bridge synthetic -$$Nest$fputmAonState(Lcom/android/server/display/SceneDetector;I)V
    .registers 2

    iput p1, p0, Lcom/android/server/display/SceneDetector;->mAonState:I

    return-void
.end method

.method static bridge synthetic -$$Nest$fputmIsMainDarkenEvent(Lcom/android/server/display/SceneDetector;Z)V
    .registers 2

    iput-boolean p1, p0, Lcom/android/server/display/SceneDetector;->mIsMainDarkenEvent:Z

    return-void
.end method

.method static bridge synthetic -$$Nest$fputmIsReflectiveScene(Lcom/android/server/display/SceneDetector;Z)V
    .registers 2

    iput-boolean p1, p0, Lcom/android/server/display/SceneDetector;->mIsReflectiveScene:Z

    return-void
.end method

.method static bridge synthetic -$$Nest$fputmIsStepMode(Lcom/android/server/display/SceneDetector;Z)V
    .registers 2

    iput-boolean p1, p0, Lcom/android/server/display/SceneDetector;->mIsStepMode:Z

    return-void
.end method

.method static bridge synthetic -$$Nest$fputmNeedCheckAonFlare(Lcom/android/server/display/SceneDetector;Z)V
    .registers 2

    iput-boolean p1, p0, Lcom/android/server/display/SceneDetector;->mNeedCheckAonFlare:Z

    return-void
.end method

.method static bridge synthetic -$$Nest$fputmNeedCheckProximitySensor(Lcom/android/server/display/SceneDetector;Z)V
    .registers 2

    iput-boolean p1, p0, Lcom/android/server/display/SceneDetector;->mNeedCheckProximitySensor:Z

    return-void
.end method

.method static bridge synthetic -$$Nest$fputmServiceConnected(Lcom/android/server/display/SceneDetector;Z)V
    .registers 2

    iput-boolean p1, p0, Lcom/android/server/display/SceneDetector;->mServiceConnected:Z

    return-void
.end method

.method static bridge synthetic -$$Nest$mcheckAonFlareStatus(Lcom/android/server/display/SceneDetector;F)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/android/server/display/SceneDetector;->checkAonFlareStatus(F)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mcheckProximitySensorStatus(Lcom/android/server/display/SceneDetector;)V
    .registers 1

    invoke-direct {p0}, Lcom/android/server/display/SceneDetector;->checkProximitySensorStatus()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mresetServiceConnectedStatus(Lcom/android/server/display/SceneDetector;Z)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/android/server/display/SceneDetector;->resetServiceConnectedStatus(Z)V

    return-void
.end method

.method static bridge synthetic -$$Nest$msetScreenPostureSensorEnabled(Lcom/android/server/display/SceneDetector;Z)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/android/server/display/SceneDetector;->setScreenPostureSensorEnabled(Z)V

    return-void
.end method

.method static bridge synthetic -$$Nest$msetStepSensorEnabled(Lcom/android/server/display/SceneDetector;Z)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/android/server/display/SceneDetector;->setStepSensorEnabled(Z)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mtryToBindAonFlareService(Lcom/android/server/display/SceneDetector;)V
    .registers 1

    invoke-direct {p0}, Lcom/android/server/display/SceneDetector;->tryToBindAonFlareService()V

    return-void
.end method

.method static bridge synthetic -$$Nest$munregisterAonFlareListener(Lcom/android/server/display/SceneDetector;)V
    .registers 1

    invoke-direct {p0}, Lcom/android/server/display/SceneDetector;->unregisterAonFlareListener()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mupdateAutoBrightness(Lcom/android/server/display/SceneDetector;)V
    .registers 1

    invoke-direct {p0}, Lcom/android/server/display/SceneDetector;->updateAutoBrightness()V

    return-void
.end method

.method static constructor <clinit>()V
    .registers 1

    .line 56
    const/4 v0, 0x0

    sput-boolean v0, Lcom/android/server/display/SceneDetector;->sDEBUG:Z

    .line 102
    invoke-static {}, Lmiui/util/MiuiMultiDisplayTypeInfo;->isIndependentRearDevice()Z

    move-result v0

    sput-boolean v0, Lcom/android/server/display/SceneDetector;->IS_REAR_DEVICE:Z

    return-void
.end method

.method public constructor <init>(Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;Lcom/android/server/display/AutomaticBrightnessControllerImpl;Landroid/os/Handler;Landroid/content/Context;Landroid/hardware/SensorManager;ZZ)V
    .registers 10
    .param p1, "listener"    # Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;
    .param p2, "brightnessControllerImpl"    # Lcom/android/server/display/AutomaticBrightnessControllerImpl;
    .param p3, "handler"    # Landroid/os/Handler;
    .param p4, "context"    # Landroid/content/Context;
    .param p5, "sensorManager"    # Landroid/hardware/SensorManager;
    .param p6, "useAonFlareEnabled"    # Z
    .param p7, "transientProximityEnabled"    # Z

    .line 108
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    const/4 v0, 0x1

    iput v0, p0, Lcom/android/server/display/SceneDetector;->mAonState:I

    .line 78
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/server/display/SceneDetector;->mStepSensor:Landroid/hardware/Sensor;

    .line 92
    const/4 v0, 0x7

    iput v0, p0, Lcom/android/server/display/SceneDetector;->mProxState:I

    .line 343
    new-instance v0, Lcom/android/server/display/SceneDetector$1;

    invoke-direct {v0, p0}, Lcom/android/server/display/SceneDetector$1;-><init>(Lcom/android/server/display/SceneDetector;)V

    iput-object v0, p0, Lcom/android/server/display/SceneDetector;->mDeathRecipient:Landroid/os/IBinder$DeathRecipient;

    .line 378
    new-instance v0, Lcom/android/server/display/SceneDetector$2;

    invoke-direct {v0, p0}, Lcom/android/server/display/SceneDetector$2;-><init>(Lcom/android/server/display/SceneDetector;)V

    iput-object v0, p0, Lcom/android/server/display/SceneDetector;->mServiceConnection:Landroid/content/ServiceConnection;

    .line 409
    new-instance v0, Lcom/android/server/display/SceneDetector$3;

    invoke-direct {v0, p0}, Lcom/android/server/display/SceneDetector$3;-><init>(Lcom/android/server/display/SceneDetector;)V

    iput-object v0, p0, Lcom/android/server/display/SceneDetector;->mMiAONListener:Lcom/xiaomi/aon/IMiAONListener;

    .line 498
    new-instance v0, Lcom/android/server/display/SceneDetector$4;

    invoke-direct {v0, p0}, Lcom/android/server/display/SceneDetector$4;-><init>(Lcom/android/server/display/SceneDetector;)V

    iput-object v0, p0, Lcom/android/server/display/SceneDetector;->mSensorListener:Landroid/hardware/SensorEventListener;

    .line 109
    iput-object p3, p0, Lcom/android/server/display/SceneDetector;->mMainHandler:Landroid/os/Handler;

    .line 110
    iput-object p4, p0, Lcom/android/server/display/SceneDetector;->mContext:Landroid/content/Context;

    .line 111
    iput-object p1, p0, Lcom/android/server/display/SceneDetector;->mDualSensorPolicyListener:Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;

    .line 112
    iput-object p5, p0, Lcom/android/server/display/SceneDetector;->mSensorManager:Landroid/hardware/SensorManager;

    .line 113
    iget-object v0, p0, Lcom/android/server/display/SceneDetector;->mSensorManager:Landroid/hardware/SensorManager;

    const/16 v1, 0x12

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/display/SceneDetector;->mStepSensor:Landroid/hardware/Sensor;

    .line 114
    new-instance v0, Lcom/android/server/display/SceneDetector$SceneDetectorHandler;

    invoke-static {}, Lcom/android/internal/os/BackgroundThread;->get()Lcom/android/internal/os/BackgroundThread;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/internal/os/BackgroundThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/android/server/display/SceneDetector$SceneDetectorHandler;-><init>(Lcom/android/server/display/SceneDetector;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/server/display/SceneDetector;->mSceneDetectorHandler:Landroid/os/Handler;

    .line 115
    iput-object p2, p0, Lcom/android/server/display/SceneDetector;->mBrightnessControllerImpl:Lcom/android/server/display/AutomaticBrightnessControllerImpl;

    .line 116
    sget-boolean v0, Lcom/android/server/display/SceneDetector;->IS_REAR_DEVICE:Z

    if-eqz v0, :cond_5a

    .line 117
    iget-object v0, p0, Lcom/android/server/display/SceneDetector;->mSensorManager:Landroid/hardware/SensorManager;

    const v1, 0x1fa2721

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/display/SceneDetector;->mScreenPostureSenseSensor:Landroid/hardware/Sensor;

    .line 119
    :cond_5a
    iput-boolean p6, p0, Lcom/android/server/display/SceneDetector;->mUseAonFlareEnabled:Z

    .line 120
    iput-boolean p7, p0, Lcom/android/server/display/SceneDetector;->mTransientProximityEnabled:Z

    .line 121
    invoke-direct {p0, p4}, Lcom/android/server/display/SceneDetector;->loadConfiguration(Landroid/content/Context;)V

    .line 122
    iget-object v0, p0, Lcom/android/server/display/SceneDetector;->mComponentName:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/android/server/display/SceneDetector;->getAonFlareServiceComponent(Ljava/lang/String;)Landroid/content/ComponentName;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/display/SceneDetector;->mServiceComponent:Landroid/content/ComponentName;

    .line 123
    iget-boolean v0, p0, Lcom/android/server/display/SceneDetector;->mTransientProximityEnabled:Z

    if-eqz v0, :cond_78

    .line 124
    iget-object v0, p0, Lcom/android/server/display/SceneDetector;->mSensorManager:Landroid/hardware/SensorManager;

    const v1, 0x1fa263d

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/display/SceneDetector;->mStreamProximitySensor:Landroid/hardware/Sensor;

    .line 126
    :cond_78
    return-void
.end method

.method private checkAonFlareStatus(F)V
    .registers 4
    .param p1, "preLux"    # F

    .line 242
    sget-boolean v0, Lcom/android/server/display/SceneDetector;->sDEBUG:Z

    if-eqz v0, :cond_2a

    .line 243
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "checkAonFlareStatus mIsMainDarkenEvent:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/android/server/display/SceneDetector;->mIsMainDarkenEvent:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ",mAonState: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/server/display/SceneDetector;->mAonState:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "SceneDetector"

    invoke-static {v1, v0}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 246
    :cond_2a
    iget-boolean v0, p0, Lcom/android/server/display/SceneDetector;->mUseAonFlareEnabled:Z

    if-eqz v0, :cond_31

    .line 247
    invoke-direct {p0}, Lcom/android/server/display/SceneDetector;->tryToBindAonFlareService()V

    .line 249
    :cond_31
    iget v0, p0, Lcom/android/server/display/SceneDetector;->mAonState:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_51

    .line 250
    iput p1, p0, Lcom/android/server/display/SceneDetector;->mPreAmbientLux:F

    .line 251
    iget-boolean v0, p0, Lcom/android/server/display/SceneDetector;->mServiceConnected:Z

    if-nez v0, :cond_3f

    .line 252
    iput-boolean v1, p0, Lcom/android/server/display/SceneDetector;->mShouldCheckAonStatusWhenConnected:Z

    .line 253
    return-void

    .line 255
    :cond_3f
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/server/display/SceneDetector;->mShouldCheckAonStatusWhenConnected:Z

    .line 256
    iget-boolean v0, p0, Lcom/android/server/display/SceneDetector;->mServiceConnected:Z

    if-eqz v0, :cond_4e

    iget-object v0, p0, Lcom/android/server/display/SceneDetector;->mAonFlareService:Lcom/xiaomi/aon/IAONFlareService;

    if-eqz v0, :cond_4e

    .line 257
    invoke-direct {p0}, Lcom/android/server/display/SceneDetector;->registerAonFlareListener()V

    goto :goto_51

    .line 259
    :cond_4e
    invoke-direct {p0}, Lcom/android/server/display/SceneDetector;->updateAutoBrightness()V

    .line 262
    :cond_51
    :goto_51
    return-void
.end method

.method private checkProximitySensorStatus()V
    .registers 3

    .line 454
    iget v0, p0, Lcom/android/server/display/SceneDetector;->mProxState:I

    const/4 v1, 0x7

    if-ne v0, v1, :cond_12

    iget-object v0, p0, Lcom/android/server/display/SceneDetector;->mBrightnessControllerImpl:Lcom/android/server/display/AutomaticBrightnessControllerImpl;

    invoke-virtual {v0}, Lcom/android/server/display/AutomaticBrightnessControllerImpl;->isGameSceneEnabled()Z

    move-result v0

    if-eqz v0, :cond_12

    .line 455
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/server/display/SceneDetector;->setStreamProximitySensorEnabled(Z)V

    goto :goto_15

    .line 457
    :cond_12
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/server/display/SceneDetector;->mNeedCheckProximitySensor:Z

    .line 459
    :goto_15
    iget-object v0, p0, Lcom/android/server/display/SceneDetector;->mBrightnessControllerImpl:Lcom/android/server/display/AutomaticBrightnessControllerImpl;

    invoke-virtual {v0}, Lcom/android/server/display/AutomaticBrightnessControllerImpl;->isGameSceneEnabled()Z

    move-result v0

    if-nez v0, :cond_24

    .line 460
    iget-object v0, p0, Lcom/android/server/display/SceneDetector;->mSceneDetectorHandler:Landroid/os/Handler;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 462
    :cond_24
    return-void
.end method

.method private getAonFlareServiceComponent(Ljava/lang/String;)Landroid/content/ComponentName;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .line 226
    if-eqz p1, :cond_7

    .line 227
    invoke-static {p1}, Landroid/content/ComponentName;->unflattenFromString(Ljava/lang/String;)Landroid/content/ComponentName;

    move-result-object v0

    return-object v0

    .line 229
    :cond_7
    const/4 v0, 0x0

    return-object v0
.end method

.method private isProximityNear(Landroid/hardware/SensorEvent;)Z
    .registers 7
    .param p1, "event"    # Landroid/hardware/SensorEvent;

    .line 489
    iget-object v0, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v1, 0x1

    aget v0, v0, v1

    iget-object v2, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v3, 0x5

    aget v2, v2, v3

    const/high16 v3, 0x43480000    # 200.0f

    add-float/2addr v2, v3

    cmpl-float v0, v0, v2

    if-lez v0, :cond_14

    .line 490
    iput-boolean v1, p0, Lcom/android/server/display/SceneDetector;->mProximityStatus:Z

    goto :goto_2c

    .line 491
    :cond_14
    iget-boolean v0, p0, Lcom/android/server/display/SceneDetector;->mProximityStatus:Z

    if-ne v0, v1, :cond_29

    iget-object v0, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v0, v0, v1

    iget-object v2, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v4, 0x6

    aget v2, v2, v4

    add-float/2addr v2, v3

    cmpl-float v0, v0, v2

    if-lez v0, :cond_29

    .line 492
    iput-boolean v1, p0, Lcom/android/server/display/SceneDetector;->mProximityStatus:Z

    goto :goto_2c

    .line 494
    :cond_29
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/server/display/SceneDetector;->mProximityStatus:Z

    .line 495
    :goto_2c
    iget-boolean v0, p0, Lcom/android/server/display/SceneDetector;->mProximityStatus:Z

    return v0
.end method

.method private synthetic lambda$onProximitySensorChanged$4(Landroid/hardware/SensorEvent;)V
    .registers 6
    .param p1, "event"    # Landroid/hardware/SensorEvent;

    .line 472
    iget v0, p0, Lcom/android/server/display/SceneDetector;->mProxState:I

    const/16 v1, 0x8

    if-ne v0, v1, :cond_55

    .line 473
    iget-object v0, p0, Lcom/android/server/display/SceneDetector;->mSceneDetectorHandler:Landroid/os/Handler;

    const/4 v1, 0x6

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 474
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "isProximityNear:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct {p0, p1}, Lcom/android/server/display/SceneDetector;->isProximityNear(Landroid/hardware/SensorEvent;)Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "SceneDetector"

    invoke-static {v1, v0}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 475
    invoke-direct {p0, p1}, Lcom/android/server/display/SceneDetector;->isProximityNear(Landroid/hardware/SensorEvent;)Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_44

    iget v0, p0, Lcom/android/server/display/SceneDetector;->mAonState:I

    const/4 v3, 0x1

    if-ne v0, v3, :cond_44

    iget-boolean v0, p0, Lcom/android/server/display/SceneDetector;->mIsMainDarkenEvent:Z

    if-eqz v0, :cond_44

    .line 476
    const-string v0, "ProximitySensor not suppress this darken event!"

    invoke-static {v1, v0}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 477
    iput-boolean v2, p0, Lcom/android/server/display/SceneDetector;->mNeedCheckProximitySensor:Z

    .line 478
    invoke-direct {p0}, Lcom/android/server/display/SceneDetector;->updateAutoBrightness()V

    goto :goto_52

    .line 479
    :cond_44
    invoke-direct {p0, p1}, Lcom/android/server/display/SceneDetector;->isProximityNear(Landroid/hardware/SensorEvent;)Z

    move-result v0

    if-eqz v0, :cond_52

    .line 480
    const-string v0, "ProximitySensor suppress this darken event!"

    invoke-static {v1, v0}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 481
    invoke-direct {p0}, Lcom/android/server/display/SceneDetector;->pollCheckProximitySensorState()V

    .line 483
    :cond_52
    :goto_52
    invoke-virtual {p0, v2}, Lcom/android/server/display/SceneDetector;->setStreamProximitySensorEnabled(Z)V

    .line 485
    :cond_55
    return-void
.end method

.method private synthetic lambda$updateAmbientLux$0(Z)V
    .registers 3
    .param p1, "isMainDarkenEvent"    # Z

    .line 157
    iget-object v0, p0, Lcom/android/server/display/SceneDetector;->mBrightnessControllerImpl:Lcom/android/server/display/AutomaticBrightnessControllerImpl;

    invoke-virtual {v0}, Lcom/android/server/display/AutomaticBrightnessControllerImpl;->notifyUpdateBrightness()V

    .line 158
    iput-boolean p1, p0, Lcom/android/server/display/SceneDetector;->mIsMainDarkenEvent:Z

    .line 159
    return-void
.end method

.method private synthetic lambda$updateAmbientLux$1(F)V
    .registers 2
    .param p1, "preLux"    # F

    .line 167
    invoke-direct {p0, p1}, Lcom/android/server/display/SceneDetector;->checkAonFlareStatus(F)V

    .line 168
    return-void
.end method

.method private synthetic lambda$updateAmbientLux$2()V
    .registers 1

    .line 174
    invoke-direct {p0}, Lcom/android/server/display/SceneDetector;->checkProximitySensorStatus()V

    .line 175
    return-void
.end method

.method private synthetic lambda$updateAutoBrightness$3()V
    .registers 5

    .line 235
    iget-object v0, p0, Lcom/android/server/display/SceneDetector;->mDualSensorPolicyListener:Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;

    sget v1, Lcom/android/server/display/AutomaticBrightnessControllerStub;->HANDLE_MAIN_LUX_EVENT:I

    iget v2, p0, Lcom/android/server/display/SceneDetector;->mAmbientLux:F

    const/4 v3, 0x1

    invoke-interface {v0, v1, v2, v3, v3}, Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;->updateAmbientLux(IFZZ)V

    .line 237
    return-void
.end method

.method private loadConfiguration(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .line 129
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 130
    .local v0, "resources":Landroid/content/res/Resources;
    const v1, 0x1107002d

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getFloat(I)F

    move-result v1

    iput v1, p0, Lcom/android/server/display/SceneDetector;->mMaxAonFlareEnableLux:F

    .line 132
    const v1, 0x11070031

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getFloat(I)F

    move-result v1

    iput v1, p0, Lcom/android/server/display/SceneDetector;->mMinAonFlareEnableLux:F

    .line 134
    const v1, 0x110b000f

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    iput v1, p0, Lcom/android/server/display/SceneDetector;->mAonFlareMaxDelayTime:I

    .line 136
    const v1, 0x110f009f

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/android/server/display/SceneDetector;->mComponentName:Ljava/lang/String;

    .line 138
    const v1, 0x110500a7

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v1

    iput-boolean v1, p0, Lcom/android/server/display/SceneDetector;->mUseStepEnabled:Z

    .line 140
    const v1, 0x110b004a

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    iput v1, p0, Lcom/android/server/display/SceneDetector;->mStepModeEffectivenessTime:I

    .line 142
    const v1, 0x110500ad

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v1

    iput-boolean v1, p0, Lcom/android/server/display/SceneDetector;->mUseProximityInGameEnabled:Z

    .line 144
    return-void
.end method

.method private pollCheckProximitySensorState()V
    .registers 5

    .line 465
    iget-object v0, p0, Lcom/android/server/display/SceneDetector;->mSceneDetectorHandler:Landroid/os/Handler;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 466
    iget-object v0, p0, Lcom/android/server/display/SceneDetector;->mSceneDetectorHandler:Landroid/os/Handler;

    const-wide/16 v2, 0x4e20

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 468
    return-void
.end method

.method private registerAonFlareListener()V
    .registers 7

    .line 295
    const-string v0, "SceneDetector"

    :try_start_2
    iget-object v1, p0, Lcom/android/server/display/SceneDetector;->mAonFlareService:Lcom/xiaomi/aon/IAONFlareService;

    iget-object v2, p0, Lcom/android/server/display/SceneDetector;->mMiAONListener:Lcom/xiaomi/aon/IMiAONListener;

    const/4 v3, 0x5

    const/high16 v4, 0x3f800000    # 1.0f

    const/16 v5, 0x1388

    invoke-interface {v1, v3, v4, v5, v2}, Lcom/xiaomi/aon/IAONFlareService;->registerListener(IFILcom/xiaomi/aon/IMiAONListener;)V

    .line 297
    iget-object v1, p0, Lcom/android/server/display/SceneDetector;->mSceneDetectorHandler:Landroid/os/Handler;

    iget v2, p0, Lcom/android/server/display/SceneDetector;->mAonFlareMaxDelayTime:I

    int-to-long v2, v2

    const/4 v4, 0x1

    invoke-virtual {v1, v4, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 299
    const/4 v1, 0x2

    iput v1, p0, Lcom/android/server/display/SceneDetector;->mAonState:I

    .line 300
    const-string/jumbo v1, "registerAonFlareListener: register aon flare listener success."

    invoke-static {v0, v1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 301
    iput-boolean v4, p0, Lcom/android/server/display/SceneDetector;->mNeedCheckAonFlare:Z
    :try_end_22
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_22} :catch_23

    .line 304
    goto :goto_2a

    .line 302
    :catch_23
    move-exception v1

    .line 303
    .local v1, "e":Landroid/os/RemoteException;
    const-string/jumbo v2, "registerAonFlareListener: register aon flare listener failed."

    invoke-static {v0, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 305
    .end local v1    # "e":Landroid/os/RemoteException;
    :goto_2a
    return-void
.end method

.method private resetServiceConnectedStatus(Z)V
    .registers 9
    .param p1, "isServiceDied"    # Z

    .line 358
    const-string/jumbo v0, "resetServiceConnectedStatus: unbind aon service failed"

    const-string v1, "SceneDetector"

    iget-object v2, p0, Lcom/android/server/display/SceneDetector;->mAonFlareService:Lcom/xiaomi/aon/IAONFlareService;

    if-eqz v2, :cond_77

    iget-boolean v2, p0, Lcom/android/server/display/SceneDetector;->mServiceConnected:Z

    if-eqz v2, :cond_77

    .line 360
    const/4 v2, 0x0

    const/4 v3, 0x0

    :try_start_f
    iget-object v4, p0, Lcom/android/server/display/SceneDetector;->mAonFlareService:Lcom/xiaomi/aon/IAONFlareService;

    invoke-interface {v4}, Lcom/xiaomi/aon/IAONFlareService;->asBinder()Landroid/os/IBinder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/server/display/SceneDetector;->mDeathRecipient:Landroid/os/IBinder$DeathRecipient;

    invoke-interface {v4, v5, v3}, Landroid/os/IBinder;->unlinkToDeath(Landroid/os/IBinder$DeathRecipient;I)Z
    :try_end_1a
    .catch Ljava/util/NoSuchElementException; {:try_start_f .. :try_end_1a} :catch_3a
    .catchall {:try_start_f .. :try_end_1a} :catchall_38

    .line 365
    if-nez p1, :cond_31

    .line 366
    :try_start_1c
    iget-object v4, p0, Lcom/android/server/display/SceneDetector;->mContext:Landroid/content/Context;

    iget-object v5, p0, Lcom/android/server/display/SceneDetector;->mServiceConnection:Landroid/content/ServiceConnection;

    invoke-virtual {v4, v5}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V
    :try_end_23
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1c .. :try_end_23} :catch_26
    .catchall {:try_start_1c .. :try_end_23} :catchall_24

    goto :goto_31

    .line 371
    :catchall_24
    move-exception v0

    goto :goto_2c

    .line 368
    :catch_26
    move-exception v4

    .line 369
    .local v4, "e":Ljava/lang/IllegalArgumentException;
    :try_start_27
    invoke-static {v1, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2a
    .catchall {:try_start_27 .. :try_end_2a} :catchall_24

    .line 371
    nop

    .end local v4    # "e":Ljava/lang/IllegalArgumentException;
    goto :goto_32

    :goto_2c
    iput-object v2, p0, Lcom/android/server/display/SceneDetector;->mAonFlareService:Lcom/xiaomi/aon/IAONFlareService;

    .line 372
    iput-boolean v3, p0, Lcom/android/server/display/SceneDetector;->mServiceConnected:Z

    .line 373
    throw v0

    .line 371
    :cond_31
    :goto_31
    nop

    :goto_32
    iput-object v2, p0, Lcom/android/server/display/SceneDetector;->mAonFlareService:Lcom/xiaomi/aon/IAONFlareService;

    .line 372
    iput-boolean v3, p0, Lcom/android/server/display/SceneDetector;->mServiceConnected:Z

    .line 373
    nop

    .line 374
    goto :goto_77

    .line 364
    :catchall_38
    move-exception v4

    goto :goto_59

    .line 361
    :catch_3a
    move-exception v4

    .line 362
    .local v4, "e":Ljava/util/NoSuchElementException;
    :try_start_3b
    const-string/jumbo v5, "resetServiceConnectedStatus: unlinkToDeath failed"

    invoke-static {v1, v5}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_41
    .catchall {:try_start_3b .. :try_end_41} :catchall_38

    .line 365
    .end local v4    # "e":Ljava/util/NoSuchElementException;
    if-nez p1, :cond_58

    .line 366
    :try_start_43
    iget-object v4, p0, Lcom/android/server/display/SceneDetector;->mContext:Landroid/content/Context;

    iget-object v5, p0, Lcom/android/server/display/SceneDetector;->mServiceConnection:Landroid/content/ServiceConnection;

    invoke-virtual {v4, v5}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V
    :try_end_4a
    .catch Ljava/lang/IllegalArgumentException; {:try_start_43 .. :try_end_4a} :catch_4d
    .catchall {:try_start_43 .. :try_end_4a} :catchall_4b

    goto :goto_58

    .line 371
    :catchall_4b
    move-exception v0

    goto :goto_53

    .line 368
    :catch_4d
    move-exception v4

    .line 369
    .local v4, "e":Ljava/lang/IllegalArgumentException;
    :try_start_4e
    invoke-static {v1, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_51
    .catchall {:try_start_4e .. :try_end_51} :catchall_4b

    .line 371
    nop

    .end local v4    # "e":Ljava/lang/IllegalArgumentException;
    goto :goto_32

    :goto_53
    iput-object v2, p0, Lcom/android/server/display/SceneDetector;->mAonFlareService:Lcom/xiaomi/aon/IAONFlareService;

    .line 372
    iput-boolean v3, p0, Lcom/android/server/display/SceneDetector;->mServiceConnected:Z

    .line 373
    throw v0

    .line 371
    :cond_58
    :goto_58
    goto :goto_32

    .line 365
    :goto_59
    if-nez p1, :cond_70

    .line 366
    :try_start_5b
    iget-object v5, p0, Lcom/android/server/display/SceneDetector;->mContext:Landroid/content/Context;

    iget-object v6, p0, Lcom/android/server/display/SceneDetector;->mServiceConnection:Landroid/content/ServiceConnection;

    invoke-virtual {v5, v6}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V
    :try_end_62
    .catch Ljava/lang/IllegalArgumentException; {:try_start_5b .. :try_end_62} :catch_65
    .catchall {:try_start_5b .. :try_end_62} :catchall_63

    goto :goto_70

    .line 371
    :catchall_63
    move-exception v0

    goto :goto_6b

    .line 368
    :catch_65
    move-exception v5

    .line 369
    .local v5, "e":Ljava/lang/IllegalArgumentException;
    :try_start_66
    invoke-static {v1, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_69
    .catchall {:try_start_66 .. :try_end_69} :catchall_63

    .line 371
    nop

    .end local v5    # "e":Ljava/lang/IllegalArgumentException;
    goto :goto_71

    :goto_6b
    iput-object v2, p0, Lcom/android/server/display/SceneDetector;->mAonFlareService:Lcom/xiaomi/aon/IAONFlareService;

    .line 372
    iput-boolean v3, p0, Lcom/android/server/display/SceneDetector;->mServiceConnected:Z

    .line 373
    throw v0

    .line 371
    :cond_70
    :goto_70
    nop

    :goto_71
    iput-object v2, p0, Lcom/android/server/display/SceneDetector;->mAonFlareService:Lcom/xiaomi/aon/IAONFlareService;

    .line 372
    iput-boolean v3, p0, Lcom/android/server/display/SceneDetector;->mServiceConnected:Z

    .line 373
    nop

    .line 374
    throw v4

    .line 376
    :cond_77
    :goto_77
    return-void
.end method

.method private setAutoBrightnessEnabled(Z)V
    .registers 5
    .param p1, "enabled"    # Z

    .line 319
    iget-object v0, p0, Lcom/android/server/display/SceneDetector;->mSceneDetectorHandler:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 320
    iget-object v0, p0, Lcom/android/server/display/SceneDetector;->mSceneDetectorHandler:Landroid/os/Handler;

    const/4 v2, 0x3

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 322
    nop

    .line 325
    iget-object v0, p0, Lcom/android/server/display/SceneDetector;->mSceneDetectorHandler:Landroid/os/Handler;

    .line 322
    if-eqz p1, :cond_16

    .line 323
    invoke-virtual {v0, v1}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    .local v0, "msg":Landroid/os/Message;
    goto :goto_1a

    .line 325
    .end local v0    # "msg":Landroid/os/Message;
    :cond_16
    invoke-virtual {v0, v2}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    .line 327
    .restart local v0    # "msg":Landroid/os/Message;
    :goto_1a
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 328
    return-void
.end method

.method private setScreenPostureSensorEnabled(Z)V
    .registers 7
    .param p1, "enable"    # Z

    .line 608
    const-string v0, "SceneDetector"

    if-eqz p1, :cond_17

    .line 609
    const-string/jumbo v1, "setScreenPostureSensorEnabled enable"

    invoke-static {v0, v1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 610
    iget-object v0, p0, Lcom/android/server/display/SceneDetector;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/android/server/display/SceneDetector;->mSensorListener:Landroid/hardware/SensorEventListener;

    iget-object v2, p0, Lcom/android/server/display/SceneDetector;->mScreenPostureSenseSensor:Landroid/hardware/Sensor;

    const/4 v3, 0x3

    iget-object v4, p0, Lcom/android/server/display/SceneDetector;->mSceneDetectorHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;ILandroid/os/Handler;)Z

    goto :goto_26

    .line 613
    :cond_17
    const-string/jumbo v1, "setScreenPostureSensorEnabled disable"

    invoke-static {v0, v1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 614
    iget-object v0, p0, Lcom/android/server/display/SceneDetector;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/android/server/display/SceneDetector;->mSensorListener:Landroid/hardware/SensorEventListener;

    iget-object v2, p0, Lcom/android/server/display/SceneDetector;->mScreenPostureSenseSensor:Landroid/hardware/Sensor;

    invoke-virtual {v0, v1, v2}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;)V

    .line 616
    :goto_26
    return-void
.end method

.method private setStepSensorEnabled(Z)V
    .registers 7
    .param p1, "enable"    # Z

    .line 442
    const-string v0, "SceneDetector"

    if-eqz p1, :cond_17

    .line 443
    const-string/jumbo v1, "setStepSensorEnabled enable"

    invoke-static {v0, v1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 444
    iget-object v0, p0, Lcom/android/server/display/SceneDetector;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/android/server/display/SceneDetector;->mSensorListener:Landroid/hardware/SensorEventListener;

    iget-object v2, p0, Lcom/android/server/display/SceneDetector;->mStepSensor:Landroid/hardware/Sensor;

    const/4 v3, 0x3

    iget-object v4, p0, Lcom/android/server/display/SceneDetector;->mSceneDetectorHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;ILandroid/os/Handler;)Z

    goto :goto_26

    .line 447
    :cond_17
    const-string/jumbo v1, "setStepSensorEnabled disable"

    invoke-static {v0, v1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 448
    iget-object v0, p0, Lcom/android/server/display/SceneDetector;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/android/server/display/SceneDetector;->mSensorListener:Landroid/hardware/SensorEventListener;

    iget-object v2, p0, Lcom/android/server/display/SceneDetector;->mStepSensor:Landroid/hardware/Sensor;

    invoke-virtual {v0, v1, v2}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;)V

    .line 450
    :goto_26
    return-void
.end method

.method private tryToBindAonFlareService()V
    .registers 7

    .line 201
    iget-object v0, p0, Lcom/android/server/display/SceneDetector;->mServiceComponent:Landroid/content/ComponentName;

    if-nez v0, :cond_5

    .line 203
    return-void

    .line 205
    :cond_5
    iget-boolean v0, p0, Lcom/android/server/display/SceneDetector;->mServiceConnected:Z

    if-eqz v0, :cond_e

    iget-object v0, p0, Lcom/android/server/display/SceneDetector;->mAonFlareService:Lcom/xiaomi/aon/IAONFlareService;

    if-eqz v0, :cond_e

    .line 207
    return-void

    .line 209
    :cond_e
    invoke-static {}, Landroid/app/ActivityManager;->getCurrentUser()I

    move-result v0

    .line 210
    .local v0, "userId":I
    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.xiaomi.aon.AonFlareService"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 211
    .local v1, "intent":Landroid/content/Intent;
    iget-object v2, p0, Lcom/android/server/display/SceneDetector;->mServiceComponent:Landroid/content/ComponentName;

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 212
    const/high16 v2, 0x800000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 213
    iget-object v2, p0, Lcom/android/server/display/SceneDetector;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/android/server/display/SceneDetector;->mServiceConnection:Landroid/content/ServiceConnection;

    new-instance v4, Landroid/os/UserHandle;

    invoke-direct {v4, v0}, Landroid/os/UserHandle;-><init>(I)V

    const/4 v5, 0x1

    invoke-virtual {v2, v1, v3, v5, v4}, Landroid/content/Context;->bindServiceAsUser(Landroid/content/Intent;Landroid/content/ServiceConnection;ILandroid/os/UserHandle;)Z

    move-result v2

    if-nez v2, :cond_4c

    .line 215
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "unable to bind service: bindService failed "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "SceneDetector"

    invoke-static {v3, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 217
    :cond_4c
    iget-object v2, p0, Lcom/android/server/display/SceneDetector;->mBrightnessControllerImpl:Lcom/android/server/display/AutomaticBrightnessControllerImpl;

    invoke-virtual {v2}, Lcom/android/server/display/AutomaticBrightnessControllerImpl;->notifyUpdateBrightness()V

    .line 218
    return-void
.end method

.method private unregisterAonFlareListener()V
    .registers 5

    .line 333
    const-string v0, "SceneDetector"

    :try_start_2
    iget-object v1, p0, Lcom/android/server/display/SceneDetector;->mAonFlareService:Lcom/xiaomi/aon/IAONFlareService;

    iget-object v2, p0, Lcom/android/server/display/SceneDetector;->mMiAONListener:Lcom/xiaomi/aon/IMiAONListener;

    const/4 v3, 0x5

    invoke-interface {v1, v3, v2}, Lcom/xiaomi/aon/IAONFlareService;->unregisterListener(ILcom/xiaomi/aon/IMiAONListener;)V

    .line 334
    iget-object v1, p0, Lcom/android/server/display/SceneDetector;->mSceneDetectorHandler:Landroid/os/Handler;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 335
    iput v2, p0, Lcom/android/server/display/SceneDetector;->mAonState:I

    .line 336
    const-string/jumbo v1, "unregisterAonFlareListener: unregister aon flare listener success."

    invoke-static {v0, v1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_18
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_18} :catch_19

    .line 339
    goto :goto_20

    .line 337
    :catch_19
    move-exception v1

    .line 338
    .local v1, "e":Landroid/os/RemoteException;
    const-string/jumbo v2, "unregisterAonFlareListener: unregister aon flare listener failed."

    invoke-static {v0, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 340
    .end local v1    # "e":Landroid/os/RemoteException;
    :goto_20
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/server/display/SceneDetector;->mNeedCheckAonFlare:Z

    .line 341
    return-void
.end method

.method private updateAutoBrightness()V
    .registers 3

    .line 234
    iget-object v0, p0, Lcom/android/server/display/SceneDetector;->mMainHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/server/display/SceneDetector$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Lcom/android/server/display/SceneDetector$$ExternalSyntheticLambda1;-><init>(Lcom/android/server/display/SceneDetector;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 238
    return-void
.end method


# virtual methods
.method public configure(Z)V
    .registers 3
    .param p1, "enable"    # Z

    .line 308
    if-nez p1, :cond_d

    iget-boolean v0, p0, Lcom/android/server/display/SceneDetector;->mAutomaticBrightnessEnable:Z

    if-eqz v0, :cond_d

    .line 309
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/server/display/SceneDetector;->mAutomaticBrightnessEnable:Z

    .line 310
    invoke-direct {p0, v0}, Lcom/android/server/display/SceneDetector;->setAutoBrightnessEnabled(Z)V

    goto :goto_19

    .line 311
    :cond_d
    if-eqz p1, :cond_19

    iget-boolean v0, p0, Lcom/android/server/display/SceneDetector;->mAutomaticBrightnessEnable:Z

    if-nez v0, :cond_19

    .line 312
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/server/display/SceneDetector;->mAutomaticBrightnessEnable:Z

    .line 313
    invoke-direct {p0, v0}, Lcom/android/server/display/SceneDetector;->setAutoBrightnessEnabled(Z)V

    .line 315
    :cond_19
    :goto_19
    return-void
.end method

.method protected dump(Ljava/io/PrintWriter;)V
    .registers 4
    .param p1, "pw"    # Ljava/io/PrintWriter;

    .line 627
    invoke-virtual {p1}, Ljava/io/PrintWriter;->println()V

    .line 628
    const-string v0, "Scene Detector State:"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 629
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "  mMaxAonFlareEnableLux="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/server/display/SceneDetector;->mMaxAonFlareEnableLux:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 630
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "  mMinAonFlareEnableLux="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/server/display/SceneDetector;->mMinAonFlareEnableLux:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 631
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "  mAonFlareMaxDelayTime="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/server/display/SceneDetector;->mAonFlareMaxDelayTime:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 632
    sget-boolean v0, Lcom/android/server/display/DisplayDebugConfig;->DEBUG_ABC:Z

    sput-boolean v0, Lcom/android/server/display/SceneDetector;->sDEBUG:Z

    .line 633
    return-void
.end method

.method public isNeedSkipBrightnessChange()Z
    .registers 3

    .line 189
    iget-boolean v0, p0, Lcom/android/server/display/SceneDetector;->mNeedCheckProximitySensor:Z

    if-nez v0, :cond_8

    iget-boolean v0, p0, Lcom/android/server/display/SceneDetector;->mNeedCheckAonFlare:Z

    if-eqz v0, :cond_2f

    .line 190
    :cond_8
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "mNeedCheckAonFlare:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/android/server/display/SceneDetector;->mNeedCheckAonFlare:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", mNeedCheckProximitySensor:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/android/server/display/SceneDetector;->mNeedCheckProximitySensor:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "SceneDetector"

    invoke-static {v1, v0}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 193
    :cond_2f
    iget-boolean v0, p0, Lcom/android/server/display/SceneDetector;->mNeedCheckAonFlare:Z

    if-nez v0, :cond_3a

    iget-boolean v0, p0, Lcom/android/server/display/SceneDetector;->mNeedCheckProximitySensor:Z

    if-eqz v0, :cond_38

    goto :goto_3a

    :cond_38
    const/4 v0, 0x0

    goto :goto_3b

    :cond_3a
    :goto_3a
    const/4 v0, 0x1

    :goto_3b
    return v0
.end method

.method public isNeedStreamProximitySensorEnabled()Z
    .registers 4

    .line 265
    iget-boolean v0, p0, Lcom/android/server/display/SceneDetector;->mUseProximityInGameEnabled:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_14

    .line 266
    iget v0, p0, Lcom/android/server/display/SceneDetector;->mProxState:I

    const/4 v2, 0x7

    if-ne v0, v2, :cond_13

    iget-object v0, p0, Lcom/android/server/display/SceneDetector;->mBrightnessControllerImpl:Lcom/android/server/display/AutomaticBrightnessControllerImpl;

    invoke-virtual {v0}, Lcom/android/server/display/AutomaticBrightnessControllerImpl;->isGameSceneEnabled()Z

    move-result v0

    if-eqz v0, :cond_13

    const/4 v1, 0x1

    :cond_13
    return v1

    .line 268
    :cond_14
    return v1
.end method

.method public isReflectiveScene()Z
    .registers 2

    .line 619
    iget-boolean v0, p0, Lcom/android/server/display/SceneDetector;->mIsReflectiveScene:Z

    return v0
.end method

.method public onProximitySensorChanged(Landroid/hardware/SensorEvent;)V
    .registers 4
    .param p1, "event"    # Landroid/hardware/SensorEvent;

    .line 471
    iget-object v0, p0, Lcom/android/server/display/SceneDetector;->mSceneDetectorHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/server/display/SceneDetector$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1}, Lcom/android/server/display/SceneDetector$$ExternalSyntheticLambda0;-><init>(Lcom/android/server/display/SceneDetector;Landroid/hardware/SensorEvent;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 486
    return-void
.end method

.method public setDisplayId(I)V
    .registers 2
    .param p1, "displayId"    # I

    .line 623
    iput p1, p0, Lcom/android/server/display/SceneDetector;->mDisplayId:I

    .line 624
    return-void
.end method

.method public setStreamProximitySensorEnabled(Z)V
    .registers 8
    .param p1, "enable"    # Z

    .line 274
    iget-object v0, p0, Lcom/android/server/display/SceneDetector;->mStreamProximitySensor:Landroid/hardware/Sensor;

    if-eqz v0, :cond_49

    .line 275
    const/4 v0, 0x6

    const-string v1, "SceneDetector"

    const/16 v2, 0x8

    const/4 v3, 0x7

    if-eqz p1, :cond_2a

    iget v4, p0, Lcom/android/server/display/SceneDetector;->mProxState:I

    if-ne v4, v3, :cond_2a

    .line 276
    const-string/jumbo v3, "setStreamProximitySensorEnabled enable"

    invoke-static {v1, v3}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 277
    iget-object v1, p0, Lcom/android/server/display/SceneDetector;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v3, p0, Lcom/android/server/display/SceneDetector;->mSensorListener:Landroid/hardware/SensorEventListener;

    iget-object v4, p0, Lcom/android/server/display/SceneDetector;->mStreamProximitySensor:Landroid/hardware/Sensor;

    const/4 v5, 0x1

    invoke-virtual {v1, v3, v4, v5}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 279
    iget-object v1, p0, Lcom/android/server/display/SceneDetector;->mSceneDetectorHandler:Landroid/os/Handler;

    const-wide/16 v3, 0x1f4

    invoke-virtual {v1, v0, v3, v4}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 281
    iput v2, p0, Lcom/android/server/display/SceneDetector;->mProxState:I

    goto :goto_49

    .line 282
    :cond_2a
    if-nez p1, :cond_49

    iget v4, p0, Lcom/android/server/display/SceneDetector;->mProxState:I

    if-ne v4, v2, :cond_49

    .line 283
    const-string/jumbo v2, "setStreamProximitySensorEnabled disable"

    invoke-static {v1, v2}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 284
    iget-object v1, p0, Lcom/android/server/display/SceneDetector;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v2, p0, Lcom/android/server/display/SceneDetector;->mSensorListener:Landroid/hardware/SensorEventListener;

    iget-object v4, p0, Lcom/android/server/display/SceneDetector;->mStreamProximitySensor:Landroid/hardware/Sensor;

    invoke-virtual {v1, v2, v4}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;)V

    .line 285
    iget-object v1, p0, Lcom/android/server/display/SceneDetector;->mSceneDetectorHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeMessages(I)V

    .line 286
    iput v3, p0, Lcom/android/server/display/SceneDetector;->mProxState:I

    .line 287
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/server/display/SceneDetector;->mNeedCheckProximitySensor:Z

    .line 290
    :cond_49
    :goto_49
    return-void
.end method

.method public updateAmbientLux(IFZ)V
    .registers 9
    .param p1, "event"    # I
    .param p2, "lux"    # F
    .param p3, "isMainDarkenEvent"    # Z

    .line 153
    iget-object v0, p0, Lcom/android/server/display/SceneDetector;->mDualSensorPolicyListener:Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;

    invoke-interface {v0}, Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;->getAmbientLux()F

    move-result v0

    .line 154
    .local v0, "preLux":F
    iput p2, p0, Lcom/android/server/display/SceneDetector;->mAmbientLux:F

    .line 156
    iget-object v1, p0, Lcom/android/server/display/SceneDetector;->mSceneDetectorHandler:Landroid/os/Handler;

    new-instance v2, Lcom/android/server/display/SceneDetector$$ExternalSyntheticLambda2;

    invoke-direct {v2, p0, p3}, Lcom/android/server/display/SceneDetector$$ExternalSyntheticLambda2;-><init>(Lcom/android/server/display/SceneDetector;Z)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 160
    const/4 v1, 0x1

    if-eqz p3, :cond_6e

    iget v2, p0, Lcom/android/server/display/SceneDetector;->mDisplayId:I

    if-nez v2, :cond_6e

    .line 161
    iget v2, p0, Lcom/android/server/display/SceneDetector;->mMaxAonFlareEnableLux:F

    cmpg-float v2, p2, v2

    if-gtz v2, :cond_25

    iget v2, p0, Lcom/android/server/display/SceneDetector;->mMinAonFlareEnableLux:F

    cmpl-float v2, p2, v2

    if-gez v2, :cond_2f

    .line 162
    :cond_25
    invoke-virtual {p0}, Lcom/android/server/display/SceneDetector;->isNeedStreamProximitySensorEnabled()Z

    move-result v2

    if-eqz v2, :cond_68

    iget-boolean v2, p0, Lcom/android/server/display/SceneDetector;->mTransientProximityEnabled:Z

    if-eqz v2, :cond_68

    .line 164
    :cond_2f
    iget-object v2, p0, Lcom/android/server/display/SceneDetector;->mDualSensorPolicyListener:Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;

    const/4 v3, 0x0

    invoke-interface {v2, p1, p2, v1, v3}, Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;->updateAmbientLux(IFZZ)V

    .line 165
    iget v2, p0, Lcom/android/server/display/SceneDetector;->mMaxAonFlareEnableLux:F

    cmpg-float v2, p2, v2

    if-gtz v2, :cond_4c

    iget v2, p0, Lcom/android/server/display/SceneDetector;->mMinAonFlareEnableLux:F

    cmpl-float v2, p2, v2

    if-ltz v2, :cond_4c

    .line 166
    iget-object v2, p0, Lcom/android/server/display/SceneDetector;->mSceneDetectorHandler:Landroid/os/Handler;

    new-instance v4, Lcom/android/server/display/SceneDetector$$ExternalSyntheticLambda3;

    invoke-direct {v4, p0, v0}, Lcom/android/server/display/SceneDetector$$ExternalSyntheticLambda3;-><init>(Lcom/android/server/display/SceneDetector;F)V

    invoke-virtual {v2, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_4e

    .line 170
    :cond_4c
    iput-boolean v3, p0, Lcom/android/server/display/SceneDetector;->mNeedCheckAonFlare:Z

    .line 172
    :goto_4e
    invoke-virtual {p0}, Lcom/android/server/display/SceneDetector;->isNeedStreamProximitySensorEnabled()Z

    move-result v2

    if-eqz v2, :cond_65

    iget-boolean v2, p0, Lcom/android/server/display/SceneDetector;->mTransientProximityEnabled:Z

    if-eqz v2, :cond_65

    .line 173
    iget-object v2, p0, Lcom/android/server/display/SceneDetector;->mSceneDetectorHandler:Landroid/os/Handler;

    new-instance v3, Lcom/android/server/display/SceneDetector$$ExternalSyntheticLambda4;

    invoke-direct {v3, p0}, Lcom/android/server/display/SceneDetector$$ExternalSyntheticLambda4;-><init>(Lcom/android/server/display/SceneDetector;)V

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 176
    iput-boolean v1, p0, Lcom/android/server/display/SceneDetector;->mNeedCheckProximitySensor:Z

    goto :goto_73

    .line 178
    :cond_65
    iput-boolean v3, p0, Lcom/android/server/display/SceneDetector;->mNeedCheckProximitySensor:Z

    goto :goto_73

    .line 181
    :cond_68
    iget-object v2, p0, Lcom/android/server/display/SceneDetector;->mDualSensorPolicyListener:Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;

    invoke-interface {v2, p1, p2, v1, v1}, Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;->updateAmbientLux(IFZZ)V

    goto :goto_73

    .line 184
    :cond_6e
    iget-object v2, p0, Lcom/android/server/display/SceneDetector;->mDualSensorPolicyListener:Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;

    invoke-interface {v2, p1, p2, v1, v1}, Lcom/android/server/display/AutomaticBrightnessControllerStub$DualSensorPolicyListener;->updateAmbientLux(IFZZ)V

    .line 186
    :goto_73
    return-void
.end method

.method public useProximityInGameEnabled()Z
    .registers 2

    .line 197
    iget-boolean v0, p0, Lcom/android/server/display/SceneDetector;->mUseProximityInGameEnabled:Z

    return v0
.end method
