.class public final Lcom/example/fallsafe/databinding/ActivityMainBinding;
.super Ljava/lang/Object;
.source "ActivityMainBinding.java"

# interfaces
.implements Landroidx/viewbinding/ViewBinding;


# instance fields
.field public final animationView:Lcom/airbnb/lottie/LottieAnimationView;

.field public final appTagline:Landroid/widget/TextView;

.field public final availableDevicesButton:Landroid/widget/Button;

.field public final heartRateButton:Landroid/widget/Button;

.field public final location:Landroid/widget/TextView;

.field private final rootView:Landroid/widget/LinearLayout;

.field public final settingButton:Landroid/widget/ImageButton;


# direct methods
.method private constructor <init>(Landroid/widget/LinearLayout;Lcom/airbnb/lottie/LottieAnimationView;Landroid/widget/TextView;Landroid/widget/Button;Landroid/widget/Button;Landroid/widget/TextView;Landroid/widget/ImageButton;)V
    .locals 0
    .param p1, "rootView"    # Landroid/widget/LinearLayout;
    .param p2, "animationView"    # Lcom/airbnb/lottie/LottieAnimationView;
    .param p3, "appTagline"    # Landroid/widget/TextView;
    .param p4, "availableDevicesButton"    # Landroid/widget/Button;
    .param p5, "heartRateButton"    # Landroid/widget/Button;
    .param p6, "location"    # Landroid/widget/TextView;
    .param p7, "settingButton"    # Landroid/widget/ImageButton;

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iput-object p1, p0, Lcom/example/fallsafe/databinding/ActivityMainBinding;->rootView:Landroid/widget/LinearLayout;

    .line 48
    iput-object p2, p0, Lcom/example/fallsafe/databinding/ActivityMainBinding;->animationView:Lcom/airbnb/lottie/LottieAnimationView;

    .line 49
    iput-object p3, p0, Lcom/example/fallsafe/databinding/ActivityMainBinding;->appTagline:Landroid/widget/TextView;

    .line 50
    iput-object p4, p0, Lcom/example/fallsafe/databinding/ActivityMainBinding;->availableDevicesButton:Landroid/widget/Button;

    .line 51
    iput-object p5, p0, Lcom/example/fallsafe/databinding/ActivityMainBinding;->heartRateButton:Landroid/widget/Button;

    .line 52
    iput-object p6, p0, Lcom/example/fallsafe/databinding/ActivityMainBinding;->location:Landroid/widget/TextView;

    .line 53
    iput-object p7, p0, Lcom/example/fallsafe/databinding/ActivityMainBinding;->settingButton:Landroid/widget/ImageButton;

    .line 54
    return-void
.end method

.method public static bind(Landroid/view/View;)Lcom/example/fallsafe/databinding/ActivityMainBinding;
    .locals 10
    .param p0, "rootView"    # Landroid/view/View;

    .line 83
    sget v0, Lcom/example/fallsafe/R$id;->animationView:I

    .line 84
    .local v0, "id":I
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Lcom/airbnb/lottie/LottieAnimationView;

    .line 85
    .local v4, "animationView":Lcom/airbnb/lottie/LottieAnimationView;
    if-eqz v4, :cond_5

    .line 89
    sget v0, Lcom/example/fallsafe/R$id;->app_tagline:I

    .line 90
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Landroid/widget/TextView;

    .line 91
    .local v5, "appTagline":Landroid/widget/TextView;
    if-eqz v5, :cond_4

    .line 95
    sget v0, Lcom/example/fallsafe/R$id;->available_devices_button:I

    .line 96
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Landroid/widget/Button;

    .line 97
    .local v6, "availableDevicesButton":Landroid/widget/Button;
    if-eqz v6, :cond_3

    .line 101
    sget v0, Lcom/example/fallsafe/R$id;->heart_rate_button:I

    .line 102
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Landroid/widget/Button;

    .line 103
    .local v7, "heartRateButton":Landroid/widget/Button;
    if-eqz v7, :cond_2

    .line 107
    sget v0, Lcom/example/fallsafe/R$id;->location:I

    .line 108
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v8, v1

    check-cast v8, Landroid/widget/TextView;

    .line 109
    .local v8, "location":Landroid/widget/TextView;
    if-eqz v8, :cond_1

    .line 113
    sget v0, Lcom/example/fallsafe/R$id;->settingButton:I

    .line 114
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v9, v1

    check-cast v9, Landroid/widget/ImageButton;

    .line 115
    .local v9, "settingButton":Landroid/widget/ImageButton;
    if-eqz v9, :cond_0

    .line 119
    new-instance v2, Lcom/example/fallsafe/databinding/ActivityMainBinding;

    move-object v3, p0

    check-cast v3, Landroid/widget/LinearLayout;

    invoke-direct/range {v2 .. v9}, Lcom/example/fallsafe/databinding/ActivityMainBinding;-><init>(Landroid/widget/LinearLayout;Lcom/airbnb/lottie/LottieAnimationView;Landroid/widget/TextView;Landroid/widget/Button;Landroid/widget/Button;Landroid/widget/TextView;Landroid/widget/ImageButton;)V

    return-object v2

    .line 116
    :cond_0
    goto :goto_0

    .line 110
    .end local v9    # "settingButton":Landroid/widget/ImageButton;
    :cond_1
    goto :goto_0

    .line 104
    .end local v8    # "location":Landroid/widget/TextView;
    :cond_2
    goto :goto_0

    .line 98
    .end local v7    # "heartRateButton":Landroid/widget/Button;
    :cond_3
    goto :goto_0

    .line 92
    .end local v6    # "availableDevicesButton":Landroid/widget/Button;
    :cond_4
    goto :goto_0

    .line 86
    .end local v5    # "appTagline":Landroid/widget/TextView;
    :cond_5
    nop

    .line 122
    .end local v4    # "animationView":Lcom/airbnb/lottie/LottieAnimationView;
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v1

    .line 123
    .local v1, "missingId":Ljava/lang/String;
    new-instance v2, Ljava/lang/NullPointerException;

    const-string v3, "Missing required view with ID: "

    invoke-virtual {v3, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public static inflate(Landroid/view/LayoutInflater;)Lcom/example/fallsafe/databinding/ActivityMainBinding;
    .locals 2
    .param p0, "inflater"    # Landroid/view/LayoutInflater;

    .line 64
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lcom/example/fallsafe/databinding/ActivityMainBinding;->inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Z)Lcom/example/fallsafe/databinding/ActivityMainBinding;

    move-result-object v0

    return-object v0
.end method

.method public static inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Z)Lcom/example/fallsafe/databinding/ActivityMainBinding;
    .locals 2
    .param p0, "inflater"    # Landroid/view/LayoutInflater;
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "attachToParent"    # Z

    .line 70
    sget v0, Lcom/example/fallsafe/R$layout;->activity_main:I

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 71
    .local v0, "root":Landroid/view/View;
    if-eqz p2, :cond_0

    .line 72
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 74
    :cond_0
    invoke-static {v0}, Lcom/example/fallsafe/databinding/ActivityMainBinding;->bind(Landroid/view/View;)Lcom/example/fallsafe/databinding/ActivityMainBinding;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public bridge synthetic getRoot()Landroid/view/View;
    .locals 1

    .line 21
    invoke-virtual {p0}, Lcom/example/fallsafe/databinding/ActivityMainBinding;->getRoot()Landroid/widget/LinearLayout;

    move-result-object v0

    return-object v0
.end method

.method public getRoot()Landroid/widget/LinearLayout;
    .locals 1

    .line 59
    iget-object v0, p0, Lcom/example/fallsafe/databinding/ActivityMainBinding;->rootView:Landroid/widget/LinearLayout;

    return-object v0
.end method
