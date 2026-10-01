.class Lcom/airbnb/lottie/parser/KeyframeParser;
.super Ljava/lang/Object;
.source "KeyframeParser.java"


# static fields
.field static INTERPOLATOR_NAMES:Lcom/airbnb/lottie/parser/moshi/JsonReader$Options; = null

.field private static final LINEAR_INTERPOLATOR:Landroid/view/animation/Interpolator;

.field private static final MAX_CP_VALUE:F = 100.0f

.field static NAMES:Lcom/airbnb/lottie/parser/moshi/JsonReader$Options;

.field private static pathInterpolatorCache:Landroidx/collection/SparseArrayCompat;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/collection/SparseArrayCompat<",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/animation/Interpolator;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 29
    new-instance v0, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v0}, Landroid/view/animation/LinearInterpolator;-><init>()V

    sput-object v0, Lcom/airbnb/lottie/parser/KeyframeParser;->LINEAR_INTERPOLATOR:Landroid/view/animation/Interpolator;

    .line 32
    const/16 v0, 0x8

    new-array v0, v0, [Ljava/lang/String;

    const-string/jumbo v1, "t"

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const-string v1, "s"

    const/4 v3, 0x1

    aput-object v1, v0, v3

    const-string v1, "e"

    const/4 v4, 0x2

    aput-object v1, v0, v4

    const/4 v1, 0x3

    const-string v5, "o"

    aput-object v5, v0, v1

    const/4 v1, 0x4

    const-string v5, "i"

    aput-object v5, v0, v1

    const/4 v1, 0x5

    const-string v5, "h"

    aput-object v5, v0, v1

    const/4 v1, 0x6

    const-string/jumbo v5, "to"

    aput-object v5, v0, v1

    const/4 v1, 0x7

    const-string/jumbo v5, "ti"

    aput-object v5, v0, v1

    invoke-static {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader$Options;->of([Ljava/lang/String;)Lcom/airbnb/lottie/parser/moshi/JsonReader$Options;

    move-result-object v0

    sput-object v0, Lcom/airbnb/lottie/parser/KeyframeParser;->NAMES:Lcom/airbnb/lottie/parser/moshi/JsonReader$Options;

    .line 42
    new-array v0, v4, [Ljava/lang/String;

    const-string/jumbo v1, "x"

    aput-object v1, v0, v2

    const-string/jumbo v1, "y"

    aput-object v1, v0, v3

    invoke-static {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader$Options;->of([Ljava/lang/String;)Lcom/airbnb/lottie/parser/moshi/JsonReader$Options;

    move-result-object v0

    sput-object v0, Lcom/airbnb/lottie/parser/KeyframeParser;->INTERPOLATOR_NAMES:Lcom/airbnb/lottie/parser/moshi/JsonReader$Options;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getInterpolator(I)Ljava/lang/ref/WeakReference;
    .locals 2
    .param p0, "hash"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/animation/Interpolator;",
            ">;"
        }
    .end annotation

    .line 59
    const-class v0, Lcom/airbnb/lottie/parser/KeyframeParser;

    monitor-enter v0

    .line 60
    :try_start_0
    invoke-static {}, Lcom/airbnb/lottie/parser/KeyframeParser;->pathInterpolatorCache()Landroidx/collection/SparseArrayCompat;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroidx/collection/SparseArrayCompat;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/WeakReference;

    monitor-exit v0

    return-object v1

    .line 61
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private static interpolatorFor(Landroid/graphics/PointF;Landroid/graphics/PointF;)Landroid/view/animation/Interpolator;
    .locals 8
    .param p0, "cp1"    # Landroid/graphics/PointF;
    .param p1, "cp2"    # Landroid/graphics/PointF;

    .line 331
    const/4 v0, 0x0

    .line 332
    .local v0, "interpolator":Landroid/view/animation/Interpolator;
    iget v1, p0, Landroid/graphics/PointF;->x:F

    const/high16 v2, -0x40800000    # -1.0f

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-static {v1, v2, v3}, Lcom/airbnb/lottie/utils/MiscUtils;->clamp(FFF)F

    move-result v1

    iput v1, p0, Landroid/graphics/PointF;->x:F

    .line 333
    iget v1, p0, Landroid/graphics/PointF;->y:F

    const/high16 v4, -0x3d380000    # -100.0f

    const/high16 v5, 0x42c80000    # 100.0f

    invoke-static {v1, v4, v5}, Lcom/airbnb/lottie/utils/MiscUtils;->clamp(FFF)F

    move-result v1

    iput v1, p0, Landroid/graphics/PointF;->y:F

    .line 334
    iget v1, p1, Landroid/graphics/PointF;->x:F

    invoke-static {v1, v2, v3}, Lcom/airbnb/lottie/utils/MiscUtils;->clamp(FFF)F

    move-result v1

    iput v1, p1, Landroid/graphics/PointF;->x:F

    .line 335
    iget v1, p1, Landroid/graphics/PointF;->y:F

    invoke-static {v1, v4, v5}, Lcom/airbnb/lottie/utils/MiscUtils;->clamp(FFF)F

    move-result v1

    iput v1, p1, Landroid/graphics/PointF;->y:F

    .line 336
    iget v1, p0, Landroid/graphics/PointF;->x:F

    iget v2, p0, Landroid/graphics/PointF;->y:F

    iget v4, p1, Landroid/graphics/PointF;->x:F

    iget v5, p1, Landroid/graphics/PointF;->y:F

    invoke-static {v1, v2, v4, v5}, Lcom/airbnb/lottie/utils/Utils;->hashFor(FFFF)I

    move-result v1

    .line 337
    .local v1, "hash":I
    invoke-static {}, Lcom/airbnb/lottie/L;->getDisablePathInterpolatorCache()Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    :cond_0
    invoke-static {v1}, Lcom/airbnb/lottie/parser/KeyframeParser;->getInterpolator(I)Ljava/lang/ref/WeakReference;

    move-result-object v2

    .line 338
    .local v2, "interpolatorRef":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/view/animation/Interpolator;>;"
    :goto_0
    if-eqz v2, :cond_1

    .line 339
    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v4

    move-object v0, v4

    check-cast v0, Landroid/view/animation/Interpolator;

    .line 341
    :cond_1
    if-eqz v2, :cond_2

    if-nez v0, :cond_4

    .line 343
    :cond_2
    :try_start_0
    iget v4, p0, Landroid/graphics/PointF;->x:F

    iget v5, p0, Landroid/graphics/PointF;->y:F

    iget v6, p1, Landroid/graphics/PointF;->x:F

    iget v7, p1, Landroid/graphics/PointF;->y:F

    invoke-static {v4, v5, v6, v7}, Landroidx/core/view/animation/PathInterpolatorCompat;->create(FFFF)Landroid/view/animation/Interpolator;

    move-result-object v3
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 354
    .end local v0    # "interpolator":Landroid/view/animation/Interpolator;
    .local v3, "interpolator":Landroid/view/animation/Interpolator;
    move-object v0, v3

    goto :goto_1

    .line 344
    .end local v3    # "interpolator":Landroid/view/animation/Interpolator;
    .restart local v0    # "interpolator":Landroid/view/animation/Interpolator;
    :catch_0
    move-exception v4

    .line 345
    .local v4, "e":Ljava/lang/IllegalArgumentException;
    const-string v5, "The Path cannot loop back on itself."

    invoke-virtual {v4}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 349
    iget v5, p0, Landroid/graphics/PointF;->x:F

    invoke-static {v5, v3}, Ljava/lang/Math;->min(FF)F

    move-result v3

    iget v5, p0, Landroid/graphics/PointF;->y:F

    iget v6, p1, Landroid/graphics/PointF;->x:F

    const/4 v7, 0x0

    invoke-static {v6, v7}, Ljava/lang/Math;->max(FF)F

    move-result v6

    iget v7, p1, Landroid/graphics/PointF;->y:F

    invoke-static {v3, v5, v6, v7}, Landroidx/core/view/animation/PathInterpolatorCompat;->create(FFFF)Landroid/view/animation/Interpolator;

    move-result-object v0

    goto :goto_1

    .line 352
    :cond_3
    new-instance v3, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v3}, Landroid/view/animation/LinearInterpolator;-><init>()V

    move-object v0, v3

    .line 355
    .end local v4    # "e":Ljava/lang/IllegalArgumentException;
    :goto_1
    invoke-static {}, Lcom/airbnb/lottie/L;->getDisablePathInterpolatorCache()Z

    move-result v3

    if-nez v3, :cond_4

    .line 357
    :try_start_1
    new-instance v3, Ljava/lang/ref/WeakReference;

    invoke-direct {v3, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-static {v1, v3}, Lcom/airbnb/lottie/parser/KeyframeParser;->putInterpolator(ILjava/lang/ref/WeakReference;)V
    :try_end_1
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_1 .. :try_end_1} :catch_1

    .line 363
    goto :goto_2

    .line 358
    :catch_1
    move-exception v3

    .line 366
    :cond_4
    :goto_2
    return-object v0
.end method

.method static parse(Lcom/airbnb/lottie/parser/moshi/JsonReader;Lcom/airbnb/lottie/LottieComposition;FLcom/airbnb/lottie/parser/ValueParser;ZZ)Lcom/airbnb/lottie/value/Keyframe;
    .locals 1
    .param p0, "reader"    # Lcom/airbnb/lottie/parser/moshi/JsonReader;
    .param p1, "composition"    # Lcom/airbnb/lottie/LottieComposition;
    .param p2, "scale"    # F
    .param p4, "animated"    # Z
    .param p5, "multiDimensional"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/airbnb/lottie/parser/moshi/JsonReader;",
            "Lcom/airbnb/lottie/LottieComposition;",
            "F",
            "Lcom/airbnb/lottie/parser/ValueParser<",
            "TT;>;ZZ)",
            "Lcom/airbnb/lottie/value/Keyframe<",
            "TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 78
    .local p3, "valueParser":Lcom/airbnb/lottie/parser/ValueParser;, "Lcom/airbnb/lottie/parser/ValueParser<TT;>;"
    if-eqz p4, :cond_0

    if-eqz p5, :cond_0

    .line 79
    invoke-static {p1, p0, p2, p3}, Lcom/airbnb/lottie/parser/KeyframeParser;->parseMultiDimensionalKeyframe(Lcom/airbnb/lottie/LottieComposition;Lcom/airbnb/lottie/parser/moshi/JsonReader;FLcom/airbnb/lottie/parser/ValueParser;)Lcom/airbnb/lottie/value/Keyframe;

    move-result-object v0

    return-object v0

    .line 80
    :cond_0
    if-eqz p4, :cond_1

    .line 81
    invoke-static {p1, p0, p2, p3}, Lcom/airbnb/lottie/parser/KeyframeParser;->parseKeyframe(Lcom/airbnb/lottie/LottieComposition;Lcom/airbnb/lottie/parser/moshi/JsonReader;FLcom/airbnb/lottie/parser/ValueParser;)Lcom/airbnb/lottie/value/Keyframe;

    move-result-object v0

    return-object v0

    .line 83
    :cond_1
    invoke-static {p0, p2, p3}, Lcom/airbnb/lottie/parser/KeyframeParser;->parseStaticValue(Lcom/airbnb/lottie/parser/moshi/JsonReader;FLcom/airbnb/lottie/parser/ValueParser;)Lcom/airbnb/lottie/value/Keyframe;

    move-result-object v0

    return-object v0
.end method

.method private static parseKeyframe(Lcom/airbnb/lottie/LottieComposition;Lcom/airbnb/lottie/parser/moshi/JsonReader;FLcom/airbnb/lottie/parser/ValueParser;)Lcom/airbnb/lottie/value/Keyframe;
    .locals 17
    .param p0, "composition"    # Lcom/airbnb/lottie/LottieComposition;
    .param p1, "reader"    # Lcom/airbnb/lottie/parser/moshi/JsonReader;
    .param p2, "scale"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/airbnb/lottie/LottieComposition;",
            "Lcom/airbnb/lottie/parser/moshi/JsonReader;",
            "F",
            "Lcom/airbnb/lottie/parser/ValueParser<",
            "TT;>;)",
            "Lcom/airbnb/lottie/value/Keyframe<",
            "TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 93
    .local p3, "valueParser":Lcom/airbnb/lottie/parser/ValueParser;, "Lcom/airbnb/lottie/parser/ValueParser<TT;>;"
    move-object/from16 v0, p1

    move/from16 v1, p2

    move-object/from16 v2, p3

    const/4 v3, 0x0

    .line 94
    .local v3, "cp1":Landroid/graphics/PointF;
    const/4 v4, 0x0

    .line 96
    .local v4, "cp2":Landroid/graphics/PointF;
    const/4 v5, 0x0

    .line 97
    .local v5, "startFrame":F
    const/4 v6, 0x0

    .line 98
    .local v6, "startValue":Ljava/lang/Object;, "TT;"
    const/4 v7, 0x0

    .line 99
    .local v7, "endValue":Ljava/lang/Object;, "TT;"
    const/4 v8, 0x0

    .line 100
    .local v8, "hold":Z
    const/4 v9, 0x0

    .line 103
    .local v9, "interpolator":Landroid/view/animation/Interpolator;
    const/4 v10, 0x0

    .line 104
    .local v10, "pathCp1":Landroid/graphics/PointF;
    const/4 v11, 0x0

    .line 106
    .local v11, "pathCp2":Landroid/graphics/PointF;
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->beginObject()V

    move v15, v5

    move-object v12, v6

    move-object v5, v10

    move-object v6, v11

    .line 107
    .end local v10    # "pathCp1":Landroid/graphics/PointF;
    .end local v11    # "pathCp2":Landroid/graphics/PointF;
    .local v5, "pathCp1":Landroid/graphics/PointF;
    .local v6, "pathCp2":Landroid/graphics/PointF;
    .local v12, "startValue":Ljava/lang/Object;, "TT;"
    .local v15, "startFrame":F
    :goto_0
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_1

    .line 108
    sget-object v10, Lcom/airbnb/lottie/parser/KeyframeParser;->NAMES:Lcom/airbnb/lottie/parser/moshi/JsonReader$Options;

    invoke-virtual {v0, v10}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->selectName(Lcom/airbnb/lottie/parser/moshi/JsonReader$Options;)I

    move-result v10

    const/high16 v11, 0x3f800000    # 1.0f

    packed-switch v10, :pswitch_data_0

    .line 134
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->skipValue()V

    goto :goto_0

    .line 131
    :pswitch_0
    invoke-static/range {p1 .. p2}, Lcom/airbnb/lottie/parser/JsonUtils;->jsonToPoint(Lcom/airbnb/lottie/parser/moshi/JsonReader;F)Landroid/graphics/PointF;

    move-result-object v6

    .line 132
    goto :goto_0

    .line 128
    :pswitch_1
    invoke-static/range {p1 .. p2}, Lcom/airbnb/lottie/parser/JsonUtils;->jsonToPoint(Lcom/airbnb/lottie/parser/moshi/JsonReader;F)Landroid/graphics/PointF;

    move-result-object v5

    .line 129
    goto :goto_0

    .line 125
    :pswitch_2
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->nextInt()I

    move-result v10

    const/4 v11, 0x1

    if-ne v10, v11, :cond_0

    goto :goto_1

    :cond_0
    const/4 v11, 0x0

    :goto_1
    move v8, v11

    .line 126
    goto :goto_0

    .line 122
    :pswitch_3
    invoke-static {v0, v11}, Lcom/airbnb/lottie/parser/JsonUtils;->jsonToPoint(Lcom/airbnb/lottie/parser/moshi/JsonReader;F)Landroid/graphics/PointF;

    move-result-object v4

    .line 123
    goto :goto_0

    .line 119
    :pswitch_4
    invoke-static {v0, v11}, Lcom/airbnb/lottie/parser/JsonUtils;->jsonToPoint(Lcom/airbnb/lottie/parser/moshi/JsonReader;F)Landroid/graphics/PointF;

    move-result-object v3

    .line 120
    goto :goto_0

    .line 116
    :pswitch_5
    invoke-interface {v2, v0, v1}, Lcom/airbnb/lottie/parser/ValueParser;->parse(Lcom/airbnb/lottie/parser/moshi/JsonReader;F)Ljava/lang/Object;

    move-result-object v7

    .line 117
    goto :goto_0

    .line 113
    :pswitch_6
    invoke-interface {v2, v0, v1}, Lcom/airbnb/lottie/parser/ValueParser;->parse(Lcom/airbnb/lottie/parser/moshi/JsonReader;F)Ljava/lang/Object;

    move-result-object v12

    .line 114
    goto :goto_0

    .line 110
    :pswitch_7
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->nextDouble()D

    move-result-wide v10

    double-to-float v15, v10

    .line 111
    goto :goto_0

    .line 137
    :cond_1
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->endObject()V

    .line 139
    if-eqz v8, :cond_2

    .line 140
    move-object v7, v12

    .line 142
    sget-object v9, Lcom/airbnb/lottie/parser/KeyframeParser;->LINEAR_INTERPOLATOR:Landroid/view/animation/Interpolator;

    move-object v13, v7

    move-object v14, v9

    goto :goto_2

    .line 143
    :cond_2
    if-eqz v3, :cond_3

    if-eqz v4, :cond_3

    .line 144
    invoke-static {v3, v4}, Lcom/airbnb/lottie/parser/KeyframeParser;->interpolatorFor(Landroid/graphics/PointF;Landroid/graphics/PointF;)Landroid/view/animation/Interpolator;

    move-result-object v9

    move-object v13, v7

    move-object v14, v9

    goto :goto_2

    .line 146
    :cond_3
    sget-object v9, Lcom/airbnb/lottie/parser/KeyframeParser;->LINEAR_INTERPOLATOR:Landroid/view/animation/Interpolator;

    move-object v13, v7

    move-object v14, v9

    .line 149
    .end local v7    # "endValue":Ljava/lang/Object;, "TT;"
    .end local v9    # "interpolator":Landroid/view/animation/Interpolator;
    .local v13, "endValue":Ljava/lang/Object;, "TT;"
    .local v14, "interpolator":Landroid/view/animation/Interpolator;
    :goto_2
    new-instance v10, Lcom/airbnb/lottie/value/Keyframe;

    const/16 v16, 0x0

    move-object/from16 v11, p0

    invoke-direct/range {v10 .. v16}, Lcom/airbnb/lottie/value/Keyframe;-><init>(Lcom/airbnb/lottie/LottieComposition;Ljava/lang/Object;Ljava/lang/Object;Landroid/view/animation/Interpolator;FLjava/lang/Float;)V

    .line 151
    .local v10, "keyframe":Lcom/airbnb/lottie/value/Keyframe;, "Lcom/airbnb/lottie/value/Keyframe<TT;>;"
    iput-object v5, v10, Lcom/airbnb/lottie/value/Keyframe;->pathCp1:Landroid/graphics/PointF;

    .line 152
    iput-object v6, v10, Lcom/airbnb/lottie/value/Keyframe;->pathCp2:Landroid/graphics/PointF;

    .line 153
    return-object v10

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static parseMultiDimensionalKeyframe(Lcom/airbnb/lottie/LottieComposition;Lcom/airbnb/lottie/parser/moshi/JsonReader;FLcom/airbnb/lottie/parser/ValueParser;)Lcom/airbnb/lottie/value/Keyframe;
    .locals 27
    .param p0, "composition"    # Lcom/airbnb/lottie/LottieComposition;
    .param p1, "reader"    # Lcom/airbnb/lottie/parser/moshi/JsonReader;
    .param p2, "scale"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/airbnb/lottie/LottieComposition;",
            "Lcom/airbnb/lottie/parser/moshi/JsonReader;",
            "F",
            "Lcom/airbnb/lottie/parser/ValueParser<",
            "TT;>;)",
            "Lcom/airbnb/lottie/value/Keyframe<",
            "TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 158
    .local p3, "valueParser":Lcom/airbnb/lottie/parser/ValueParser;, "Lcom/airbnb/lottie/parser/ValueParser<TT;>;"
    move-object/from16 v0, p1

    move/from16 v1, p2

    move-object/from16 v2, p3

    const/4 v3, 0x0

    .line 159
    .local v3, "cp1":Landroid/graphics/PointF;
    const/4 v4, 0x0

    .line 161
    .local v4, "cp2":Landroid/graphics/PointF;
    const/4 v5, 0x0

    .line 162
    .local v5, "xCp1":Landroid/graphics/PointF;
    const/4 v6, 0x0

    .line 163
    .local v6, "xCp2":Landroid/graphics/PointF;
    const/4 v7, 0x0

    .line 164
    .local v7, "yCp1":Landroid/graphics/PointF;
    const/4 v8, 0x0

    .line 166
    .local v8, "yCp2":Landroid/graphics/PointF;
    const/4 v9, 0x0

    .line 167
    .local v9, "startFrame":F
    const/4 v10, 0x0

    .line 168
    .local v10, "startValue":Ljava/lang/Object;, "TT;"
    const/4 v11, 0x0

    .line 169
    .local v11, "endValue":Ljava/lang/Object;, "TT;"
    const/4 v12, 0x0

    .line 170
    .local v12, "hold":Z
    const/4 v13, 0x0

    .line 171
    .local v13, "interpolator":Landroid/view/animation/Interpolator;
    const/4 v14, 0x0

    .line 172
    .local v14, "xInterpolator":Landroid/view/animation/Interpolator;
    const/4 v15, 0x0

    .line 175
    .local v15, "yInterpolator":Landroid/view/animation/Interpolator;
    const/16 v16, 0x0

    .line 176
    .local v16, "pathCp1":Landroid/graphics/PointF;
    const/16 v17, 0x0

    .line 178
    .local v17, "pathCp2":Landroid/graphics/PointF;
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->beginObject()V

    move/from16 v21, v9

    move-object/from16 v18, v10

    move-object/from16 v9, v16

    move-object/from16 v10, v17

    .line 179
    .end local v16    # "pathCp1":Landroid/graphics/PointF;
    .end local v17    # "pathCp2":Landroid/graphics/PointF;
    .local v9, "pathCp1":Landroid/graphics/PointF;
    .local v10, "pathCp2":Landroid/graphics/PointF;
    .local v18, "startValue":Ljava/lang/Object;, "TT;"
    .local v21, "startFrame":F
    :goto_0
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_d

    .line 180
    move-object/from16 v16, v11

    .end local v11    # "endValue":Ljava/lang/Object;, "TT;"
    .local v16, "endValue":Ljava/lang/Object;, "TT;"
    sget-object v11, Lcom/airbnb/lottie/parser/KeyframeParser;->NAMES:Lcom/airbnb/lottie/parser/moshi/JsonReader$Options;

    invoke-virtual {v0, v11}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->selectName(Lcom/airbnb/lottie/parser/moshi/JsonReader$Options;)I

    move-result v11

    packed-switch v11, :pswitch_data_0

    .line 300
    move-object/from16 v25, v10

    move/from16 v24, v12

    move-object/from16 v17, v13

    move-object/from16 v19, v14

    move-object/from16 v20, v15

    move-object v15, v9

    .end local v9    # "pathCp1":Landroid/graphics/PointF;
    .end local v10    # "pathCp2":Landroid/graphics/PointF;
    .end local v12    # "hold":Z
    .end local v13    # "interpolator":Landroid/view/animation/Interpolator;
    .end local v14    # "xInterpolator":Landroid/view/animation/Interpolator;
    .local v15, "pathCp1":Landroid/graphics/PointF;
    .local v17, "interpolator":Landroid/view/animation/Interpolator;
    .local v19, "xInterpolator":Landroid/view/animation/Interpolator;
    .local v20, "yInterpolator":Landroid/view/animation/Interpolator;
    .local v24, "hold":Z
    .local v25, "pathCp2":Landroid/graphics/PointF;
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->skipValue()V

    move-object/from16 v11, v16

    move-object/from16 v15, v20

    goto :goto_0

    .line 297
    .end local v17    # "interpolator":Landroid/view/animation/Interpolator;
    .end local v19    # "xInterpolator":Landroid/view/animation/Interpolator;
    .end local v20    # "yInterpolator":Landroid/view/animation/Interpolator;
    .end local v24    # "hold":Z
    .end local v25    # "pathCp2":Landroid/graphics/PointF;
    .restart local v9    # "pathCp1":Landroid/graphics/PointF;
    .restart local v10    # "pathCp2":Landroid/graphics/PointF;
    .restart local v12    # "hold":Z
    .restart local v13    # "interpolator":Landroid/view/animation/Interpolator;
    .restart local v14    # "xInterpolator":Landroid/view/animation/Interpolator;
    .local v15, "yInterpolator":Landroid/view/animation/Interpolator;
    :pswitch_0
    invoke-static/range {p1 .. p2}, Lcom/airbnb/lottie/parser/JsonUtils;->jsonToPoint(Lcom/airbnb/lottie/parser/moshi/JsonReader;F)Landroid/graphics/PointF;

    move-result-object v10

    .line 298
    move-object/from16 v11, v16

    goto :goto_0

    .line 294
    :pswitch_1
    invoke-static/range {p1 .. p2}, Lcom/airbnb/lottie/parser/JsonUtils;->jsonToPoint(Lcom/airbnb/lottie/parser/moshi/JsonReader;F)Landroid/graphics/PointF;

    move-result-object v9

    .line 295
    move-object/from16 v11, v16

    goto :goto_0

    .line 291
    :pswitch_2
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->nextInt()I

    move-result v11

    move/from16 v24, v12

    .end local v12    # "hold":Z
    .restart local v24    # "hold":Z
    const/4 v12, 0x1

    if-ne v11, v12, :cond_0

    goto :goto_1

    :cond_0
    const/4 v12, 0x0

    .line 292
    .end local v24    # "hold":Z
    .restart local v12    # "hold":Z
    :goto_1
    move-object/from16 v11, v16

    goto :goto_0

    .line 241
    :pswitch_3
    move/from16 v24, v12

    .end local v12    # "hold":Z
    .restart local v24    # "hold":Z
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->peek()Lcom/airbnb/lottie/parser/moshi/JsonReader$Token;

    move-result-object v11

    sget-object v12, Lcom/airbnb/lottie/parser/moshi/JsonReader$Token;->BEGIN_OBJECT:Lcom/airbnb/lottie/parser/moshi/JsonReader$Token;

    if-ne v11, v12, :cond_6

    .line 242
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->beginObject()V

    .line 243
    const/4 v11, 0x0

    .line 244
    .local v11, "xCp2x":F
    const/4 v12, 0x0

    .line 245
    .local v12, "xCp2y":F
    const/16 v17, 0x0

    .line 246
    .local v17, "yCp2x":F
    const/16 v19, 0x0

    move/from16 v26, v17

    move-object/from16 v17, v13

    move/from16 v13, v26

    move/from16 v26, v19

    move-object/from16 v19, v14

    move/from16 v14, v26

    .line 247
    .local v13, "yCp2x":F
    .local v14, "yCp2y":F
    .local v17, "interpolator":Landroid/view/animation/Interpolator;
    .restart local v19    # "xInterpolator":Landroid/view/animation/Interpolator;
    :goto_2
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_5

    .line 248
    move-object/from16 v20, v15

    .end local v15    # "yInterpolator":Landroid/view/animation/Interpolator;
    .restart local v20    # "yInterpolator":Landroid/view/animation/Interpolator;
    sget-object v15, Lcom/airbnb/lottie/parser/KeyframeParser;->INTERPOLATOR_NAMES:Lcom/airbnb/lottie/parser/moshi/JsonReader$Options;

    invoke-virtual {v0, v15}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->selectName(Lcom/airbnb/lottie/parser/moshi/JsonReader$Options;)I

    move-result v15

    packed-switch v15, :pswitch_data_1

    .line 280
    move-object v15, v9

    move-object/from16 v25, v10

    .end local v9    # "pathCp1":Landroid/graphics/PointF;
    .end local v10    # "pathCp2":Landroid/graphics/PointF;
    .local v15, "pathCp1":Landroid/graphics/PointF;
    .restart local v25    # "pathCp2":Landroid/graphics/PointF;
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->skipValue()V

    move-object/from16 v15, v20

    goto :goto_2

    .line 265
    .end local v15    # "pathCp1":Landroid/graphics/PointF;
    .end local v25    # "pathCp2":Landroid/graphics/PointF;
    .restart local v9    # "pathCp1":Landroid/graphics/PointF;
    .restart local v10    # "pathCp2":Landroid/graphics/PointF;
    :pswitch_4
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->peek()Lcom/airbnb/lottie/parser/moshi/JsonReader$Token;

    move-result-object v15

    move-object/from16 v25, v10

    .end local v10    # "pathCp2":Landroid/graphics/PointF;
    .restart local v25    # "pathCp2":Landroid/graphics/PointF;
    sget-object v10, Lcom/airbnb/lottie/parser/moshi/JsonReader$Token;->NUMBER:Lcom/airbnb/lottie/parser/moshi/JsonReader$Token;

    if-ne v15, v10, :cond_1

    .line 266
    move-object v15, v9

    .end local v9    # "pathCp1":Landroid/graphics/PointF;
    .restart local v15    # "pathCp1":Landroid/graphics/PointF;
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->nextDouble()D

    move-result-wide v9

    double-to-float v12, v9

    .line 267
    move v14, v12

    move-object v9, v15

    move-object/from16 v15, v20

    move-object/from16 v10, v25

    goto :goto_2

    .line 269
    .end local v15    # "pathCp1":Landroid/graphics/PointF;
    .restart local v9    # "pathCp1":Landroid/graphics/PointF;
    :cond_1
    move-object v15, v9

    .end local v9    # "pathCp1":Landroid/graphics/PointF;
    .restart local v15    # "pathCp1":Landroid/graphics/PointF;
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->beginArray()V

    .line 270
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->nextDouble()D

    move-result-wide v9

    double-to-float v12, v9

    .line 271
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->peek()Lcom/airbnb/lottie/parser/moshi/JsonReader$Token;

    move-result-object v9

    sget-object v10, Lcom/airbnb/lottie/parser/moshi/JsonReader$Token;->NUMBER:Lcom/airbnb/lottie/parser/moshi/JsonReader$Token;

    if-ne v9, v10, :cond_2

    .line 272
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->nextDouble()D

    move-result-wide v9

    double-to-float v9, v9

    move v14, v9

    .end local v14    # "yCp2y":F
    .local v9, "yCp2y":F
    goto :goto_3

    .line 274
    .end local v9    # "yCp2y":F
    .restart local v14    # "yCp2y":F
    :cond_2
    move v9, v12

    move v14, v9

    .line 276
    :goto_3
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->endArray()V

    .line 278
    move-object v9, v15

    move-object/from16 v15, v20

    move-object/from16 v10, v25

    goto :goto_2

    .line 250
    .end local v15    # "pathCp1":Landroid/graphics/PointF;
    .end local v25    # "pathCp2":Landroid/graphics/PointF;
    .local v9, "pathCp1":Landroid/graphics/PointF;
    .restart local v10    # "pathCp2":Landroid/graphics/PointF;
    :pswitch_5
    move-object v15, v9

    move-object/from16 v25, v10

    .end local v9    # "pathCp1":Landroid/graphics/PointF;
    .end local v10    # "pathCp2":Landroid/graphics/PointF;
    .restart local v15    # "pathCp1":Landroid/graphics/PointF;
    .restart local v25    # "pathCp2":Landroid/graphics/PointF;
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->peek()Lcom/airbnb/lottie/parser/moshi/JsonReader$Token;

    move-result-object v9

    sget-object v10, Lcom/airbnb/lottie/parser/moshi/JsonReader$Token;->NUMBER:Lcom/airbnb/lottie/parser/moshi/JsonReader$Token;

    if-ne v9, v10, :cond_3

    .line 251
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->nextDouble()D

    move-result-wide v9

    double-to-float v11, v9

    .line 252
    move v13, v11

    move-object v9, v15

    move-object/from16 v15, v20

    move-object/from16 v10, v25

    goto :goto_2

    .line 254
    :cond_3
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->beginArray()V

    .line 255
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->nextDouble()D

    move-result-wide v9

    double-to-float v11, v9

    .line 256
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->peek()Lcom/airbnb/lottie/parser/moshi/JsonReader$Token;

    move-result-object v9

    sget-object v10, Lcom/airbnb/lottie/parser/moshi/JsonReader$Token;->NUMBER:Lcom/airbnb/lottie/parser/moshi/JsonReader$Token;

    if-ne v9, v10, :cond_4

    .line 257
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->nextDouble()D

    move-result-wide v9

    double-to-float v9, v9

    move v13, v9

    .end local v13    # "yCp2x":F
    .local v9, "yCp2x":F
    goto :goto_4

    .line 259
    .end local v9    # "yCp2x":F
    .restart local v13    # "yCp2x":F
    :cond_4
    move v9, v11

    move v13, v9

    .line 261
    :goto_4
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->endArray()V

    .line 263
    move-object v9, v15

    move-object/from16 v15, v20

    move-object/from16 v10, v25

    goto/16 :goto_2

    .line 283
    .end local v20    # "yInterpolator":Landroid/view/animation/Interpolator;
    .end local v25    # "pathCp2":Landroid/graphics/PointF;
    .local v9, "pathCp1":Landroid/graphics/PointF;
    .restart local v10    # "pathCp2":Landroid/graphics/PointF;
    .local v15, "yInterpolator":Landroid/view/animation/Interpolator;
    :cond_5
    move-object/from16 v25, v10

    move-object/from16 v20, v15

    move-object v15, v9

    .end local v9    # "pathCp1":Landroid/graphics/PointF;
    .end local v10    # "pathCp2":Landroid/graphics/PointF;
    .local v15, "pathCp1":Landroid/graphics/PointF;
    .restart local v20    # "yInterpolator":Landroid/view/animation/Interpolator;
    .restart local v25    # "pathCp2":Landroid/graphics/PointF;
    new-instance v9, Landroid/graphics/PointF;

    invoke-direct {v9, v11, v12}, Landroid/graphics/PointF;-><init>(FF)V

    move-object v6, v9

    .line 284
    new-instance v9, Landroid/graphics/PointF;

    invoke-direct {v9, v13, v14}, Landroid/graphics/PointF;-><init>(FF)V

    move-object v8, v9

    .line 285
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->endObject()V

    .line 286
    .end local v11    # "xCp2x":F
    .end local v12    # "xCp2y":F
    .end local v13    # "yCp2x":F
    .end local v14    # "yCp2y":F
    move-object v9, v15

    move-object/from16 v11, v16

    move-object/from16 v13, v17

    move-object/from16 v14, v19

    move-object/from16 v15, v20

    move/from16 v12, v24

    goto/16 :goto_0

    .line 287
    .end local v17    # "interpolator":Landroid/view/animation/Interpolator;
    .end local v19    # "xInterpolator":Landroid/view/animation/Interpolator;
    .end local v20    # "yInterpolator":Landroid/view/animation/Interpolator;
    .end local v25    # "pathCp2":Landroid/graphics/PointF;
    .restart local v9    # "pathCp1":Landroid/graphics/PointF;
    .restart local v10    # "pathCp2":Landroid/graphics/PointF;
    .local v13, "interpolator":Landroid/view/animation/Interpolator;
    .local v14, "xInterpolator":Landroid/view/animation/Interpolator;
    .local v15, "yInterpolator":Landroid/view/animation/Interpolator;
    :cond_6
    move-object/from16 v25, v10

    move-object/from16 v17, v13

    move-object/from16 v19, v14

    move-object/from16 v20, v15

    move-object v15, v9

    .end local v9    # "pathCp1":Landroid/graphics/PointF;
    .end local v10    # "pathCp2":Landroid/graphics/PointF;
    .end local v13    # "interpolator":Landroid/view/animation/Interpolator;
    .end local v14    # "xInterpolator":Landroid/view/animation/Interpolator;
    .local v15, "pathCp1":Landroid/graphics/PointF;
    .restart local v17    # "interpolator":Landroid/view/animation/Interpolator;
    .restart local v19    # "xInterpolator":Landroid/view/animation/Interpolator;
    .restart local v20    # "yInterpolator":Landroid/view/animation/Interpolator;
    .restart local v25    # "pathCp2":Landroid/graphics/PointF;
    invoke-static/range {p1 .. p2}, Lcom/airbnb/lottie/parser/JsonUtils;->jsonToPoint(Lcom/airbnb/lottie/parser/moshi/JsonReader;F)Landroid/graphics/PointF;

    move-result-object v4

    .line 289
    move-object/from16 v11, v16

    move-object/from16 v15, v20

    move/from16 v12, v24

    goto/16 :goto_0

    .line 191
    .end local v17    # "interpolator":Landroid/view/animation/Interpolator;
    .end local v19    # "xInterpolator":Landroid/view/animation/Interpolator;
    .end local v20    # "yInterpolator":Landroid/view/animation/Interpolator;
    .end local v24    # "hold":Z
    .end local v25    # "pathCp2":Landroid/graphics/PointF;
    .restart local v9    # "pathCp1":Landroid/graphics/PointF;
    .restart local v10    # "pathCp2":Landroid/graphics/PointF;
    .local v12, "hold":Z
    .restart local v13    # "interpolator":Landroid/view/animation/Interpolator;
    .restart local v14    # "xInterpolator":Landroid/view/animation/Interpolator;
    .local v15, "yInterpolator":Landroid/view/animation/Interpolator;
    :pswitch_6
    move-object/from16 v25, v10

    move/from16 v24, v12

    move-object/from16 v17, v13

    move-object/from16 v19, v14

    move-object/from16 v20, v15

    move-object v15, v9

    .end local v9    # "pathCp1":Landroid/graphics/PointF;
    .end local v10    # "pathCp2":Landroid/graphics/PointF;
    .end local v12    # "hold":Z
    .end local v13    # "interpolator":Landroid/view/animation/Interpolator;
    .end local v14    # "xInterpolator":Landroid/view/animation/Interpolator;
    .local v15, "pathCp1":Landroid/graphics/PointF;
    .restart local v17    # "interpolator":Landroid/view/animation/Interpolator;
    .restart local v19    # "xInterpolator":Landroid/view/animation/Interpolator;
    .restart local v20    # "yInterpolator":Landroid/view/animation/Interpolator;
    .restart local v24    # "hold":Z
    .restart local v25    # "pathCp2":Landroid/graphics/PointF;
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->peek()Lcom/airbnb/lottie/parser/moshi/JsonReader$Token;

    move-result-object v9

    sget-object v10, Lcom/airbnb/lottie/parser/moshi/JsonReader$Token;->BEGIN_OBJECT:Lcom/airbnb/lottie/parser/moshi/JsonReader$Token;

    if-ne v9, v10, :cond_c

    .line 192
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->beginObject()V

    .line 193
    const/4 v9, 0x0

    .line 194
    .local v9, "xCp1x":F
    const/4 v10, 0x0

    .line 195
    .local v10, "xCp1y":F
    const/4 v11, 0x0

    .line 196
    .local v11, "yCp1x":F
    const/4 v12, 0x0

    .line 197
    .local v12, "yCp1y":F
    :goto_5
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_b

    .line 198
    sget-object v13, Lcom/airbnb/lottie/parser/KeyframeParser;->INTERPOLATOR_NAMES:Lcom/airbnb/lottie/parser/moshi/JsonReader$Options;

    invoke-virtual {v0, v13}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->selectName(Lcom/airbnb/lottie/parser/moshi/JsonReader$Options;)I

    move-result v13

    packed-switch v13, :pswitch_data_2

    .line 230
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->skipValue()V

    goto :goto_5

    .line 215
    :pswitch_7
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->peek()Lcom/airbnb/lottie/parser/moshi/JsonReader$Token;

    move-result-object v13

    sget-object v14, Lcom/airbnb/lottie/parser/moshi/JsonReader$Token;->NUMBER:Lcom/airbnb/lottie/parser/moshi/JsonReader$Token;

    if-ne v13, v14, :cond_7

    .line 216
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->nextDouble()D

    move-result-wide v13

    double-to-float v10, v13

    .line 217
    move v12, v10

    goto :goto_5

    .line 219
    :cond_7
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->beginArray()V

    .line 220
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->nextDouble()D

    move-result-wide v13

    double-to-float v10, v13

    .line 221
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->peek()Lcom/airbnb/lottie/parser/moshi/JsonReader$Token;

    move-result-object v13

    sget-object v14, Lcom/airbnb/lottie/parser/moshi/JsonReader$Token;->NUMBER:Lcom/airbnb/lottie/parser/moshi/JsonReader$Token;

    if-ne v13, v14, :cond_8

    .line 222
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->nextDouble()D

    move-result-wide v13

    double-to-float v12, v13

    goto :goto_6

    .line 224
    :cond_8
    move v12, v10

    .line 226
    :goto_6
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->endArray()V

    .line 228
    goto :goto_5

    .line 200
    :pswitch_8
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->peek()Lcom/airbnb/lottie/parser/moshi/JsonReader$Token;

    move-result-object v13

    sget-object v14, Lcom/airbnb/lottie/parser/moshi/JsonReader$Token;->NUMBER:Lcom/airbnb/lottie/parser/moshi/JsonReader$Token;

    if-ne v13, v14, :cond_9

    .line 201
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->nextDouble()D

    move-result-wide v13

    double-to-float v9, v13

    .line 202
    move v11, v9

    goto :goto_5

    .line 204
    :cond_9
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->beginArray()V

    .line 205
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->nextDouble()D

    move-result-wide v13

    double-to-float v9, v13

    .line 206
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->peek()Lcom/airbnb/lottie/parser/moshi/JsonReader$Token;

    move-result-object v13

    sget-object v14, Lcom/airbnb/lottie/parser/moshi/JsonReader$Token;->NUMBER:Lcom/airbnb/lottie/parser/moshi/JsonReader$Token;

    if-ne v13, v14, :cond_a

    .line 207
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->nextDouble()D

    move-result-wide v13

    double-to-float v11, v13

    goto :goto_7

    .line 209
    :cond_a
    move v11, v9

    .line 211
    :goto_7
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->endArray()V

    .line 213
    goto :goto_5

    .line 233
    :cond_b
    new-instance v13, Landroid/graphics/PointF;

    invoke-direct {v13, v9, v10}, Landroid/graphics/PointF;-><init>(FF)V

    move-object v5, v13

    .line 234
    new-instance v13, Landroid/graphics/PointF;

    invoke-direct {v13, v11, v12}, Landroid/graphics/PointF;-><init>(FF)V

    move-object v7, v13

    .line 235
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->endObject()V

    .line 236
    .end local v9    # "xCp1x":F
    .end local v10    # "xCp1y":F
    .end local v11    # "yCp1x":F
    .end local v12    # "yCp1y":F
    move-object v9, v15

    move-object/from16 v11, v16

    move-object/from16 v13, v17

    move-object/from16 v14, v19

    move-object/from16 v15, v20

    move/from16 v12, v24

    move-object/from16 v10, v25

    goto/16 :goto_0

    .line 237
    :cond_c
    invoke-static/range {p1 .. p2}, Lcom/airbnb/lottie/parser/JsonUtils;->jsonToPoint(Lcom/airbnb/lottie/parser/moshi/JsonReader;F)Landroid/graphics/PointF;

    move-result-object v3

    .line 239
    move-object v9, v15

    move-object/from16 v11, v16

    move-object/from16 v13, v17

    move-object/from16 v14, v19

    move-object/from16 v15, v20

    move/from16 v12, v24

    move-object/from16 v10, v25

    goto/16 :goto_0

    .line 188
    .end local v17    # "interpolator":Landroid/view/animation/Interpolator;
    .end local v19    # "xInterpolator":Landroid/view/animation/Interpolator;
    .end local v20    # "yInterpolator":Landroid/view/animation/Interpolator;
    .end local v24    # "hold":Z
    .end local v25    # "pathCp2":Landroid/graphics/PointF;
    .local v9, "pathCp1":Landroid/graphics/PointF;
    .local v10, "pathCp2":Landroid/graphics/PointF;
    .local v12, "hold":Z
    .restart local v13    # "interpolator":Landroid/view/animation/Interpolator;
    .restart local v14    # "xInterpolator":Landroid/view/animation/Interpolator;
    .local v15, "yInterpolator":Landroid/view/animation/Interpolator;
    :pswitch_9
    move-object/from16 v25, v10

    move/from16 v24, v12

    move-object/from16 v17, v13

    move-object/from16 v19, v14

    move-object/from16 v20, v15

    move-object v15, v9

    .end local v9    # "pathCp1":Landroid/graphics/PointF;
    .end local v10    # "pathCp2":Landroid/graphics/PointF;
    .end local v12    # "hold":Z
    .end local v13    # "interpolator":Landroid/view/animation/Interpolator;
    .end local v14    # "xInterpolator":Landroid/view/animation/Interpolator;
    .local v15, "pathCp1":Landroid/graphics/PointF;
    .restart local v17    # "interpolator":Landroid/view/animation/Interpolator;
    .restart local v19    # "xInterpolator":Landroid/view/animation/Interpolator;
    .restart local v20    # "yInterpolator":Landroid/view/animation/Interpolator;
    .restart local v24    # "hold":Z
    .restart local v25    # "pathCp2":Landroid/graphics/PointF;
    invoke-interface {v2, v0, v1}, Lcom/airbnb/lottie/parser/ValueParser;->parse(Lcom/airbnb/lottie/parser/moshi/JsonReader;F)Ljava/lang/Object;

    move-result-object v11

    .line 189
    .end local v16    # "endValue":Ljava/lang/Object;, "TT;"
    .local v11, "endValue":Ljava/lang/Object;, "TT;"
    move-object/from16 v15, v20

    goto/16 :goto_0

    .line 185
    .end local v11    # "endValue":Ljava/lang/Object;, "TT;"
    .end local v17    # "interpolator":Landroid/view/animation/Interpolator;
    .end local v19    # "xInterpolator":Landroid/view/animation/Interpolator;
    .end local v20    # "yInterpolator":Landroid/view/animation/Interpolator;
    .end local v24    # "hold":Z
    .end local v25    # "pathCp2":Landroid/graphics/PointF;
    .restart local v9    # "pathCp1":Landroid/graphics/PointF;
    .restart local v10    # "pathCp2":Landroid/graphics/PointF;
    .restart local v12    # "hold":Z
    .restart local v13    # "interpolator":Landroid/view/animation/Interpolator;
    .restart local v14    # "xInterpolator":Landroid/view/animation/Interpolator;
    .local v15, "yInterpolator":Landroid/view/animation/Interpolator;
    .restart local v16    # "endValue":Ljava/lang/Object;, "TT;"
    :pswitch_a
    move-object/from16 v25, v10

    move/from16 v24, v12

    move-object/from16 v17, v13

    move-object/from16 v19, v14

    move-object/from16 v20, v15

    move-object v15, v9

    .end local v9    # "pathCp1":Landroid/graphics/PointF;
    .end local v10    # "pathCp2":Landroid/graphics/PointF;
    .end local v12    # "hold":Z
    .end local v13    # "interpolator":Landroid/view/animation/Interpolator;
    .end local v14    # "xInterpolator":Landroid/view/animation/Interpolator;
    .local v15, "pathCp1":Landroid/graphics/PointF;
    .restart local v17    # "interpolator":Landroid/view/animation/Interpolator;
    .restart local v19    # "xInterpolator":Landroid/view/animation/Interpolator;
    .restart local v20    # "yInterpolator":Landroid/view/animation/Interpolator;
    .restart local v24    # "hold":Z
    .restart local v25    # "pathCp2":Landroid/graphics/PointF;
    invoke-interface {v2, v0, v1}, Lcom/airbnb/lottie/parser/ValueParser;->parse(Lcom/airbnb/lottie/parser/moshi/JsonReader;F)Ljava/lang/Object;

    move-result-object v18

    .line 186
    move-object/from16 v11, v16

    move-object/from16 v15, v20

    goto/16 :goto_0

    .line 182
    .end local v17    # "interpolator":Landroid/view/animation/Interpolator;
    .end local v19    # "xInterpolator":Landroid/view/animation/Interpolator;
    .end local v20    # "yInterpolator":Landroid/view/animation/Interpolator;
    .end local v24    # "hold":Z
    .end local v25    # "pathCp2":Landroid/graphics/PointF;
    .restart local v9    # "pathCp1":Landroid/graphics/PointF;
    .restart local v10    # "pathCp2":Landroid/graphics/PointF;
    .restart local v12    # "hold":Z
    .restart local v13    # "interpolator":Landroid/view/animation/Interpolator;
    .restart local v14    # "xInterpolator":Landroid/view/animation/Interpolator;
    .local v15, "yInterpolator":Landroid/view/animation/Interpolator;
    :pswitch_b
    move-object/from16 v25, v10

    move/from16 v24, v12

    move-object/from16 v17, v13

    move-object/from16 v19, v14

    move-object/from16 v20, v15

    move-object v15, v9

    .end local v9    # "pathCp1":Landroid/graphics/PointF;
    .end local v10    # "pathCp2":Landroid/graphics/PointF;
    .end local v12    # "hold":Z
    .end local v13    # "interpolator":Landroid/view/animation/Interpolator;
    .end local v14    # "xInterpolator":Landroid/view/animation/Interpolator;
    .local v15, "pathCp1":Landroid/graphics/PointF;
    .restart local v17    # "interpolator":Landroid/view/animation/Interpolator;
    .restart local v19    # "xInterpolator":Landroid/view/animation/Interpolator;
    .restart local v20    # "yInterpolator":Landroid/view/animation/Interpolator;
    .restart local v24    # "hold":Z
    .restart local v25    # "pathCp2":Landroid/graphics/PointF;
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->nextDouble()D

    move-result-wide v9

    double-to-float v9, v9

    .line 183
    .end local v21    # "startFrame":F
    .local v9, "startFrame":F
    move/from16 v21, v9

    move-object v9, v15

    move-object/from16 v11, v16

    move-object/from16 v15, v20

    move-object/from16 v10, v25

    goto/16 :goto_0

    .line 303
    .end local v16    # "endValue":Ljava/lang/Object;, "TT;"
    .end local v17    # "interpolator":Landroid/view/animation/Interpolator;
    .end local v19    # "xInterpolator":Landroid/view/animation/Interpolator;
    .end local v20    # "yInterpolator":Landroid/view/animation/Interpolator;
    .end local v24    # "hold":Z
    .end local v25    # "pathCp2":Landroid/graphics/PointF;
    .local v9, "pathCp1":Landroid/graphics/PointF;
    .restart local v10    # "pathCp2":Landroid/graphics/PointF;
    .restart local v11    # "endValue":Ljava/lang/Object;, "TT;"
    .restart local v12    # "hold":Z
    .restart local v13    # "interpolator":Landroid/view/animation/Interpolator;
    .restart local v14    # "xInterpolator":Landroid/view/animation/Interpolator;
    .local v15, "yInterpolator":Landroid/view/animation/Interpolator;
    .restart local v21    # "startFrame":F
    :cond_d
    move-object/from16 v25, v10

    move-object/from16 v16, v11

    move/from16 v24, v12

    move-object/from16 v17, v13

    move-object/from16 v19, v14

    move-object/from16 v20, v15

    move-object v15, v9

    .end local v9    # "pathCp1":Landroid/graphics/PointF;
    .end local v10    # "pathCp2":Landroid/graphics/PointF;
    .end local v11    # "endValue":Ljava/lang/Object;, "TT;"
    .end local v12    # "hold":Z
    .end local v13    # "interpolator":Landroid/view/animation/Interpolator;
    .end local v14    # "xInterpolator":Landroid/view/animation/Interpolator;
    .local v15, "pathCp1":Landroid/graphics/PointF;
    .restart local v16    # "endValue":Ljava/lang/Object;, "TT;"
    .restart local v17    # "interpolator":Landroid/view/animation/Interpolator;
    .restart local v19    # "xInterpolator":Landroid/view/animation/Interpolator;
    .restart local v20    # "yInterpolator":Landroid/view/animation/Interpolator;
    .restart local v24    # "hold":Z
    .restart local v25    # "pathCp2":Landroid/graphics/PointF;
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->endObject()V

    .line 305
    if-eqz v24, :cond_e

    .line 306
    move-object/from16 v11, v18

    .line 308
    .end local v16    # "endValue":Ljava/lang/Object;, "TT;"
    .restart local v11    # "endValue":Ljava/lang/Object;, "TT;"
    sget-object v13, Lcom/airbnb/lottie/parser/KeyframeParser;->LINEAR_INTERPOLATOR:Landroid/view/animation/Interpolator;

    move/from16 v22, v21

    move-object/from16 v21, v20

    move-object/from16 v20, v19

    move-object/from16 v19, v11

    .end local v17    # "interpolator":Landroid/view/animation/Interpolator;
    .restart local v13    # "interpolator":Landroid/view/animation/Interpolator;
    goto :goto_8

    .line 309
    .end local v11    # "endValue":Ljava/lang/Object;, "TT;"
    .end local v13    # "interpolator":Landroid/view/animation/Interpolator;
    .restart local v16    # "endValue":Ljava/lang/Object;, "TT;"
    .restart local v17    # "interpolator":Landroid/view/animation/Interpolator;
    :cond_e
    if-eqz v3, :cond_f

    if-eqz v4, :cond_f

    .line 310
    invoke-static {v3, v4}, Lcom/airbnb/lottie/parser/KeyframeParser;->interpolatorFor(Landroid/graphics/PointF;Landroid/graphics/PointF;)Landroid/view/animation/Interpolator;

    move-result-object v13

    move/from16 v22, v21

    move-object/from16 v21, v20

    move-object/from16 v20, v19

    move-object/from16 v19, v16

    .end local v17    # "interpolator":Landroid/view/animation/Interpolator;
    .restart local v13    # "interpolator":Landroid/view/animation/Interpolator;
    goto :goto_8

    .line 311
    .end local v13    # "interpolator":Landroid/view/animation/Interpolator;
    .restart local v17    # "interpolator":Landroid/view/animation/Interpolator;
    :cond_f
    if-eqz v5, :cond_10

    if-eqz v7, :cond_10

    if-eqz v6, :cond_10

    if-eqz v8, :cond_10

    .line 312
    invoke-static {v5, v6}, Lcom/airbnb/lottie/parser/KeyframeParser;->interpolatorFor(Landroid/graphics/PointF;Landroid/graphics/PointF;)Landroid/view/animation/Interpolator;

    move-result-object v14

    .line 313
    .end local v19    # "xInterpolator":Landroid/view/animation/Interpolator;
    .restart local v14    # "xInterpolator":Landroid/view/animation/Interpolator;
    invoke-static {v7, v8}, Lcom/airbnb/lottie/parser/KeyframeParser;->interpolatorFor(Landroid/graphics/PointF;Landroid/graphics/PointF;)Landroid/view/animation/Interpolator;

    move-result-object v9

    move-object/from16 v20, v14

    move-object/from16 v19, v16

    move-object/from16 v13, v17

    move/from16 v22, v21

    move-object/from16 v21, v9

    .end local v20    # "yInterpolator":Landroid/view/animation/Interpolator;
    .local v9, "yInterpolator":Landroid/view/animation/Interpolator;
    goto :goto_8

    .line 315
    .end local v9    # "yInterpolator":Landroid/view/animation/Interpolator;
    .end local v14    # "xInterpolator":Landroid/view/animation/Interpolator;
    .restart local v19    # "xInterpolator":Landroid/view/animation/Interpolator;
    .restart local v20    # "yInterpolator":Landroid/view/animation/Interpolator;
    :cond_10
    sget-object v13, Lcom/airbnb/lottie/parser/KeyframeParser;->LINEAR_INTERPOLATOR:Landroid/view/animation/Interpolator;

    move/from16 v22, v21

    move-object/from16 v21, v20

    move-object/from16 v20, v19

    move-object/from16 v19, v16

    .line 319
    .end local v16    # "endValue":Ljava/lang/Object;, "TT;"
    .end local v17    # "interpolator":Landroid/view/animation/Interpolator;
    .restart local v13    # "interpolator":Landroid/view/animation/Interpolator;
    .local v19, "endValue":Ljava/lang/Object;, "TT;"
    .local v20, "xInterpolator":Landroid/view/animation/Interpolator;
    .local v21, "yInterpolator":Landroid/view/animation/Interpolator;
    .local v22, "startFrame":F
    :goto_8
    if-eqz v20, :cond_11

    if-eqz v21, :cond_11

    .line 320
    new-instance v16, Lcom/airbnb/lottie/value/Keyframe;

    const/16 v23, 0x0

    move-object/from16 v17, p0

    invoke-direct/range {v16 .. v23}, Lcom/airbnb/lottie/value/Keyframe;-><init>(Lcom/airbnb/lottie/LottieComposition;Ljava/lang/Object;Ljava/lang/Object;Landroid/view/animation/Interpolator;Landroid/view/animation/Interpolator;FLjava/lang/Float;)V

    move-object/from16 v14, v20

    move-object/from16 v9, v21

    .end local v20    # "xInterpolator":Landroid/view/animation/Interpolator;
    .end local v21    # "yInterpolator":Landroid/view/animation/Interpolator;
    .restart local v9    # "yInterpolator":Landroid/view/animation/Interpolator;
    .restart local v14    # "xInterpolator":Landroid/view/animation/Interpolator;
    move-object/from16 v20, v13

    move-object/from16 v10, v16

    .local v16, "keyframe":Lcom/airbnb/lottie/value/Keyframe;, "Lcom/airbnb/lottie/value/Keyframe<TT;>;"
    goto :goto_9

    .line 319
    .end local v9    # "yInterpolator":Landroid/view/animation/Interpolator;
    .end local v14    # "xInterpolator":Landroid/view/animation/Interpolator;
    .end local v16    # "keyframe":Lcom/airbnb/lottie/value/Keyframe;, "Lcom/airbnb/lottie/value/Keyframe<TT;>;"
    .restart local v20    # "xInterpolator":Landroid/view/animation/Interpolator;
    .restart local v21    # "yInterpolator":Landroid/view/animation/Interpolator;
    :cond_11
    move-object/from16 v14, v20

    move-object/from16 v9, v21

    .line 322
    .end local v20    # "xInterpolator":Landroid/view/animation/Interpolator;
    .end local v21    # "yInterpolator":Landroid/view/animation/Interpolator;
    .restart local v9    # "yInterpolator":Landroid/view/animation/Interpolator;
    .restart local v14    # "xInterpolator":Landroid/view/animation/Interpolator;
    new-instance v16, Lcom/airbnb/lottie/value/Keyframe;

    move/from16 v21, v22

    .end local v22    # "startFrame":F
    .local v21, "startFrame":F
    const/16 v22, 0x0

    move-object/from16 v17, p0

    move-object/from16 v20, v13

    .end local v13    # "interpolator":Landroid/view/animation/Interpolator;
    .local v20, "interpolator":Landroid/view/animation/Interpolator;
    invoke-direct/range {v16 .. v22}, Lcom/airbnb/lottie/value/Keyframe;-><init>(Lcom/airbnb/lottie/LottieComposition;Ljava/lang/Object;Ljava/lang/Object;Landroid/view/animation/Interpolator;FLjava/lang/Float;)V

    move/from16 v22, v21

    .end local v21    # "startFrame":F
    .restart local v22    # "startFrame":F
    move-object/from16 v10, v16

    .line 325
    .local v10, "keyframe":Lcom/airbnb/lottie/value/Keyframe;, "Lcom/airbnb/lottie/value/Keyframe<TT;>;"
    :goto_9
    iput-object v15, v10, Lcom/airbnb/lottie/value/Keyframe;->pathCp1:Landroid/graphics/PointF;

    .line 326
    move-object/from16 v11, v25

    .end local v25    # "pathCp2":Landroid/graphics/PointF;
    .local v11, "pathCp2":Landroid/graphics/PointF;
    iput-object v11, v10, Lcom/airbnb/lottie/value/Keyframe;->pathCp2:Landroid/graphics/PointF;

    .line 327
    return-object v10

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_6
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x0
        :pswitch_8
        :pswitch_7
    .end packed-switch
.end method

.method private static parseStaticValue(Lcom/airbnb/lottie/parser/moshi/JsonReader;FLcom/airbnb/lottie/parser/ValueParser;)Lcom/airbnb/lottie/value/Keyframe;
    .locals 2
    .param p0, "reader"    # Lcom/airbnb/lottie/parser/moshi/JsonReader;
    .param p1, "scale"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/airbnb/lottie/parser/moshi/JsonReader;",
            "F",
            "Lcom/airbnb/lottie/parser/ValueParser<",
            "TT;>;)",
            "Lcom/airbnb/lottie/value/Keyframe<",
            "TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 371
    .local p2, "valueParser":Lcom/airbnb/lottie/parser/ValueParser;, "Lcom/airbnb/lottie/parser/ValueParser<TT;>;"
    invoke-interface {p2, p0, p1}, Lcom/airbnb/lottie/parser/ValueParser;->parse(Lcom/airbnb/lottie/parser/moshi/JsonReader;F)Ljava/lang/Object;

    move-result-object v0

    .line 372
    .local v0, "value":Ljava/lang/Object;, "TT;"
    new-instance v1, Lcom/airbnb/lottie/value/Keyframe;

    invoke-direct {v1, v0}, Lcom/airbnb/lottie/value/Keyframe;-><init>(Ljava/lang/Object;)V

    return-object v1
.end method

.method private static pathInterpolatorCache()Landroidx/collection/SparseArrayCompat;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/collection/SparseArrayCompat<",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/animation/Interpolator;",
            ">;>;"
        }
    .end annotation

    .line 49
    sget-object v0, Lcom/airbnb/lottie/parser/KeyframeParser;->pathInterpolatorCache:Landroidx/collection/SparseArrayCompat;

    if-nez v0, :cond_0

    .line 50
    new-instance v0, Landroidx/collection/SparseArrayCompat;

    invoke-direct {v0}, Landroidx/collection/SparseArrayCompat;-><init>()V

    sput-object v0, Lcom/airbnb/lottie/parser/KeyframeParser;->pathInterpolatorCache:Landroidx/collection/SparseArrayCompat;

    .line 52
    :cond_0
    sget-object v0, Lcom/airbnb/lottie/parser/KeyframeParser;->pathInterpolatorCache:Landroidx/collection/SparseArrayCompat;

    return-object v0
.end method

.method private static putInterpolator(ILjava/lang/ref/WeakReference;)V
    .locals 2
    .param p0, "hash"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/animation/Interpolator;",
            ">;)V"
        }
    .end annotation

    .line 67
    .local p1, "interpolator":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/view/animation/Interpolator;>;"
    const-class v0, Lcom/airbnb/lottie/parser/KeyframeParser;

    monitor-enter v0

    .line 68
    :try_start_0
    sget-object v1, Lcom/airbnb/lottie/parser/KeyframeParser;->pathInterpolatorCache:Landroidx/collection/SparseArrayCompat;

    invoke-virtual {v1, p0, p1}, Landroidx/collection/SparseArrayCompat;->put(ILjava/lang/Object;)V

    .line 69
    monitor-exit v0

    .line 70
    return-void

    .line 69
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
