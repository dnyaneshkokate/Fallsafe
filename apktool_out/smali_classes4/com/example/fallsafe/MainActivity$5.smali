.class Lcom/example/fallsafe/MainActivity$5;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Lcom/google/android/gms/tasks/OnSuccessListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/example/fallsafe/MainActivity;->getCurrentLocation()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/tasks/OnSuccessListener<",
        "Landroid/location/Location;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/example/fallsafe/MainActivity;


# direct methods
.method constructor <init>(Lcom/example/fallsafe/MainActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/example/fallsafe/MainActivity;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 351
    iput-object p1, p0, Lcom/example/fallsafe/MainActivity$5;->this$0:Lcom/example/fallsafe/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSuccess(Landroid/location/Location;)V
    .locals 7
    .param p1, "location"    # Landroid/location/Location;

    .line 355
    if-eqz p1, :cond_0

    .line 357
    invoke-virtual {p1}, Landroid/location/Location;->getLatitude()D

    move-result-wide v0

    .line 358
    .local v0, "lat":D
    invoke-virtual {p1}, Landroid/location/Location;->getLongitude()D

    move-result-wide v2

    .line 361
    .local v2, "lon":D
    iget-object v4, p0, Lcom/example/fallsafe/MainActivity$5;->this$0:Lcom/example/fallsafe/MainActivity;

    invoke-static {v4}, Lcom/example/fallsafe/MainActivity;->-$$Nest$fgetlocationText(Lcom/example/fallsafe/MainActivity;)Landroid/widget/TextView;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Latitude: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0, v1}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " \n Longitude: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 362
    iget-object v4, p0, Lcom/example/fallsafe/MainActivity$5;->this$0:Lcom/example/fallsafe/MainActivity;

    invoke-static {v4, v0, v1}, Lcom/example/fallsafe/MainActivity;->-$$Nest$fputlastLat(Lcom/example/fallsafe/MainActivity;D)V

    .line 363
    iget-object v4, p0, Lcom/example/fallsafe/MainActivity$5;->this$0:Lcom/example/fallsafe/MainActivity;

    invoke-static {v4, v2, v3}, Lcom/example/fallsafe/MainActivity;->-$$Nest$fputlastLong(Lcom/example/fallsafe/MainActivity;D)V

    .line 364
    .end local v0    # "lat":D
    .end local v2    # "lon":D
    goto :goto_0

    .line 366
    :cond_0
    iget-object v0, p0, Lcom/example/fallsafe/MainActivity$5;->this$0:Lcom/example/fallsafe/MainActivity;

    invoke-static {v0}, Lcom/example/fallsafe/MainActivity;->-$$Nest$fgetlocationText(Lcom/example/fallsafe/MainActivity;)Landroid/widget/TextView;

    move-result-object v0

    const-string v1, "Unable to get location"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 367
    iget-object v0, p0, Lcom/example/fallsafe/MainActivity$5;->this$0:Lcom/example/fallsafe/MainActivity;

    iget-object v1, p0, Lcom/example/fallsafe/MainActivity$5;->this$0:Lcom/example/fallsafe/MainActivity;

    const-wide v2, -0x3f80c00000000000L    # -500.0

    invoke-static {v1, v2, v3}, Lcom/example/fallsafe/MainActivity;->-$$Nest$fputlastLat(Lcom/example/fallsafe/MainActivity;D)V

    invoke-static {v0, v2, v3}, Lcom/example/fallsafe/MainActivity;->-$$Nest$fputlastLong(Lcom/example/fallsafe/MainActivity;D)V

    .line 369
    :goto_0
    return-void
.end method

.method public bridge synthetic onSuccess(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            null
        }
    .end annotation

    .line 351
    check-cast p1, Landroid/location/Location;

    invoke-virtual {p0, p1}, Lcom/example/fallsafe/MainActivity$5;->onSuccess(Landroid/location/Location;)V

    return-void
.end method
