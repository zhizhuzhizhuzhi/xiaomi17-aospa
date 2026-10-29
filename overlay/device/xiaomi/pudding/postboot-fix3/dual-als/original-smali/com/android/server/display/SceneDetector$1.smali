.class Lcom/android/server/display/SceneDetector$1;
.super Ljava/lang/Object;
.source "SceneDetector.java"

# interfaces
.implements Landroid/os/IBinder$DeathRecipient;


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
.method public static synthetic $r8$lambda$iweT3QJk_VQBP5XzUSuzLx6akmw(Lcom/android/server/display/SceneDetector$1;)V
    .registers 1

    invoke-direct {p0}, Lcom/android/server/display/SceneDetector$1;->lambda$binderDied$0()V

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

    .line 343
    iput-object p1, p0, Lcom/android/server/display/SceneDetector$1;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private synthetic lambda$binderDied$0()V
    .registers 4

    .line 348
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$1;->this$0:Lcom/android/server/display/SceneDetector;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/android/server/display/SceneDetector;->-$$Nest$fputmAonState(Lcom/android/server/display/SceneDetector;I)V

    .line 349
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$1;->this$0:Lcom/android/server/display/SceneDetector;

    const/4 v2, 0x0

    invoke-static {v0, v2}, Lcom/android/server/display/SceneDetector;->-$$Nest$fputmNeedCheckAonFlare(Lcom/android/server/display/SceneDetector;Z)V

    .line 350
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$1;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v0, v1}, Lcom/android/server/display/SceneDetector;->-$$Nest$mresetServiceConnectedStatus(Lcom/android/server/display/SceneDetector;Z)V

    .line 351
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$1;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v0}, Lcom/android/server/display/SceneDetector;->-$$Nest$mtryToBindAonFlareService(Lcom/android/server/display/SceneDetector;)V

    .line 352
    const-string v0, "SceneDetector"

    const-string v1, "Process of service has died, try to bind it."

    invoke-static {v0, v1}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 353
    return-void
.end method


# virtual methods
.method public binderDied()V
    .registers 3

    .line 347
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$1;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v0}, Lcom/android/server/display/SceneDetector;->-$$Nest$fgetmSceneDetectorHandler(Lcom/android/server/display/SceneDetector;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/android/server/display/SceneDetector$1$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lcom/android/server/display/SceneDetector$1$$ExternalSyntheticLambda0;-><init>(Lcom/android/server/display/SceneDetector$1;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 354
    return-void
.end method
