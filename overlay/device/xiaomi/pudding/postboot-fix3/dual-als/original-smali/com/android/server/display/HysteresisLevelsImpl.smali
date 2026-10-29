.class public Lcom/android/server/display/HysteresisLevelsImpl;
.super Lcom/android/server/display/HysteresisLevelsStub;
.source "HysteresisLevelsImpl.java"


# static fields
.field private static final HBM_MINIMUM_LUX:F = 6000.0f

.field private static final MIN_BRIGHTENING_SMALL_THRESHOLD_LUX:I = 0xa

.field private static final TAG:Ljava/lang/String; = "HysteresisLevelsImpl"


# instance fields
.field private mAmbientBrightnessThresholds:Lcom/android/server/display/config/HysteresisLevels;

.field private mBrighteningLightDebounceConfig:J

.field private mHbmController:Lcom/android/server/display/HighBrightnessModeController;

.field private mHysteresisBrightSpline:Landroid/util/Spline;

.field private mHysteresisDarkSpline:Landroid/util/Spline;

.field private mHysteresisSmallBrightSpline:Landroid/util/Spline;

.field private mRatioForBrightenSmallThreshold:F

.field private mSmallBrighteningLightDebounceConfig:J


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 13
    invoke-direct {p0}, Lcom/android/server/display/HysteresisLevelsStub;-><init>()V

    return-void
.end method


# virtual methods
.method public createHysteresisThresholdSpline([F[F[F[F)V
    .registers 11
    .param p1, "ambientBrighteningLux"    # [F
    .param p2, "ambientBrighteningThresholds"    # [F
    .param p3, "ambientDarkeningLux"    # [F
    .param p4, "ambientDarkeningThresholds"    # [F

    .line 55
    array-length v0, p1

    array-length v1, p2

    if-ne v0, v1, :cond_57

    array-length v0, p3

    array-length v1, p4

    if-eq v0, v1, :cond_9

    goto :goto_57

    .line 60
    :cond_9
    array-length v0, p1

    if-lez v0, :cond_56

    array-length v0, p2

    if-lez v0, :cond_56

    array-length v0, p3

    if-lez v0, :cond_56

    array-length v0, p4

    if-lez v0, :cond_56

    .line 62
    array-length v0, p1

    new-array v0, v0, [F

    .line 63
    .local v0, "smallAmbientBrighteningThresholds":[F
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_19
    array-length v2, p1

    if-ge v1, v2, :cond_44

    .line 64
    aget v2, p1, v1

    const/high16 v3, 0x41200000    # 10.0f

    cmpg-float v2, v2, v3

    if-gtz v2, :cond_29

    .line 65
    aget v2, p2, v1

    aput v2, v0, v1

    goto :goto_41

    .line 67
    :cond_29
    aget v2, p2, v1

    iget v3, p0, Lcom/android/server/display/HysteresisLevelsImpl;->mRatioForBrightenSmallThreshold:F

    mul-float/2addr v2, v3

    aget v3, p1, v1

    const/high16 v4, 0x3f800000    # 1.0f

    iget v5, p0, Lcom/android/server/display/HysteresisLevelsImpl;->mRatioForBrightenSmallThreshold:F

    sub-float/2addr v4, v5

    mul-float/2addr v3, v4

    add-float/2addr v2, v3

    .line 69
    .local v2, "temp":F
    add-int/lit8 v3, v1, -0x1

    aget v3, p2, v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(FF)F

    move-result v3

    aput v3, v0, v1

    .line 63
    .end local v2    # "temp":F
    :goto_41
    add-int/lit8 v1, v1, 0x1

    goto :goto_19

    .line 72
    .end local v1    # "i":I
    :cond_44
    invoke-static {p1, v0}, Landroid/util/Spline;->createLinearSpline([F[F)Landroid/util/Spline;

    move-result-object v1

    iput-object v1, p0, Lcom/android/server/display/HysteresisLevelsImpl;->mHysteresisSmallBrightSpline:Landroid/util/Spline;

    .line 74
    invoke-static {p1, p2}, Landroid/util/Spline;->createLinearSpline([F[F)Landroid/util/Spline;

    move-result-object v1

    iput-object v1, p0, Lcom/android/server/display/HysteresisLevelsImpl;->mHysteresisBrightSpline:Landroid/util/Spline;

    .line 75
    invoke-static {p3, p4}, Landroid/util/Spline;->createLinearSpline([F[F)Landroid/util/Spline;

    move-result-object v1

    iput-object v1, p0, Lcom/android/server/display/HysteresisLevelsImpl;->mHysteresisDarkSpline:Landroid/util/Spline;

    .line 77
    .end local v0    # "smallAmbientBrighteningThresholds":[F
    :cond_56
    return-void

    .line 57
    :cond_57
    :goto_57
    const-string v0, "HysteresisLevelsImpl"

    const-string v1, "Mismatch between hysteresis array lengths."

    invoke-static {v0, v1}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    return-void
.end method

.method dump(Ljava/io/PrintWriter;)V
    .registers 4
    .param p1, "pw"    # Ljava/io/PrintWriter;

    .line 122
    const-string v0, "MiuiHysteresisLevels:"

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 123
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "  mHysteresisBrightSpline="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/display/HysteresisLevelsImpl;->mHysteresisBrightSpline:Landroid/util/Spline;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 124
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "  mHysteresisDarkSpline="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/display/HysteresisLevelsImpl;->mHysteresisDarkSpline:Landroid/util/Spline;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 125
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "  mHysteresisSmallBrightSpline="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/display/HysteresisLevelsImpl;->mHysteresisSmallBrightSpline:Landroid/util/Spline;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 126
    return-void
.end method

.method public getBrighteningSmallThreshold(F)F
    .registers 5
    .param p1, "value"    # F

    .line 95
    iget-object v0, p0, Lcom/android/server/display/HysteresisLevelsImpl;->mHysteresisSmallBrightSpline:Landroid/util/Spline;

    if-eqz v0, :cond_2b

    .line 96
    iget-object v0, p0, Lcom/android/server/display/HysteresisLevelsImpl;->mHysteresisSmallBrightSpline:Landroid/util/Spline;

    invoke-virtual {v0, p1}, Landroid/util/Spline;->interpolate(F)F

    move-result v0

    .line 97
    .local v0, "brighteningSmallThreshold":F
    const v1, 0x45bb8000    # 6000.0f

    .line 98
    .local v1, "hbmMinValue":F
    iget-object v2, p0, Lcom/android/server/display/HysteresisLevelsImpl;->mHbmController:Lcom/android/server/display/HighBrightnessModeController;

    if-eqz v2, :cond_21

    iget-object v2, p0, Lcom/android/server/display/HysteresisLevelsImpl;->mHbmController:Lcom/android/server/display/HighBrightnessModeController;

    invoke-virtual {v2}, Lcom/android/server/display/HighBrightnessModeController;->deviceSupportsHbm()Z

    move-result v2

    if-eqz v2, :cond_21

    .line 99
    iget-object v2, p0, Lcom/android/server/display/HysteresisLevelsImpl;->mHbmController:Lcom/android/server/display/HighBrightnessModeController;

    invoke-virtual {v2}, Lcom/android/server/display/HighBrightnessModeController;->getHbmData()Lcom/android/server/display/config/HighBrightnessModeData;

    move-result-object v2

    iget v1, v2, Lcom/android/server/display/config/HighBrightnessModeData;->minimumLux:F

    .line 102
    :cond_21
    cmpl-float v2, p1, v1

    if-lez v2, :cond_29

    const/high16 v2, 0x3f800000    # 1.0f

    add-float/2addr v2, p1

    goto :goto_2a

    :cond_29
    move v2, v0

    :goto_2a
    return v2

    .line 104
    .end local v0    # "brighteningSmallThreshold":F
    .end local v1    # "hbmMinValue":F
    :cond_2b
    invoke-virtual {p0, p1}, Lcom/android/server/display/HysteresisLevelsImpl;->getBrighteningThreshold(F)F

    move-result v0

    return v0
.end method

.method public getBrighteningThreshold(F)F
    .registers 5
    .param p1, "value"    # F

    .line 81
    iget-object v0, p0, Lcom/android/server/display/HysteresisLevelsImpl;->mHysteresisBrightSpline:Landroid/util/Spline;

    if-eqz v0, :cond_2b

    .line 82
    iget-object v0, p0, Lcom/android/server/display/HysteresisLevelsImpl;->mHysteresisBrightSpline:Landroid/util/Spline;

    invoke-virtual {v0, p1}, Landroid/util/Spline;->interpolate(F)F

    move-result v0

    .line 83
    .local v0, "brighteningThreshold":F
    const v1, 0x45bb8000    # 6000.0f

    .line 84
    .local v1, "hbmMinValue":F
    iget-object v2, p0, Lcom/android/server/display/HysteresisLevelsImpl;->mHbmController:Lcom/android/server/display/HighBrightnessModeController;

    if-eqz v2, :cond_21

    iget-object v2, p0, Lcom/android/server/display/HysteresisLevelsImpl;->mHbmController:Lcom/android/server/display/HighBrightnessModeController;

    invoke-virtual {v2}, Lcom/android/server/display/HighBrightnessModeController;->deviceSupportsHbm()Z

    move-result v2

    if-eqz v2, :cond_21

    .line 85
    iget-object v2, p0, Lcom/android/server/display/HysteresisLevelsImpl;->mHbmController:Lcom/android/server/display/HighBrightnessModeController;

    invoke-virtual {v2}, Lcom/android/server/display/HighBrightnessModeController;->getHbmData()Lcom/android/server/display/config/HighBrightnessModeData;

    move-result-object v2

    iget v1, v2, Lcom/android/server/display/config/HighBrightnessModeData;->minimumLux:F

    .line 88
    :cond_21
    cmpl-float v2, p1, v1

    if-lez v2, :cond_29

    const/high16 v2, 0x3f800000    # 1.0f

    add-float/2addr v2, p1

    goto :goto_2a

    :cond_29
    move v2, v0

    :goto_2a
    return v2

    .line 90
    .end local v0    # "brighteningThreshold":F
    .end local v1    # "hbmMinValue":F
    :cond_2b
    iget-object v0, p0, Lcom/android/server/display/HysteresisLevelsImpl;->mAmbientBrightnessThresholds:Lcom/android/server/display/config/HysteresisLevels;

    invoke-virtual {v0, p1}, Lcom/android/server/display/config/HysteresisLevels;->getBrighteningThreshold(F)F

    move-result v0

    return v0
.end method

.method public getDarkeningThreshold(F)F
    .registers 3
    .param p1, "value"    # F

    .line 115
    iget-object v0, p0, Lcom/android/server/display/HysteresisLevelsImpl;->mHysteresisDarkSpline:Landroid/util/Spline;

    if-eqz v0, :cond_b

    .line 116
    iget-object v0, p0, Lcom/android/server/display/HysteresisLevelsImpl;->mHysteresisDarkSpline:Landroid/util/Spline;

    invoke-virtual {v0, p1}, Landroid/util/Spline;->interpolate(F)F

    move-result v0

    return v0

    .line 118
    :cond_b
    iget-object v0, p0, Lcom/android/server/display/HysteresisLevelsImpl;->mAmbientBrightnessThresholds:Lcom/android/server/display/config/HysteresisLevels;

    invoke-virtual {v0, p1}, Lcom/android/server/display/config/HysteresisLevels;->getDarkeningThreshold(F)F

    move-result v0

    return v0
.end method

.method public getSmallBrighteningLightDebounce()J
    .registers 3

    .line 110
    iget-wide v0, p0, Lcom/android/server/display/HysteresisLevelsImpl;->mSmallBrighteningLightDebounceConfig:J

    return-wide v0
.end method

.method public initialize(Lcom/android/server/display/HighBrightnessModeController;Lcom/android/server/display/config/HysteresisLevels;J)V
    .registers 10
    .param p1, "hbmController"    # Lcom/android/server/display/HighBrightnessModeController;
    .param p2, "ambientBrightnessThresholds"    # Lcom/android/server/display/config/HysteresisLevels;
    .param p3, "brighteningLightDebounceConfig"    # J

    .line 29
    iput-object p1, p0, Lcom/android/server/display/HysteresisLevelsImpl;->mHbmController:Lcom/android/server/display/HighBrightnessModeController;

    .line 30
    iput-object p2, p0, Lcom/android/server/display/HysteresisLevelsImpl;->mAmbientBrightnessThresholds:Lcom/android/server/display/config/HysteresisLevels;

    .line 31
    iput-wide p3, p0, Lcom/android/server/display/HysteresisLevelsImpl;->mBrighteningLightDebounceConfig:J

    .line 32
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x110b0043

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    int-to-long v0, v0

    iput-wide v0, p0, Lcom/android/server/display/HysteresisLevelsImpl;->mSmallBrighteningLightDebounceConfig:J

    .line 34
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x1107010a

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getFloat(I)F

    move-result v0

    iput v0, p0, Lcom/android/server/display/HysteresisLevelsImpl;->mRatioForBrightenSmallThreshold:F

    .line 37
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x1103001e

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->obtainTypedArray(I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 36
    invoke-static {v0}, Lcom/android/server/display/BrightnessMappingStrategy;->getFloatArray(Landroid/content/res/TypedArray;)[F

    move-result-object v0

    .line 40
    .local v0, "ambientBrighteningLux":[F
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x11030023

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->obtainTypedArray(I)Landroid/content/res/TypedArray;

    move-result-object v1

    .line 39
    invoke-static {v1}, Lcom/android/server/display/BrightnessMappingStrategy;->getFloatArray(Landroid/content/res/TypedArray;)[F

    move-result-object v1

    .line 43
    .local v1, "ambientBrighteningThresholds":[F
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x11030028

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->obtainTypedArray(I)Landroid/content/res/TypedArray;

    move-result-object v2

    .line 42
    invoke-static {v2}, Lcom/android/server/display/BrightnessMappingStrategy;->getFloatArray(Landroid/content/res/TypedArray;)[F

    move-result-object v2

    .line 46
    .local v2, "ambientDarkeningLux":[F
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x1103002d

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->obtainTypedArray(I)Landroid/content/res/TypedArray;

    move-result-object v3

    .line 45
    invoke-static {v3}, Lcom/android/server/display/BrightnessMappingStrategy;->getFloatArray(Landroid/content/res/TypedArray;)[F

    move-result-object v3

    .line 48
    .local v3, "ambientDarkeningThresholds":[F
    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/android/server/display/HysteresisLevelsImpl;->createHysteresisThresholdSpline([F[F[F[F)V

    .line 50
    return-void
.end method
