.class Lcom/android/server/display/SceneDetector$3;
.super Lcom/xiaomi/aon/IMiAONListener$Stub;
.source "SceneDetector.java"


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
.method public static synthetic $r8$lambda$n1gJN0V5ty44QQcjhejd4UQ-dPQ(Lcom/android/server/display/SceneDetector$3;[I)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/android/server/display/SceneDetector$3;->lambda$onCallbackListener$0([I)V

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

    .line 409
    iput-object p1, p0, Lcom/android/server/display/SceneDetector$3;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-direct {p0}, Lcom/xiaomi/aon/IMiAONListener$Stub;-><init>()V

    return-void
.end method

.method private synthetic lambda$onCallbackListener$0([I)V
    .registers 8
    .param p1, "data"    # [I

    .line 415
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$3;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v0}, Lcom/android/server/display/SceneDetector;->-$$Nest$fgetmAonState(Lcom/android/server/display/SceneDetector;)I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_57

    .line 416
    const/4 v0, 0x0

    aget v2, p1, v0

    .line 421
    iget-object v3, p0, Lcom/android/server/display/SceneDetector$3;->this$0:Lcom/android/server/display/SceneDetector;

    .line 416
    const-string v4, "SceneDetector"

    const/4 v5, 0x1

    if-ne v2, v5, :cond_26

    .line 417
    invoke-static {v3}, Lcom/android/server/display/SceneDetector;->-$$Nest$fgetmBrightnessControllerImpl(Lcom/android/server/display/SceneDetector;)Lcom/android/server/display/AutomaticBrightnessControllerImpl;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/display/SceneDetector$3;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v1}, Lcom/android/server/display/SceneDetector;->-$$Nest$fgetmPreAmbientLux(Lcom/android/server/display/SceneDetector;)F

    move-result v1

    invoke-virtual {v0, v5, v1}, Lcom/android/server/display/AutomaticBrightnessControllerImpl;->notifyAonFlareEvents(IF)V

    .line 419
    const-string v0, "aon flare algo suppress this darken event!"

    invoke-static {v4, v0}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_52

    .line 421
    :cond_26
    invoke-static {v3}, Lcom/android/server/display/SceneDetector;->-$$Nest$fgetmBrightnessControllerImpl(Lcom/android/server/display/SceneDetector;)Lcom/android/server/display/AutomaticBrightnessControllerImpl;

    move-result-object v2

    iget-object v3, p0, Lcom/android/server/display/SceneDetector$3;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v3}, Lcom/android/server/display/SceneDetector;->-$$Nest$fgetmPreAmbientLux(Lcom/android/server/display/SceneDetector;)F

    move-result v3

    invoke-virtual {v2, v1, v3}, Lcom/android/server/display/AutomaticBrightnessControllerImpl;->notifyAonFlareEvents(IF)V

    .line 423
    iget-object v1, p0, Lcom/android/server/display/SceneDetector$3;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v1}, Lcom/android/server/display/SceneDetector;->-$$Nest$fgetmIsMainDarkenEvent(Lcom/android/server/display/SceneDetector;)Z

    move-result v1

    if-eqz v1, :cond_52

    iget-object v1, p0, Lcom/android/server/display/SceneDetector$3;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v1}, Lcom/android/server/display/SceneDetector;->-$$Nest$fgetmProximityStatus(Lcom/android/server/display/SceneDetector;)Z

    move-result v1

    if-nez v1, :cond_52

    .line 424
    iget-object v1, p0, Lcom/android/server/display/SceneDetector$3;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v1, v0}, Lcom/android/server/display/SceneDetector;->-$$Nest$fputmNeedCheckAonFlare(Lcom/android/server/display/SceneDetector;Z)V

    .line 425
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$3;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v0}, Lcom/android/server/display/SceneDetector;->-$$Nest$mupdateAutoBrightness(Lcom/android/server/display/SceneDetector;)V

    .line 426
    const-string v0, "aon flare algo not suppress this darken event!"

    invoke-static {v4, v0}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 429
    :cond_52
    :goto_52
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$3;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v0}, Lcom/android/server/display/SceneDetector;->-$$Nest$munregisterAonFlareListener(Lcom/android/server/display/SceneDetector;)V

    .line 431
    :cond_57
    return-void
.end method


# virtual methods
.method public onCallbackListener(I[I)V
    .registers 5
    .param p1, "type"    # I
    .param p2, "data"    # [I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 412
    const/4 v0, 0x5

    if-ne p1, v0, :cond_11

    .line 414
    iget-object v0, p0, Lcom/android/server/display/SceneDetector$3;->this$0:Lcom/android/server/display/SceneDetector;

    invoke-static {v0}, Lcom/android/server/display/SceneDetector;->-$$Nest$fgetmSceneDetectorHandler(Lcom/android/server/display/SceneDetector;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/android/server/display/SceneDetector$3$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p2}, Lcom/android/server/display/SceneDetector$3$$ExternalSyntheticLambda0;-><init>(Lcom/android/server/display/SceneDetector$3;[I)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 433
    :cond_11
    return-void
.end method

.method public onImageAvailiable(I)V
    .registers 2
    .param p1, "frameId"    # I

    .line 438
    return-void
.end method
