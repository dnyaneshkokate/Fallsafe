.class Lcom/example/fallsafe/MainActivity$4;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/example/fallsafe/MainActivity;->beginListenForData()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/example/fallsafe/MainActivity;

.field final synthetic val$handler:Landroid/os/Handler;


# direct methods
.method constructor <init>(Lcom/example/fallsafe/MainActivity;Landroid/os/Handler;)V
    .locals 0
    .param p1, "this$0"    # Lcom/example/fallsafe/MainActivity;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 275
    iput-object p1, p0, Lcom/example/fallsafe/MainActivity$4;->this$0:Lcom/example/fallsafe/MainActivity;

    iput-object p2, p0, Lcom/example/fallsafe/MainActivity$4;->val$handler:Landroid/os/Handler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .line 277
    nop

    :goto_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/example/fallsafe/MainActivity$4;->this$0:Lcom/example/fallsafe/MainActivity;

    iget-boolean v0, v0, Lcom/example/fallsafe/MainActivity;->stopWorker:Z

    if-nez v0, :cond_2

    .line 279
    :try_start_0
    iget-object v0, p0, Lcom/example/fallsafe/MainActivity$4;->this$0:Lcom/example/fallsafe/MainActivity;

    iget-object v0, v0, Lcom/example/fallsafe/MainActivity;->mmInputStream:Ljava/io/InputStream;

    if-nez v0, :cond_has_stream

    return-void

    :cond_has_stream
    invoke-virtual {v0}, Ljava/io/InputStream;->available()I

    move-result v0

    .line 280
    .local v0, "bytesAvailable":I
    if-lez v0, :cond_1

    .line 281
    new-array v1, v0, [B

    .line 282
    .local v1, "packetBytes":[B
    iget-object v2, p0, Lcom/example/fallsafe/MainActivity$4;->this$0:Lcom/example/fallsafe/MainActivity;

    iget-object v2, v2, Lcom/example/fallsafe/MainActivity;->mmInputStream:Ljava/io/InputStream;

    invoke-virtual {v2, v1}, Ljava/io/InputStream;->read([B)I

    .line 283
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-ge v2, v0, :cond_1

    .line 284
    aget-byte v3, v1, v2

    .line 285
    .local v3, "b":B
    const/16 v4, 0xa

    if-ne v3, v4, :cond_0

    .line 286
    iget-object v4, p0, Lcom/example/fallsafe/MainActivity$4;->this$0:Lcom/example/fallsafe/MainActivity;

    iget v4, v4, Lcom/example/fallsafe/MainActivity;->readBufferPosition:I

    new-array v4, v4, [B

    .line 287
    .local v4, "encodedBytes":[B
    iget-object v5, p0, Lcom/example/fallsafe/MainActivity$4;->this$0:Lcom/example/fallsafe/MainActivity;

    iget-object v5, v5, Lcom/example/fallsafe/MainActivity;->readBuffer:[B

    array-length v6, v4

    const/4 v7, 0x0

    invoke-static {v5, v7, v4, v7, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 288
    new-instance v5, Ljava/lang/String;

    const-string v6, "ASCII"

    invoke-direct {v5, v4, v6}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 289
    .local v5, "data":Ljava/lang/String;
    iget-object v6, p0, Lcom/example/fallsafe/MainActivity$4;->this$0:Lcom/example/fallsafe/MainActivity;

    iput v7, v6, Lcom/example/fallsafe/MainActivity;->readBufferPosition:I

    .line 291
    iget-object v6, p0, Lcom/example/fallsafe/MainActivity$4;->val$handler:Landroid/os/Handler;

    new-instance v7, Lcom/example/fallsafe/MainActivity$4$1;

    invoke-direct {v7, p0, v5}, Lcom/example/fallsafe/MainActivity$4$1;-><init>(Lcom/example/fallsafe/MainActivity$4;Ljava/lang/String;)V

    invoke-virtual {v6, v7}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 308
    nop

    .end local v4    # "encodedBytes":[B
    .end local v5    # "data":Ljava/lang/String;
    goto :goto_2

    .line 309
    :cond_0
    iget-object v4, p0, Lcom/example/fallsafe/MainActivity$4;->this$0:Lcom/example/fallsafe/MainActivity;

    iget-object v4, v4, Lcom/example/fallsafe/MainActivity;->readBuffer:[B

    iget-object v5, p0, Lcom/example/fallsafe/MainActivity$4;->this$0:Lcom/example/fallsafe/MainActivity;

    iget v6, v5, Lcom/example/fallsafe/MainActivity;->readBufferPosition:I

    add-int/lit8 v7, v6, 0x1

    iput v7, v5, Lcom/example/fallsafe/MainActivity;->readBufferPosition:I

    aput-byte v3, v4, v6
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 283
    .end local v3    # "b":B
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 313
    .end local v0    # "bytesAvailable":I
    .end local v1    # "packetBytes":[B
    .end local v2    # "i":I
    :catch_0
    move-exception v0

    .line 314
    .local v0, "ex":Ljava/lang/Exception;
    iget-object v1, p0, Lcom/example/fallsafe/MainActivity$4;->this$0:Lcom/example/fallsafe/MainActivity;

    const/4 v2, 0x1

    iput-boolean v2, v1, Lcom/example/fallsafe/MainActivity;->stopWorker:Z

    .line 315
    iget-object v1, p0, Lcom/example/fallsafe/MainActivity$4;->this$0:Lcom/example/fallsafe/MainActivity;

    invoke-static {v1}, Lcom/example/fallsafe/MainActivity;->-$$Nest$fgetConnectButton(Lcom/example/fallsafe/MainActivity;)Landroid/widget/Button;

    move-result-object v1

    const-string v3, "Connect Device"

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 316
    iget-object v1, p0, Lcom/example/fallsafe/MainActivity$4;->this$0:Lcom/example/fallsafe/MainActivity;

    invoke-static {v1}, Lcom/example/fallsafe/MainActivity;->-$$Nest$fgetConnectButton(Lcom/example/fallsafe/MainActivity;)Landroid/widget/Button;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setEnabled(Z)V

    .line 317
    iget-object v1, p0, Lcom/example/fallsafe/MainActivity$4;->this$0:Lcom/example/fallsafe/MainActivity;

    const-string v3, "Connection Lost"

    invoke-static {v1, v3, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    iget-object v1, p0, Lcom/example/fallsafe/MainActivity$4;->this$0:Lcom/example/fallsafe/MainActivity;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/example/fallsafe/MainActivity;->updateConnectionStatus(Z)V

    .line 318
    .end local v0    # "ex":Ljava/io/IOException;
    :cond_1
    goto/16 :goto_0

    .line 320
    :cond_2
    return-void
.end method
