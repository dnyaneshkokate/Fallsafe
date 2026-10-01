.class Lcom/example/fallsafe/MainActivity$BleCallback$1;
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

    iput-object p1, p0, Lcom/example/fallsafe/MainActivity$BleCallback$1;->this$1:Lcom/example/fallsafe/MainActivity$BleCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    # Get MainActivity reference into v0
    iget-object v0, p0, Lcom/example/fallsafe/MainActivity$BleCallback$1;->this$1:Lcom/example/fallsafe/MainActivity$BleCallback;

    iget-object v0, v0, Lcom/example/fallsafe/MainActivity$BleCallback;->this$0:Lcom/example/fallsafe/MainActivity;

    # Update ConnectButton text to "Disconnect" and re-enable it
    invoke-static {v0}, Lcom/example/fallsafe/MainActivity;->-$$Nest$fgetConnectButton(Lcom/example/fallsafe/MainActivity;)Landroid/widget/Button;

    move-result-object v1

    if-eqz v1, :cond_skip_btn

    const-string v2, "Disconnect"

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setEnabled(Z)V

    :cond_skip_btn
    # Update connection status to true (connected, green)
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/example/fallsafe/MainActivity;->updateConnectionStatus(Z)V

    # Show toast
    const-string v1, "FallSafe Connected!"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    return-void
.end method
