.class Lcom/example/fallsafe/MainActivity$BleCallback$2;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/fallsafe/MainActivity$BleCallback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/example/fallsafe/MainActivity$BleCallback;


# direct methods
.method constructor <init>(Lcom/example/fallsafe/MainActivity$BleCallback;)V
    .locals 0

    iput-object p1, p0, Lcom/example/fallsafe/MainActivity$BleCallback$2;->this$1:Lcom/example/fallsafe/MainActivity$BleCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/example/fallsafe/MainActivity$BleCallback$2;->this$1:Lcom/example/fallsafe/MainActivity$BleCallback;

    iget-object v0, v0, Lcom/example/fallsafe/MainActivity$BleCallback;->this$0:Lcom/example/fallsafe/MainActivity;

    invoke-static {v0}, Lcom/example/fallsafe/MainActivity;->-$$Nest$fgetConnectButton(Lcom/example/fallsafe/MainActivity;)Landroid/widget/Button;

    move-result-object v1

    const-string v2, "Connect Device"

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object v1, p0, Lcom/example/fallsafe/MainActivity$BleCallback$2;->this$1:Lcom/example/fallsafe/MainActivity$BleCallback;

    iget-object v1, v1, Lcom/example/fallsafe/MainActivity$BleCallback;->this$0:Lcom/example/fallsafe/MainActivity;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/example/fallsafe/MainActivity;->updateConnectionStatus(Z)V

    const-string v2, "FallSafe Disconnected"

    const/4 v3, 0x1

    iget-object v0, p0, Lcom/example/fallsafe/MainActivity$BleCallback$2;->this$1:Lcom/example/fallsafe/MainActivity$BleCallback;

    iget-object v0, v0, Lcom/example/fallsafe/MainActivity$BleCallback;->this$0:Lcom/example/fallsafe/MainActivity;

    invoke-static {v0, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method
