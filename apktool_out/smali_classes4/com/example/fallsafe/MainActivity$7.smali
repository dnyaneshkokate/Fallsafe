.class Lcom/example/fallsafe/MainActivity$7;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/fallsafe/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/example/fallsafe/MainActivity;

.field final synthetic val$bpmText:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/example/fallsafe/MainActivity;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/example/fallsafe/MainActivity$7;->this$0:Lcom/example/fallsafe/MainActivity;

    iput-object p2, p0, Lcom/example/fallsafe/MainActivity$7;->val$bpmText:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/example/fallsafe/MainActivity$7;->this$0:Lcom/example/fallsafe/MainActivity;

    invoke-static {v0}, Lcom/example/fallsafe/MainActivity;->-$$Nest$fgethrbutton(Lcom/example/fallsafe/MainActivity;)Landroid/widget/Button;

    move-result-object v0

    if-eqz v0, :cond_skip_ui

    iget-object v1, p0, Lcom/example/fallsafe/MainActivity$7;->val$bpmText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    :cond_skip_ui
    # Relay BPM to PC Manager Portal (isFall = false)
    iget-object v0, p0, Lcom/example/fallsafe/MainActivity$7;->this$0:Lcom/example/fallsafe/MainActivity;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/example/fallsafe/MainActivity$7;->val$bpmText:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/example/fallsafe/MainActivity;->sendTelemetryToPortal(ZLjava/lang/String;)V

    return-void
.end method
