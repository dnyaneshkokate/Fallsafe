.class Lcom/example/fallsafe/MainActivity$1$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/example/fallsafe/MainActivity$1;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/example/fallsafe/MainActivity$1;

.field final synthetic val$dialog:Landroid/app/Dialog;

.field final synthetic val$editText:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/example/fallsafe/MainActivity$1;Landroid/widget/EditText;Landroid/app/Dialog;)V
    .locals 0
    .param p1, "this$1"    # Lcom/example/fallsafe/MainActivity$1;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 112
    iput-object p1, p0, Lcom/example/fallsafe/MainActivity$1$1;->this$1:Lcom/example/fallsafe/MainActivity$1;

    iput-object p2, p0, Lcom/example/fallsafe/MainActivity$1$1;->val$editText:Landroid/widget/EditText;

    iput-object p3, p0, Lcom/example/fallsafe/MainActivity$1$1;->val$dialog:Landroid/app/Dialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5
    .param p1, "view"    # Landroid/view/View;

    .line 115
    iget-object v0, p0, Lcom/example/fallsafe/MainActivity$1$1;->this$1:Lcom/example/fallsafe/MainActivity$1;

    iget-object v0, v0, Lcom/example/fallsafe/MainActivity$1;->this$0:Lcom/example/fallsafe/MainActivity;

    const-string v1, "UserPreferences"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/example/fallsafe/MainActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 116
    .local v0, "sharedPreferences":Landroid/content/SharedPreferences;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 118
    .local v1, "editor":Landroid/content/SharedPreferences$Editor;
    iget-object v2, p0, Lcom/example/fallsafe/MainActivity$1$1;->val$editText:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "user_sos_number"

    invoke-interface {v1, v3, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 119
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    iget-object v2, p0, Lcom/example/fallsafe/MainActivity$1$1;->this$1:Lcom/example/fallsafe/MainActivity$1;

    iget-object v2, v2, Lcom/example/fallsafe/MainActivity$1;->this$0:Lcom/example/fallsafe/MainActivity;

    invoke-virtual {v2}, Lcom/example/fallsafe/MainActivity;->updateSosNumberDisplay()V

    .line 120
    iget-object v2, p0, Lcom/example/fallsafe/MainActivity$1$1;->this$1:Lcom/example/fallsafe/MainActivity$1;

    iget-object v2, v2, Lcom/example/fallsafe/MainActivity$1;->this$0:Lcom/example/fallsafe/MainActivity;

    const-string v3, "Changes Saved"

    const/4 v4, 0x1

    invoke-static {v2, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 121
    iget-object v2, p0, Lcom/example/fallsafe/MainActivity$1$1;->val$dialog:Landroid/app/Dialog;

    invoke-virtual {v2}, Landroid/app/Dialog;->dismiss()V

    .line 122
    return-void
.end method
