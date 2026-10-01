.class public Lcom/example/fallsafe/MainActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "MainActivity.java"


# static fields
.field private static final LOCATION_PERMISSION_REQUEST:I = 0x3e9
.field private static cachedDiscoveredIp:Ljava/lang/String;


# instance fields
.field private ConnectButton:Landroid/widget/Button;

.field private appBarConfiguration:Landroidx/navigation/ui/AppBarConfiguration;

.field private binding:Lcom/example/fallsafe/databinding/ActivityMainBinding;

.field counter:I

.field private hr:I

.field private hrbutton:Landroid/widget/Button;

.field private lastLat:D

.field private lastLong:D

.field private locationClient:Lcom/google/android/gms/location/FusedLocationProviderClient;

.field private locationText:Landroid/widget/TextView;

.field mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

.field public mBluetoothGatt:Landroid/bluetooth/BluetoothGatt;

.field public mBluetoothLeScanner:Landroid/bluetooth/le/BluetoothLeScanner;

.field public mBleScanCallback:Landroid/bluetooth/le/ScanCallback;

.field public isScanning:Z

.field mmDevice:Landroid/bluetooth/BluetoothDevice;

.field mmInputStream:Ljava/io/InputStream;

.field mmOutputStream:Ljava/io/OutputStream;

.field mmSocket:Landroid/bluetooth/BluetoothSocket;

.field readBuffer:[B

.field readBufferPosition:I

.field private savedSoSNumber:Ljava/lang/String;

.field private sosNumberDisplay:Landroid/widget/TextView;

.field private statusDot:Landroid/view/View;

.field private statusSubtitle:Landroid/widget/TextView;

.field private statusTag:Landroid/widget/TextView;

.field private statusTitle:Landroid/widget/TextView;

.field volatile stopWorker:Z

.field workerThread:Ljava/lang/Thread;


# direct methods
.method static bridge synthetic -$$Nest$fgetConnectButton(Lcom/example/fallsafe/MainActivity;)Landroid/widget/Button;
    .locals 0

    iget-object p0, p0, Lcom/example/fallsafe/MainActivity;->ConnectButton:Landroid/widget/Button;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgethrbutton(Lcom/example/fallsafe/MainActivity;)Landroid/widget/Button;
    .locals 0

    iget-object p0, p0, Lcom/example/fallsafe/MainActivity;->hrbutton:Landroid/widget/Button;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetlocationText(Lcom/example/fallsafe/MainActivity;)Landroid/widget/TextView;
    .locals 0

    iget-object p0, p0, Lcom/example/fallsafe/MainActivity;->locationText:Landroid/widget/TextView;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fputlastLat(Lcom/example/fallsafe/MainActivity;D)V
    .locals 0

    iput-wide p1, p0, Lcom/example/fallsafe/MainActivity;->lastLat:D

    return-void
.end method

.method static bridge synthetic -$$Nest$fputlastLong(Lcom/example/fallsafe/MainActivity;D)V
    .locals 0

    iput-wide p1, p0, Lcom/example/fallsafe/MainActivity;->lastLong:D

    return-void
.end method

.method static bridge synthetic -$$Nest$mgetCurrentLocation(Lcom/example/fallsafe/MainActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/example/fallsafe/MainActivity;->getCurrentLocation()V

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 53
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    .line 66
    const/4 v0, 0x0

    iput v0, p0, Lcom/example/fallsafe/MainActivity;->hr:I

    .line 72
    const-wide v0, -0x3f80c00000000000L    # -500.0

    iput-wide v0, p0, Lcom/example/fallsafe/MainActivity;->lastLat:D

    .line 73
    iput-wide v0, p0, Lcom/example/fallsafe/MainActivity;->lastLong:D

    return-void
.end method

.method private checkAndRequestAppPermissions()V
    .locals 3

    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "android.permission.SEND_SMS"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "android.permission.BLUETOOTH_CONNECT"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "android.permission.BLUETOOTH_SCAN"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "android.permission.ACCESS_FINE_LOCATION"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "android.permission.ACCESS_COARSE_LOCATION"

    aput-object v2, v0, v1

    const/16 v1, 0x3e9

    invoke-static {p0, v0, v1}, Landroidx/core/app/ActivityCompat;->requestPermissions(Landroid/app/Activity;[Ljava/lang/String;I)V

    return-void
.end method

.method private getCurrentLocation()V
    .locals 3

    .line 345
    const-string v0, "android.permission.ACCESS_FINE_LOCATION"

    invoke-static {p0, v0}, Landroidx/core/app/ActivityCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    if-eqz v1, :cond_0

    .line 347
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    const/16 v0, 0x3e9

    invoke-static {p0, v1, v0}, Landroidx/core/app/ActivityCompat;->requestPermissions(Landroid/app/Activity;[Ljava/lang/String;I)V

    .line 351
    :cond_0
    iget-object v0, p0, Lcom/example/fallsafe/MainActivity;->locationClient:Lcom/google/android/gms/location/FusedLocationProviderClient;

    invoke-interface {v0}, Lcom/google/android/gms/location/FusedLocationProviderClient;->getLastLocation()Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    new-instance v1, Lcom/example/fallsafe/MainActivity$5;

    invoke-direct {v1, p0}, Lcom/example/fallsafe/MainActivity$5;-><init>(Lcom/example/fallsafe/MainActivity;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/tasks/Task;->addOnSuccessListener(Lcom/google/android/gms/tasks/OnSuccessListener;)Lcom/google/android/gms/tasks/Task;

    .line 371
    return-void
.end method


# virtual methods
.method beginListenForData()V
    .locals 4

    iget-object v0, p0, Lcom/example/fallsafe/MainActivity;->mmInputStream:Ljava/io/InputStream;

    if-nez v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/example/fallsafe/MainActivity;->stopWorker:Z

    iput v1, p0, Lcom/example/fallsafe/MainActivity;->readBufferPosition:I

    const/16 v1, 0x400

    new-array v1, v1, [B

    iput-object v1, p0, Lcom/example/fallsafe/MainActivity;->readBuffer:[B

    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lcom/example/fallsafe/MainActivity$4;

    invoke-direct {v2, p0, v0}, Lcom/example/fallsafe/MainActivity$4;-><init>(Lcom/example/fallsafe/MainActivity;Landroid/os/Handler;)V

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v1, p0, Lcom/example/fallsafe/MainActivity;->workerThread:Ljava/lang/Thread;

    iget-object v1, p0, Lcom/example/fallsafe/MainActivity;->workerThread:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method findBT()V
    .locals 6

    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    iput-object v0, p0, Lcom/example/fallsafe/MainActivity;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    iget-object v0, p0, Lcom/example/fallsafe/MainActivity;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    if-nez v0, :cond_0

    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "No bluetooth adapter available"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    return-void

    :cond_0
    const-string v0, "android.permission.BLUETOOTH_CONNECT"

    invoke-static {p0, v0}, Landroidx/core/app/ActivityCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    const/4 v0, 0x1

    const-string v2, "android.permission.BLUETOOTH_SCAN"

    aput-object v2, v1, v0

    const/16 v0, 0x3ea

    invoke-static {p0, v1, v0}, Landroidx/core/app/ActivityCompat;->requestPermissions(Landroid/app/Activity;[Ljava/lang/String;I)V

    return-void

    :cond_1
    iget-object v0, p0, Lcom/example/fallsafe/MainActivity;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->isEnabled()Z

    move-result v0

    if-nez v0, :cond_2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.bluetooth.adapter.action.REQUEST_ENABLE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/example/fallsafe/MainActivity;->startActivityForResult(Landroid/content/Intent;I)V

    :cond_2
    iget-object v0, p0, Lcom/example/fallsafe/MainActivity;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->getBondedDevices()Ljava/util/Set;

    move-result-object v0

    if-eqz v0, :cond_4

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v1

    if-lez v1, :cond_4

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_3

    const-string v4, "FallSafe"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    iput-object v2, p0, Lcom/example/fallsafe/MainActivity;->mmDevice:Landroid/bluetooth/BluetoothDevice;

    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "Device Set"

    invoke-virtual {v1, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_1

    :cond_3
    goto :goto_0

    :cond_4
    :goto_1
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "Bluetooth Device Found"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 77
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 78
    invoke-virtual {p0}, Lcom/example/fallsafe/MainActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    invoke-static {v0}, Lcom/example/fallsafe/databinding/ActivityMainBinding;->inflate(Landroid/view/LayoutInflater;)Lcom/example/fallsafe/databinding/ActivityMainBinding;

    move-result-object v0

    iput-object v0, p0, Lcom/example/fallsafe/MainActivity;->binding:Lcom/example/fallsafe/databinding/ActivityMainBinding;

    .line 79
    iget-object v0, p0, Lcom/example/fallsafe/MainActivity;->binding:Lcom/example/fallsafe/databinding/ActivityMainBinding;

    invoke-virtual {v0}, Lcom/example/fallsafe/databinding/ActivityMainBinding;->getRoot()Landroid/widget/LinearLayout;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/example/fallsafe/MainActivity;->setContentView(Landroid/view/View;)V

    .line 81
    const-string v0, "UserPreferences"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/example/fallsafe/MainActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 82
    .local v0, "sharedPreferences":Landroid/content/SharedPreferences;
    const-string v1, "user_sos_number"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/example/fallsafe/MainActivity;->savedSoSNumber:Ljava/lang/String;

    .line 84
    const-string v1, "Saved Sos number"

    iget-object v2, p0, Lcom/example/fallsafe/MainActivity;->savedSoSNumber:Ljava/lang/String;

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    sget v1, Lcom/example/fallsafe/R$id;->available_devices_button:I

    invoke-virtual {p0, v1}, Lcom/example/fallsafe/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Lcom/example/fallsafe/MainActivity;->ConnectButton:Landroid/widget/Button;

    .line 87
    sget v1, Lcom/example/fallsafe/R$id;->heart_rate_button:I

    invoke-virtual {p0, v1}, Lcom/example/fallsafe/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Lcom/example/fallsafe/MainActivity;->hrbutton:Landroid/widget/Button;

    .line 88
    sget v1, Lcom/example/fallsafe/R$id;->location:I

    invoke-virtual {p0, v1}, Lcom/example/fallsafe/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/example/fallsafe/MainActivity;->locationText:Landroid/widget/TextView;

    sget v1, Lcom/example/fallsafe/R$id;->sos_number_display:I

    invoke-virtual {p0, v1}, Lcom/example/fallsafe/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/example/fallsafe/MainActivity;->sosNumberDisplay:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/example/fallsafe/MainActivity;->updateSosNumberDisplay()V

    sget v1, Lcom/example/fallsafe/R$id;->status_dot:I

    invoke-virtual {p0, v1}, Lcom/example/fallsafe/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/example/fallsafe/MainActivity;->statusDot:Landroid/view/View;

    sget v1, Lcom/example/fallsafe/R$id;->status_title:I

    invoke-virtual {p0, v1}, Lcom/example/fallsafe/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/example/fallsafe/MainActivity;->statusTitle:Landroid/widget/TextView;

    sget v1, Lcom/example/fallsafe/R$id;->status_subtitle:I

    invoke-virtual {p0, v1}, Lcom/example/fallsafe/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/example/fallsafe/MainActivity;->statusSubtitle:Landroid/widget/TextView;

    sget v1, Lcom/example/fallsafe/R$id;->status_tag:I

    invoke-virtual {p0, v1}, Lcom/example/fallsafe/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/example/fallsafe/MainActivity;->statusTag:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/example/fallsafe/MainActivity;->updateConnectionStatus(Z)V

    invoke-direct {p0}, Lcom/example/fallsafe/MainActivity;->checkAndRequestAppPermissions()V

    .line 90
    invoke-static {p0}, Lcom/google/android/gms/location/LocationServices;->getFusedLocationProviderClient(Landroid/app/Activity;)Lcom/google/android/gms/location/FusedLocationProviderClient;

    move-result-object v1

    iput-object v1, p0, Lcom/example/fallsafe/MainActivity;->locationClient:Lcom/google/android/gms/location/FusedLocationProviderClient;

    .line 91
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "Started"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 93
    sget v1, Lcom/example/fallsafe/R$id;->settingButton:I

    invoke-virtual {p0, v1}, Lcom/example/fallsafe/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageButton;

    .line 95
    .local v1, "settingButton":Landroid/widget/ImageButton;
    new-instance v2, Lcom/example/fallsafe/MainActivity$1;

    invoke-direct {v2, p0}, Lcom/example/fallsafe/MainActivity$1;-><init>(Lcom/example/fallsafe/MainActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 128
    new-instance v2, Ljava/lang/Thread;

    new-instance v3, Lcom/example/fallsafe/MainActivity$2;

    invoke-direct {v3, p0}, Lcom/example/fallsafe/MainActivity$2;-><init>(Lcom/example/fallsafe/MainActivity;)V

    invoke-direct {v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 144
    .local v2, "currentPosUpdateThread":Ljava/lang/Thread;
    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 145
    iget-object v3, p0, Lcom/example/fallsafe/MainActivity;->ConnectButton:Landroid/widget/Button;

    new-instance v4, Lcom/example/fallsafe/MainActivity$3;

    invoke-direct {v4, p0}, Lcom/example/fallsafe/MainActivity$3;-><init>(Lcom/example/fallsafe/MainActivity;)V

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 162
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;

    .line 191
    invoke-virtual {p0}, Lcom/example/fallsafe/MainActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    sget v1, Lcom/example/fallsafe/R$menu;->navigation_menu:I

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 192
    const/4 v0, 0x1

    return v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .param p1, "item"    # Landroid/view/MenuItem;

    .line 197
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    sget v1, Lcom/example/fallsafe/R$id;->nav_settings:I

    if-ne v0, v1, :cond_0

    .line 198
    const-string v0, "Setting"

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 199
    return v1

    .line 201
    :cond_0
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    return v0
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 2
    .param p1, "requestCode"    # I
    .param p2, "permissions"    # [Ljava/lang/String;
    .param p3, "grantResults"    # [I

    .line 374
    invoke-super {p0, p1, p2, p3}, Landroidx/appcompat/app/AppCompatActivity;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    .line 376
    const/16 v0, 0x3e9

    if-ne p1, v0, :cond_0

    array-length v0, p3

    if-lez v0, :cond_0

    const/4 v0, 0x0

    aget v0, p3, v0

    if-nez v0, :cond_0

    .line 378
    invoke-direct {p0}, Lcom/example/fallsafe/MainActivity;->getCurrentLocation()V

    goto :goto_0

    .line 381
    :cond_0
    iget-object v0, p0, Lcom/example/fallsafe/MainActivity;->locationText:Landroid/widget/TextView;

    const-string v1, "Location permission denied"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 383
    :goto_0
    return-void
.end method

.method public onSupportNavigateUp()Z
    .locals 2

    .line 206
    sget v0, Lcom/example/fallsafe/R$id;->nav_host_fragment_content_main:I

    invoke-static {p0, v0}, Landroidx/navigation/Navigation;->findNavController(Landroid/app/Activity;I)Landroidx/navigation/NavController;

    move-result-object v0

    .line 207
    .local v0, "navController":Landroidx/navigation/NavController;
    iget-object v1, p0, Lcom/example/fallsafe/MainActivity;->appBarConfiguration:Landroidx/navigation/ui/AppBarConfiguration;

    invoke-static {v0, v1}, Landroidx/navigation/ui/NavigationUI;->navigateUp(Landroidx/navigation/NavController;Landroidx/navigation/ui/AppBarConfiguration;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 208
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onSupportNavigateUp()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v1, 0x1

    .line 207
    :goto_1
    return v1
.end method

.method openBT()V
    .locals 2

    iget-object v0, p0, Lcom/example/fallsafe/MainActivity;->mmDevice:Landroid/bluetooth/BluetoothDevice;

    if-eqz v0, :cond_0

    invoke-virtual {p0, v0}, Lcom/example/fallsafe/MainActivity;->connectGattToDevice(Landroid/bluetooth/BluetoothDevice;)V

    goto :goto_0

    :cond_0
    const-string v0, "FallSafe BLE"

    const-string v1, "FallSafe not paired. Starting BLE Scanner..."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Lcom/example/fallsafe/MainActivity;->startBleScan()V

    :goto_0
    return-void
.end method

.method sendData()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 327
    const-string v0, "Test"

    .line 328
    .local v0, "msg":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 329
    iget-object v1, p0, Lcom/example/fallsafe/MainActivity;->mmOutputStream:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/OutputStream;->write([B)V

    .line 330
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "Data Sent"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 331
    return-void
.end method

.method protected sendSMS()V
    .locals 9

    .line 164
    const-string v0, "Send SMS"

    const-string v1, ""

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 167
    const/4 v2, 0x0

    :try_start_0
    iget-object v0, p0, Lcom/example/fallsafe/MainActivity;->savedSoSNumber:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 168
    invoke-static {}, Landroid/telephony/SmsManager;->getDefault()Landroid/telephony/SmsManager;

    move-result-object v0

    move-object v3, v0

    .line 170
    .local v3, "manager":Landroid/telephony/SmsManager;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "I have fallen.\n Please Help!\nhttps://www.google.com/maps?q="

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v4, p0, Lcom/example/fallsafe/MainActivity;->lastLat:D

    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, ","

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v4, p0, Lcom/example/fallsafe/MainActivity;->lastLong:D

    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 171
    .local v6, "msg":Ljava/lang/String;
    const-string v0, "SMS msg"

    invoke-static {v0, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 174
    iget-object v4, p0, Lcom/example/fallsafe/MainActivity;->savedSoSNumber:Ljava/lang/String;

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v3 .. v8}, Landroid/telephony/SmsManager;->sendTextMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/app/PendingIntent;)V

    .line 175
    const-string v0, "SOS text has been sent."

    invoke-static {p0, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 176
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 177
    const-string v0, "Finished sending SMS..."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 178
    nop

    .end local v3    # "manager":Landroid/telephony/SmsManager;
    .end local v6    # "msg":Ljava/lang/String;
    goto :goto_0

    .line 179
    :cond_0
    const-string v0, "No Number found..."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 180
    const-string v0, "No Sos Number was found"

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 186
    :goto_0
    goto :goto_1

    .line 182
    :catch_0
    move-exception v0

    .line 183
    .local v0, "ex":Landroid/content/ActivityNotFoundException;
    invoke-virtual {v0}, Landroid/content/ActivityNotFoundException;->printStackTrace()V

    .line 184
    const-string v1, "SMS failed, please try again later."

    invoke-static {p0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    .line 185
    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 187
    .end local v0    # "ex":Landroid/content/ActivityNotFoundException;
    :goto_1
    return-void
.end method

.method public updateConnectionStatus(Z)V
    .locals 2

    iget-object v0, p0, Lcom/example/fallsafe/MainActivity;->statusDot:Landroid/view/View;

    if-nez v0, :cond_0

    return-void

    :cond_0
    if-eqz p1, :cond_3

    sget v1, Lcom/example/fallsafe/R$drawable;->status_dot_green:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    iget-object v0, p0, Lcom/example/fallsafe/MainActivity;->statusTitle:Landroid/widget/TextView;

    if-eqz v0, :cond_1

    const-string v1, "PROTECTION ACTIVE"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/example/fallsafe/MainActivity;->statusTitle:Landroid/widget/TextView;

    const v1, -0x1a1815

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    :cond_1
    iget-object v0, p0, Lcom/example/fallsafe/MainActivity;->statusSubtitle:Landroid/widget/TextView;

    if-eqz v0, :cond_2

    const-string v1, "Sensor monitoring and emergency dispatch enabled"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_2
    iget-object v0, p0, Lcom/example/fallsafe/MainActivity;->statusTag:Landroid/widget/TextView;

    if-eqz v0, :cond_6

    const-string v1, "ONLINE"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/example/fallsafe/MainActivity;->statusTag:Landroid/widget/TextView;

    const v1, -0xdd3aa2

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_0

    :cond_3
    sget v1, Lcom/example/fallsafe/R$drawable;->status_dot_red:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    iget-object v0, p0, Lcom/example/fallsafe/MainActivity;->statusTitle:Landroid/widget/TextView;

    if-eqz v0, :cond_4

    const-string v1, "PROTECTION INACTIVE"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/example/fallsafe/MainActivity;->statusTitle:Landroid/widget/TextView;

    const v1, -0x10bbbc

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    :cond_4
    iget-object v0, p0, Lcom/example/fallsafe/MainActivity;->statusSubtitle:Landroid/widget/TextView;

    if-eqz v0, :cond_5

    const-string v1, "Device disconnected \u2014 tap Connect device below"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_5
    iget-object v0, p0, Lcom/example/fallsafe/MainActivity;->statusTag:Landroid/widget/TextView;

    if-eqz v0, :cond_6

    const-string v1, "OFFLINE"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/example/fallsafe/MainActivity;->statusTag:Landroid/widget/TextView;

    const v1, -0x10bbbc

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    :cond_6
    :goto_0
    return-void
.end method

.method public updateSosNumberDisplay()V
    .locals 3

    iget-object v0, p0, Lcom/example/fallsafe/MainActivity;->sosNumberDisplay:Landroid/widget/TextView;

    if-nez v0, :cond_0

    return-void

    :cond_0
    const-string v0, "UserPreferences"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/example/fallsafe/MainActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "user_sos_number"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/example/fallsafe/MainActivity;->savedSoSNumber:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/example/fallsafe/MainActivity;->sosNumberDisplay:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/example/fallsafe/MainActivity;->sosNumberDisplay:Landroid/widget/TextView;

    const-string v1, "Not configured \u2014 tap \u2699 to set"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_0
    return-void
.end method


.method public connectGattToDevice(Landroid/bluetooth/BluetoothDevice;)V
    .locals 3

    if-nez p1, :cond_0

    return-void

    :cond_0
    const-string v0, "android.permission.BLUETOOTH_CONNECT"

    invoke-static {p0, v0}, Landroidx/core/app/ActivityCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_1

    return-void

    :cond_1
    const-string v0, "FallSafe BLE"

    const-string v1, "Connecting to FallSafe via GATT..."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Lcom/example/fallsafe/MainActivity$BleCallback;

    invoke-direct {v0, p0}, Lcom/example/fallsafe/MainActivity$BleCallback;-><init>(Lcom/example/fallsafe/MainActivity;)V

    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-virtual {p1, p0, v1, v0, v2}, Landroid/bluetooth/BluetoothDevice;->connectGatt(Landroid/content/Context;ZLandroid/bluetooth/BluetoothGattCallback;I)Landroid/bluetooth/BluetoothGatt;

    move-result-object v0

    iput-object v0, p0, Lcom/example/fallsafe/MainActivity;->mBluetoothGatt:Landroid/bluetooth/BluetoothGatt;

    return-void
.end method

.method public startBleScan()V
    .locals 3

    iget-object v0, p0, Lcom/example/fallsafe/MainActivity;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->getBluetoothLeScanner()Landroid/bluetooth/le/BluetoothLeScanner;

    move-result-object v0

    iput-object v0, p0, Lcom/example/fallsafe/MainActivity;->mBluetoothLeScanner:Landroid/bluetooth/le/BluetoothLeScanner;

    iget-object v0, p0, Lcom/example/fallsafe/MainActivity;->mBluetoothLeScanner:Landroid/bluetooth/le/BluetoothLeScanner;

    if-eqz v0, :cond_2

    iget-boolean v1, p0, Lcom/example/fallsafe/MainActivity;->isScanning:Z

    if-nez v1, :cond_2

    const-string v1, "android.permission.BLUETOOTH_SCAN"

    invoke-static {p0, v1}, Landroidx/core/app/ActivityCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    if-eqz v1, :cond_1

    return-void

    :cond_1
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/example/fallsafe/MainActivity;->isScanning:Z

    new-instance v1, Lcom/example/fallsafe/MainActivity$BleScanCallback;

    invoke-direct {v1, p0}, Lcom/example/fallsafe/MainActivity$BleScanCallback;-><init>(Lcom/example/fallsafe/MainActivity;)V

    iput-object v1, p0, Lcom/example/fallsafe/MainActivity;->mBleScanCallback:Landroid/bluetooth/le/ScanCallback;

    iget-object v1, p0, Lcom/example/fallsafe/MainActivity;->mBleScanCallback:Landroid/bluetooth/le/ScanCallback;

    invoke-virtual {v0, v1}, Landroid/bluetooth/le/BluetoothLeScanner;->startScan(Landroid/bluetooth/le/ScanCallback;)V

    const-string v0, "FallSafe BLE"

    const-string v1, "Started BLE Scan..."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    return-void
.end method

.method public stopBleScan()V
    .locals 2

    iget-boolean v0, p0, Lcom/example/fallsafe/MainActivity;->isScanning:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/example/fallsafe/MainActivity;->mBluetoothLeScanner:Landroid/bluetooth/le/BluetoothLeScanner;

    if-eqz v0, :cond_0

    const-string v1, "android.permission.BLUETOOTH_SCAN"

    invoke-static {p0, v1}, Landroidx/core/app/ActivityCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/example/fallsafe/MainActivity;->mBleScanCallback:Landroid/bluetooth/le/ScanCallback;

    if-eqz v1, :cond_0

    invoke-virtual {v0, v1}, Landroid/bluetooth/le/BluetoothLeScanner;->stopScan(Landroid/bluetooth/le/ScanCallback;)V

    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/example/fallsafe/MainActivity;->isScanning:Z

    :cond_1
    return-void
.end method

.method public processBleData(Ljava/lang/String;)V
    .locals 3

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    const-string v0, "Fall Detected!"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "FallSafe BLE"

    const-string v1, "Fall Detected signal received over BLE -> Dispatching SMS"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Lcom/example/fallsafe/MainActivity$6;

    invoke-direct {v0, p0}, Lcom/example/fallsafe/MainActivity$6;-><init>(Lcom/example/fallsafe/MainActivity;)V

    invoke-virtual {p0, v0}, Lcom/example/fallsafe/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void

    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    return-void

    :cond_2
    new-instance v0, Lcom/example/fallsafe/MainActivity$7;

    invoke-direct {v0, p0, p1}, Lcom/example/fallsafe/MainActivity$7;-><init>(Lcom/example/fallsafe/MainActivity;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/example/fallsafe/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method






.method public getPortalServerUrl()Ljava/lang/String;
    .locals 4

    const-string v0, "UserPreferences"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/example/fallsafe/MainActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "portal_ip"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_check_cached

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_check_cached

    const-string v1, "http://"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_has_http

    return-object v0

    :cond_has_http
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":8080/api/telemetry"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    :cond_check_cached
    sget-object v0, Lcom/example/fallsafe/MainActivity;->cachedDiscoveredIp:Ljava/lang/String;

    if-eqz v0, :cond_fallback

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_fallback

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "http://"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":8080/api/telemetry"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    :cond_fallback
    # Trigger background UDP discovery
    invoke-virtual {p0}, Lcom/example/fallsafe/MainActivity;->discoverPortalIpAsync()V

    const-string v0, "http://10.21.162.218:8080/api/telemetry"

    return-object v0
.end method

.method public discoverPortalIpAsync()V
    .locals 2

    new-instance v0, Lcom/example/fallsafe/MainActivity$DiscoveryTask;

    invoke-direct {v0, p0}, Lcom/example/fallsafe/MainActivity$DiscoveryTask;-><init>(Lcom/example/fallsafe/MainActivity;)V

    new-instance v1, Ljava/lang/Thread;

    invoke-direct {v1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method public sendTelemetryToPortal(ZLjava/lang/String;)V
    .locals 10

    :try_start_0
    invoke-virtual {p0}, Lcom/example/fallsafe/MainActivity;->getPortalServerUrl()Ljava/lang/String;

    move-result-object v1

    iget-wide v4, p0, Lcom/example/fallsafe/MainActivity;->lastLat:D

    iget-wide v6, p0, Lcom/example/fallsafe/MainActivity;->lastLong:D

    new-instance v9, Lcom/example/fallsafe/MainActivity$TelemetryTask;

    move-object v0, v9

    move v2, p1

    move-object v3, p2

    invoke-direct/range {v0 .. v7}, Lcom/example/fallsafe/MainActivity$TelemetryTask;-><init>(Ljava/lang/String;ZLjava/lang/String;DD)V

    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, v9}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_end

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_end
    return-void
.end method

.method public static setDiscoveredIp(Ljava/lang/String;)V
    .locals 0

    sput-object p0, Lcom/example/fallsafe/MainActivity;->cachedDiscoveredIp:Ljava/lang/String;

    return-void
.end method
