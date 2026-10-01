.class public Lcom/example/fallsafe/MainActivity$BleScanCallback;
.super Landroid/bluetooth/le/ScanCallback;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/fallsafe/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "BleScanCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/example/fallsafe/MainActivity;


# direct methods
.method public constructor <init>(Lcom/example/fallsafe/MainActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/example/fallsafe/MainActivity$BleScanCallback;->this$0:Lcom/example/fallsafe/MainActivity;

    invoke-direct {p0}, Landroid/bluetooth/le/ScanCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onScanResult(ILandroid/bluetooth/le/ScanResult;)V
    .locals 4

    if-eqz p2, :cond_end

    invoke-virtual {p2}, Landroid/bluetooth/le/ScanResult;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v0

    if-eqz v0, :cond_end

    # Check BLUETOOTH_CONNECT permission before calling getName()
    iget-object v1, p0, Lcom/example/fallsafe/MainActivity$BleScanCallback;->this$0:Lcom/example/fallsafe/MainActivity;

    const-string v2, "android.permission.BLUETOOTH_CONNECT"

    invoke-static {v1, v2}, Landroidx/core/app/ActivityCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    const/4 v2, 0x0

    if-ne v1, v2, :cond_end

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_end

    const-string v2, "FallSafe"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_end

    # Found FallSafe device — stop scan and connect
    iget-object v1, p0, Lcom/example/fallsafe/MainActivity$BleScanCallback;->this$0:Lcom/example/fallsafe/MainActivity;

    invoke-virtual {v1}, Lcom/example/fallsafe/MainActivity;->stopBleScan()V

    iget-object v1, p0, Lcom/example/fallsafe/MainActivity$BleScanCallback;->this$0:Lcom/example/fallsafe/MainActivity;

    invoke-virtual {v1, v0}, Lcom/example/fallsafe/MainActivity;->connectGattToDevice(Landroid/bluetooth/BluetoothDevice;)V

    :cond_end
    return-void
.end method
