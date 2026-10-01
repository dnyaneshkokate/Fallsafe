.class Lcom/example/fallsafe/MainActivity$1;
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
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 95
    iput-object p1, p0, Lcom/example/fallsafe/MainActivity$1;->this$0:Lcom/example/fallsafe/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5
    .param p1, "view"    # Landroid/view/View;

    .line 98
    new-instance v0, Landroid/app/Dialog;

    iget-object v1, p0, Lcom/example/fallsafe/MainActivity$1;->this$0:Lcom/example/fallsafe/MainActivity;

    invoke-direct {v0, v1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    .line 100
    .local v0, "dialog":Landroid/app/Dialog;
    sget v1, Lcom/example/fallsafe/R$layout;->dilog_setting:I

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setContentView(I)V

    .line 101
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    const/4 v2, -0x1

    const/4 v3, -0x2

    invoke-virtual {v1, v2, v3}, Landroid/view/Window;->setLayout(II)V

    .line 102
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 104
    sget v1, Lcom/example/fallsafe/R$id;->sosContactNumber:I

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    .line 106
    .local v1, "editText":Landroid/widget/EditText;
    iget-object v2, p0, Lcom/example/fallsafe/MainActivity$1;->this$0:Lcom/example/fallsafe/MainActivity;

    const-string v3, "UserPreferences"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Lcom/example/fallsafe/MainActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 107
    .local v2, "sharedPreferences":Landroid/content/SharedPreferences;
    const-string v3, "user_sos_number"

    const-string v4, ""

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 110
    sget v3, Lcom/example/fallsafe/R$id;->save_btn:I

    invoke-virtual {v0, v3}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    .line 112
    .local v3, "save":Landroid/widget/Button;
    new-instance v4, Lcom/example/fallsafe/MainActivity$1$1;

    invoke-direct {v4, p0, v1, v0}, Lcom/example/fallsafe/MainActivity$1$1;-><init>(Lcom/example/fallsafe/MainActivity$1;Landroid/widget/EditText;Landroid/app/Dialog;)V

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 124
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 125
    return-void
.end method
