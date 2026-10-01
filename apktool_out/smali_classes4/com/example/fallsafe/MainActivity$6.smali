.class Lcom/example/fallsafe/MainActivity$6;
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


# direct methods
.method constructor <init>(Lcom/example/fallsafe/MainActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/example/fallsafe/MainActivity$6;->this$0:Lcom/example/fallsafe/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/example/fallsafe/MainActivity$6;->this$0:Lcom/example/fallsafe/MainActivity;

    # 1. Send SMS to emergency contact
    invoke-virtual {v0}, Lcom/example/fallsafe/MainActivity;->sendSMS()V

    # 2. Send Telemetry to PC Manager Portal (isFall = true, bpm = "104")
    const/4 v1, 0x1

    const-string v2, "104"

    invoke-virtual {v0, v1, v2}, Lcom/example/fallsafe/MainActivity;->sendTelemetryToPortal(ZLjava/lang/String;)V

    return-void
.end method
