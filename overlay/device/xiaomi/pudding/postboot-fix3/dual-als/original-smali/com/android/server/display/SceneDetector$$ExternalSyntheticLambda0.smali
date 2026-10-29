.class public final synthetic Lcom/android/server/display/SceneDetector$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/android/server/display/SceneDetector;

.field public final synthetic f$1:Landroid/hardware/SensorEvent;


# direct methods
.method public synthetic constructor <init>(Lcom/android/server/display/SceneDetector;Landroid/hardware/SensorEvent;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/server/display/SceneDetector$$ExternalSyntheticLambda0;->f$0:Lcom/android/server/display/SceneDetector;

    iput-object p2, p0, Lcom/android/server/display/SceneDetector$$ExternalSyntheticLambda0;->f$1:Landroid/hardware/SensorEvent;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    .line 0
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$$ExternalSyntheticLambda0;->f$0:Lcom/android/server/display/SceneDetector;

    iget-object v1, p0, Lcom/android/server/display/SceneDetector$$ExternalSyntheticLambda0;->f$1:Landroid/hardware/SensorEvent;

    invoke-static {v0, v1}, Lcom/android/server/display/SceneDetector;->$r8$lambda$5UNDayle3E3Z4JaMt8JT-uK9OBI(Lcom/android/server/display/SceneDetector;Landroid/hardware/SensorEvent;)V

    return-void
.end method
