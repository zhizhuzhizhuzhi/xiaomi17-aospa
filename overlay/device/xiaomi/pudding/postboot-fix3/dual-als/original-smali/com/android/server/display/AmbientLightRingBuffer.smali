.class public Lcom/android/server/display/AmbientLightRingBuffer;
.super Ljava/lang/Object;
.source "AmbientLightRingBuffer.java"


# static fields
.field private static final AMBIENT_LIGHT_PREDICTION_TIME_MILLIS:J = 0x64L

.field private static final BUFFER_SLACK:F = 1.5f


# instance fields
.field private mBrighteningLightDebounceConfig:J

.field private mCapacity:I

.field private mCount:I

.field private mDarkeningLightDebounceConfig:J

.field private mEnd:I

.field private mRingLux:[F

.field private mRingTime:[J

.field private mSmallBrighteningLightDebounceConfig:J

.field private mStart:I

.field private final mWeightingIntercept:I


# direct methods
.method public constructor <init>(JI)V
    .registers 6
    .param p1, "lightSensorRate"    # J
    .param p3, "ambientLightHorizon"    # I

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    int-to-float v0, p3

    const/high16 v1, 0x3fc00000    # 1.5f

    mul-float/2addr v0, v1

    long-to-float v1, p1

    div-float/2addr v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int v0, v0

    iput v0, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mCapacity:I

    .line 37
    iget v0, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mCapacity:I

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mRingLux:[F

    .line 38
    iget v0, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mCapacity:I

    new-array v0, v0, [J

    iput-object v0, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mRingTime:[J

    .line 39
    iput p3, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mWeightingIntercept:I

    .line 40
    return-void
.end method

.method private calculateWeight(JJ)F
    .registers 7
    .param p1, "startDelta"    # J
    .param p3, "endDelta"    # J

    .line 189
    invoke-direct {p0, p3, p4}, Lcom/android/server/display/AmbientLightRingBuffer;->weightIntegral(J)F

    move-result v0

    invoke-direct {p0, p1, p2}, Lcom/android/server/display/AmbientLightRingBuffer;->weightIntegral(J)F

    move-result v1

    sub-float/2addr v0, v1

    return v0
.end method

.method private offsetOf(I)I
    .registers 3
    .param p1, "index"    # I

    .line 138
    iget v0, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mCount:I

    if-ge p1, v0, :cond_11

    if-ltz p1, :cond_11

    .line 141
    iget v0, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mStart:I

    add-int/2addr p1, v0

    .line 142
    iget v0, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mCapacity:I

    if-lt p1, v0, :cond_10

    .line 143
    iget v0, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mCapacity:I

    sub-int/2addr p1, v0

    .line 145
    :cond_10
    return p1

    .line 139
    :cond_11
    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v0, p1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(I)V

    throw v0
.end method

.method private weightIntegral(J)F
    .registers 6
    .param p1, "x"    # J

    .line 195
    long-to-float v0, p1

    long-to-float v1, p1

    const/high16 v2, 0x3f000000    # 0.5f

    mul-float/2addr v1, v2

    iget v2, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mWeightingIntercept:I

    int-to-float v2, v2

    add-float/2addr v1, v2

    mul-float/2addr v0, v1

    return v0
.end method


# virtual methods
.method public calculateAmbientLux(JJ)F
    .registers 22
    .param p1, "now"    # J
    .param p3, "horizon"    # J

    .line 150
    move-object/from16 v0, p0

    invoke-virtual {v0}, Lcom/android/server/display/AmbientLightRingBuffer;->size()I

    move-result v1

    .line 151
    .local v1, "N":I
    if-nez v1, :cond_b

    .line 152
    const/high16 v2, -0x40800000    # -1.0f

    return v2

    .line 156
    :cond_b
    const/4 v2, 0x0

    .line 157
    .local v2, "endIndex":I
    sub-long v3, p1, p3

    .line 158
    .local v3, "horizonStartTime":J
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_f
    add-int/lit8 v6, v1, -0x1

    if-ge v5, v6, :cond_22

    .line 159
    add-int/lit8 v6, v5, 0x1

    invoke-virtual {v0, v6}, Lcom/android/server/display/AmbientLightRingBuffer;->getTime(I)J

    move-result-wide v6

    cmp-long v6, v6, v3

    if-gtz v6, :cond_22

    .line 160
    add-int/lit8 v2, v2, 0x1

    .line 158
    add-int/lit8 v5, v5, 0x1

    goto :goto_f

    .line 166
    .end local v5    # "i":I
    :cond_22
    const/4 v5, 0x0

    .line 167
    .local v5, "sum":F
    const/4 v6, 0x0

    .line 168
    .local v6, "totalWeight":F
    const-wide/16 v7, 0x64

    .line 169
    .local v7, "endTime":J
    add-int/lit8 v9, v1, -0x1

    .local v9, "i":I
    :goto_28
    if-lt v9, v2, :cond_48

    .line 170
    invoke-virtual {v0, v9}, Lcom/android/server/display/AmbientLightRingBuffer;->getTime(I)J

    move-result-wide v10

    .line 171
    .local v10, "eventTime":J
    if-ne v9, v2, :cond_35

    cmp-long v12, v10, v3

    if-gez v12, :cond_35

    .line 174
    move-wide v10, v3

    .line 176
    :cond_35
    sub-long v12, v10, p1

    .line 177
    .local v12, "startTime":J
    invoke-direct {v0, v12, v13, v7, v8}, Lcom/android/server/display/AmbientLightRingBuffer;->calculateWeight(JJ)F

    move-result v14

    .line 178
    .local v14, "weight":F
    invoke-virtual {v0, v9}, Lcom/android/server/display/AmbientLightRingBuffer;->getLux(I)F

    move-result v15

    .line 180
    .local v15, "lux":F
    add-float/2addr v6, v14

    .line 181
    mul-float v16, v15, v14

    add-float v5, v5, v16

    .line 182
    move-wide v7, v12

    .line 169
    .end local v10    # "eventTime":J
    .end local v12    # "startTime":J
    .end local v14    # "weight":F
    .end local v15    # "lux":F
    add-int/lit8 v9, v9, -0x1

    goto :goto_28

    .line 185
    .end local v9    # "i":I
    :cond_48
    div-float v9, v5, v6

    return v9
.end method

.method public clear()V
    .registers 2

    .line 114
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mStart:I

    .line 115
    iput v0, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mEnd:I

    .line 116
    iput v0, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mCount:I

    .line 117
    return-void
.end method

.method public getLux(I)F
    .registers 4
    .param p1, "index"    # I

    .line 43
    iget-object v0, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mRingLux:[F

    invoke-direct {p0, p1}, Lcom/android/server/display/AmbientLightRingBuffer;->offsetOf(I)I

    move-result v1

    aget v0, v0, v1

    return v0
.end method

.method public getTime(I)J
    .registers 4
    .param p1, "index"    # I

    .line 47
    iget-object v0, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mRingTime:[J

    invoke-direct {p0, p1}, Lcom/android/server/display/AmbientLightRingBuffer;->offsetOf(I)I

    move-result v1

    aget-wide v0, v0, v1

    return-wide v0
.end method

.method nextAmbientLightBrighteningTransition(JF)J
    .registers 9
    .param p1, "time"    # J
    .param p3, "brighteningThreshold"    # F

    .line 199
    invoke-virtual {p0}, Lcom/android/server/display/AmbientLightRingBuffer;->size()I

    move-result v0

    .line 200
    .local v0, "N":I
    move-wide v1, p1

    .line 201
    .local v1, "earliestValidTime":J
    add-int/lit8 v3, v0, -0x1

    .local v3, "i":I
    :goto_7
    if-ltz v3, :cond_19

    .line 202
    invoke-virtual {p0, v3}, Lcom/android/server/display/AmbientLightRingBuffer;->getLux(I)F

    move-result v4

    cmpg-float v4, v4, p3

    if-gtz v4, :cond_12

    .line 203
    goto :goto_19

    .line 205
    :cond_12
    invoke-virtual {p0, v3}, Lcom/android/server/display/AmbientLightRingBuffer;->getTime(I)J

    move-result-wide v1

    .line 201
    add-int/lit8 v3, v3, -0x1

    goto :goto_7

    .line 207
    .end local v3    # "i":I
    :cond_19
    :goto_19
    iget-wide v3, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mBrighteningLightDebounceConfig:J

    add-long/2addr v3, v1

    return-wide v3
.end method

.method nextAmbientLightBrighteningTransition(JFFF)J
    .registers 14
    .param p1, "time"    # J
    .param p3, "lux"    # F
    .param p4, "brighteningThreshold"    # F
    .param p5, "brighteningSmallThreshold"    # F

    .line 212
    cmpg-float v0, p3, p4

    if-gez v0, :cond_6

    .line 213
    move v0, p5

    goto :goto_7

    :cond_6
    move v0, p4

    .line 214
    .local v0, "threshold":F
    :goto_7
    cmpg-float v1, p3, p4

    if-gez v1, :cond_e

    .line 215
    iget-wide v1, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mSmallBrighteningLightDebounceConfig:J

    goto :goto_10

    :cond_e
    iget-wide v1, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mBrighteningLightDebounceConfig:J

    .line 216
    .local v1, "debounce":J
    :goto_10
    invoke-virtual {p0}, Lcom/android/server/display/AmbientLightRingBuffer;->size()I

    move-result v3

    .line 217
    .local v3, "N":I
    move-wide v4, p1

    .line 218
    .local v4, "earliestValidTime":J
    add-int/lit8 v6, v3, -0x1

    .local v6, "i":I
    :goto_17
    if-ltz v6, :cond_29

    .line 219
    invoke-virtual {p0, v6}, Lcom/android/server/display/AmbientLightRingBuffer;->getLux(I)F

    move-result v7

    cmpg-float v7, v7, v0

    if-gtz v7, :cond_22

    .line 220
    goto :goto_29

    .line 222
    :cond_22
    invoke-virtual {p0, v6}, Lcom/android/server/display/AmbientLightRingBuffer;->getTime(I)J

    move-result-wide v4

    .line 218
    add-int/lit8 v6, v6, -0x1

    goto :goto_17

    .line 224
    .end local v6    # "i":I
    :cond_29
    :goto_29
    add-long v6, v4, v1

    return-wide v6
.end method

.method nextAmbientLightDarkeningTransition(JF)J
    .registers 9
    .param p1, "time"    # J
    .param p3, "darkeningThreshold"    # F

    .line 228
    invoke-virtual {p0}, Lcom/android/server/display/AmbientLightRingBuffer;->size()I

    move-result v0

    .line 229
    .local v0, "N":I
    move-wide v1, p1

    .line 230
    .local v1, "earliestValidTime":J
    add-int/lit8 v3, v0, -0x1

    .local v3, "i":I
    :goto_7
    if-ltz v3, :cond_19

    .line 231
    invoke-virtual {p0, v3}, Lcom/android/server/display/AmbientLightRingBuffer;->getLux(I)F

    move-result v4

    cmpl-float v4, v4, p3

    if-ltz v4, :cond_12

    .line 232
    goto :goto_19

    .line 234
    :cond_12
    invoke-virtual {p0, v3}, Lcom/android/server/display/AmbientLightRingBuffer;->getTime(I)J

    move-result-wide v1

    .line 230
    add-int/lit8 v3, v3, -0x1

    goto :goto_7

    .line 237
    .end local v3    # "i":I
    :cond_19
    :goto_19
    iget-wide v3, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mDarkeningLightDebounceConfig:J

    add-long/2addr v3, v1

    return-wide v3
.end method

.method public prune(J)V
    .registers 7
    .param p1, "horizon"    # J

    .line 81
    iget v0, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mCount:I

    if-nez v0, :cond_5

    .line 82
    return-void

    .line 85
    :cond_5
    :goto_5
    iget v0, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mCount:I

    const/4 v1, 0x1

    if-le v0, v1, :cond_25

    .line 86
    iget v0, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mStart:I

    add-int/2addr v0, v1

    .line 87
    .local v0, "next":I
    iget v2, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mCapacity:I

    if-lt v0, v2, :cond_14

    .line 88
    iget v2, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mCapacity:I

    sub-int/2addr v0, v2

    .line 90
    :cond_14
    iget-object v2, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mRingTime:[J

    aget-wide v2, v2, v0

    cmp-long v2, v2, p1

    if-lez v2, :cond_1d

    .line 98
    goto :goto_25

    .line 100
    :cond_1d
    iput v0, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mStart:I

    .line 101
    iget v2, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mCount:I

    sub-int/2addr v2, v1

    iput v2, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mCount:I

    .line 102
    .end local v0    # "next":I
    goto :goto_5

    .line 104
    :cond_25
    :goto_25
    iget-object v0, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mRingTime:[J

    iget v1, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mStart:I

    aget-wide v0, v0, v1

    cmp-long v0, v0, p1

    if-gez v0, :cond_35

    .line 105
    iget-object v0, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mRingTime:[J

    iget v1, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mStart:I

    aput-wide p1, v0, v1

    .line 107
    :cond_35
    return-void
.end method

.method public push(JF)V
    .registers 12
    .param p1, "time"    # J
    .param p3, "lux"    # F

    .line 51
    iget v0, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mEnd:I

    .line 52
    .local v0, "next":I
    iget v1, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mCount:I

    iget v2, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mCapacity:I

    const/4 v3, 0x0

    if-ne v1, v2, :cond_40

    .line 53
    iget v1, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mCapacity:I

    mul-int/lit8 v1, v1, 0x2

    .line 55
    .local v1, "newSize":I
    new-array v2, v1, [F

    .line 56
    .local v2, "newRingLux":[F
    new-array v4, v1, [J

    .line 57
    .local v4, "newRingTime":[J
    iget v5, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mCapacity:I

    iget v6, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mStart:I

    sub-int/2addr v5, v6

    .line 58
    .local v5, "length":I
    iget-object v6, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mRingLux:[F

    iget v7, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mStart:I

    invoke-static {v6, v7, v2, v3, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 59
    iget-object v6, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mRingTime:[J

    iget v7, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mStart:I

    invoke-static {v6, v7, v4, v3, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 60
    iget v6, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mStart:I

    if-eqz v6, :cond_36

    .line 61
    iget-object v6, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mRingLux:[F

    iget v7, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mStart:I

    invoke-static {v6, v3, v2, v5, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 62
    iget-object v6, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mRingTime:[J

    iget v7, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mStart:I

    invoke-static {v6, v3, v4, v5, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 64
    :cond_36
    iput-object v2, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mRingLux:[F

    .line 65
    iput-object v4, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mRingTime:[J

    .line 67
    iget v0, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mCapacity:I

    .line 68
    iput v1, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mCapacity:I

    .line 69
    iput v3, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mStart:I

    .line 71
    .end local v1    # "newSize":I
    .end local v2    # "newRingLux":[F
    .end local v4    # "newRingTime":[J
    .end local v5    # "length":I
    :cond_40
    iget-object v1, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mRingTime:[J

    aput-wide p1, v1, v0

    .line 72
    iget-object v1, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mRingLux:[F

    aput p3, v1, v0

    .line 73
    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mEnd:I

    .line 74
    iget v1, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mEnd:I

    iget v2, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mCapacity:I

    if-ne v1, v2, :cond_54

    .line 75
    iput v3, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mEnd:I

    .line 77
    :cond_54
    iget v1, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mCount:I

    .line 78
    return-void
.end method

.method setBrighteningDebounce(J)V
    .registers 3
    .param p1, "brighteningDebounce"    # J

    .line 241
    iput-wide p1, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mBrighteningLightDebounceConfig:J

    .line 242
    return-void
.end method

.method setDarkeningDebounce(J)V
    .registers 3
    .param p1, "darkeningDebounce"    # J

    .line 245
    iput-wide p1, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mDarkeningLightDebounceConfig:J

    .line 246
    return-void
.end method

.method public setSmallBrighteningDebounce(J)V
    .registers 3
    .param p1, "smallBrighteningDebounce"    # J

    .line 249
    iput-wide p1, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mSmallBrighteningLightDebounceConfig:J

    .line 250
    return-void
.end method

.method public size()I
    .registers 2

    .line 110
    iget v0, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mCount:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 7

    .line 121
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 122
    .local v0, "buf":Ljava/lang/StringBuffer;
    const/16 v1, 0x5b

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 123
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_b
    iget v2, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mCount:I

    if-ge v1, v2, :cond_45

    .line 124
    add-int/lit8 v2, v1, 0x1

    iget v3, p0, Lcom/android/server/display/AmbientLightRingBuffer;->mCount:I

    if-ge v2, v3, :cond_1c

    add-int/lit8 v2, v1, 0x1

    invoke-virtual {p0, v2}, Lcom/android/server/display/AmbientLightRingBuffer;->getTime(I)J

    move-result-wide v2

    goto :goto_20

    :cond_1c
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    .line 125
    .local v2, "next":J
    :goto_20
    if-eqz v1, :cond_27

    .line 126
    const-string v4, ", "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 128
    :cond_27
    invoke-virtual {p0, v1}, Lcom/android/server/display/AmbientLightRingBuffer;->getLux(I)F

    move-result v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(F)Ljava/lang/StringBuffer;

    .line 129
    const-string v4, " / "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 130
    invoke-virtual {p0, v1}, Lcom/android/server/display/AmbientLightRingBuffer;->getTime(I)J

    move-result-wide v4

    sub-long v4, v2, v4

    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    .line 131
    const-string/jumbo v4, "ms"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 123
    .end local v2    # "next":J
    add-int/lit8 v1, v1, 0x1

    goto :goto_b

    .line 133
    .end local v1    # "i":I
    :cond_45
    const/16 v1, 0x5d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 134
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
