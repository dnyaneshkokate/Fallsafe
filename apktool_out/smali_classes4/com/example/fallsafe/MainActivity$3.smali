.class Lcom/example/fallsafe/MainActivity$3;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/example/fallsafe/MainActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/example/fallsafe/MainActivity;


# direct methods
.method constructor <init>(Lcom/example/fallsafe/MainActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/example/fallsafe/MainActivity;

    iput-object p1, p0, Lcom/example/fallsafe/MainActivity$3;->this$0:Lcom/example/fallsafe/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    iget-object v0, p0, Lcom/example/fallsafe/MainActivity$3;->this$0:Lcom/example/fallsafe/MainActivity;

    # Check if already connected (mBluetoothGatt != null) -> disconnect
    iget-object v1, v0, Lcom/example/fallsafe/MainActivity;->mBluetoothGatt:Landroid/bluetooth/BluetoothGatt;

    if-eqz v1, :cond_connect

    # Already connected -> disconnect
    invoke-virtual {v1}, Landroid/bluetooth/BluetoothGatt;->disconnect()V

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothGatt;->close()V

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/example/fallsafe/MainActivity;->mBluetoothGatt:Landroid/bluetooth/BluetoothGatt;

    invoke-virtual {v0}, Lcom/example/fallsafe/MainActivity;->stopBleScan()V

    invoke-static {v0}, Lcom/example/fallsafe/MainActivity;->-$$Nest$fgetConnectButton(Lcom/example/fallsafe/MainActivity;)Landroid/widget/Button;

    move-result-object v1

    const-string v2, "Connect Device"

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setEnabled(Z)V

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/example/fallsafe/MainActivity;->updateConnectionStatus(Z)V

    return-void

    :cond_connect
    # Not connected -> start BLE scan/connect
    # Show "Scanning..." and disable the button while connecting
    invoke-static {v0}, Lcom/example/fallsafe/MainActivity;->-$$Nest$fgetConnectButton(Lcom/example/fallsafe/MainActivity;)Landroid/widget/Button;

    move-result-object v1

    const-string v2, "Scanning..."

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setEnabled(Z)V

    # Start BLE scan (openBT checks mmDevice first, then scans)
    :try_start_0
    invoke-virtual {v0}, Lcom/example/fallsafe/MainActivity;->findBT()V

    invoke-virtual {v0}, Lcom/example/fallsafe/MainActivity;->openBT()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    # Re-enable button on failure
    iget-object v0, p0, Lcom/example/fallsafe/MainActivity$3;->this$0:Lcom/example/fallsafe/MainActivity;

    invoke-static {v0}, Lcom/example/fallsafe/MainActivity;->-$$Nest$fgetConnectButton(Lcom/example/fallsafe/MainActivity;)Landroid/widget/Button;

    move-result-object v1

    const-string v2, "Connect Device"

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setEnabled(Z)V

    return-void
.end method
