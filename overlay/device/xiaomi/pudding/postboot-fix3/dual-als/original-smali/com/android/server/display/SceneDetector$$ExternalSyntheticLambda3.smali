.class public final synthetic Lcom/android/server/display/SceneDetector$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/android/server/display/SceneDetector;

.field public final synthetic f$1:F


# direct methods
.method public synthetic constructor <init>(Lcom/android/server/display/SceneDetector;F)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/server/display/SceneDetector$$ExternalSyntheticLambda3;->f$0:Lcom/android/server/display/SceneDetector;

    iput p2, p0, Lcom/android/server/display/SceneDetector$$ExternalSyntheticLambda3;->f$1:F

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    .line 0
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$$ExternalSyntheticLambda3;->f$0:Lcom/android/server/display/SceneDetector;

    iget v1, p0, Lcom/android/server/display/SceneDetector$$ExternalSyntheticLambda3;->f$1:F

    invoke-static {v0, v1}, Lcom/android/server/display/SceneDetector;->$r8$lambda$bBAntDiQqnzwGnWBF03q6Nmy5dY(Lcom/android/server/display/SceneDetector;F)V

    return-void
.end method
