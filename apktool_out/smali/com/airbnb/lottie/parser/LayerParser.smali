.class public Lcom/airbnb/lottie/parser/LayerParser;
.super Ljava/lang/Object;
.source "LayerParser.java"


# static fields
.field private static final EFFECTS_NAMES:Lcom/airbnb/lottie/parser/moshi/JsonReader$Options;

.field private static final NAMES:Lcom/airbnb/lottie/parser/moshi/JsonReader$Options;

.field private static final TEXT_NAMES:Lcom/airbnb/lottie/parser/moshi/JsonReader$Options;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 30
    const/16 v0, 0x19

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "nm"

    aput-object v2, v0, v1

    const-string v3, "ind"

    const/4 v4, 0x1

    aput-object v3, v0, v4

    const-string v3, "refId"

    const/4 v5, 0x2

    aput-object v3, v0, v5

    const/4 v3, 0x3

    const-string/jumbo v6, "ty"

    aput-object v6, v0, v3

    const/4 v3, 0x4

    const-string v7, "parent"

    aput-object v7, v0, v3

    const/4 v3, 0x5

    const-string/jumbo v7, "sw"

    aput-object v7, v0, v3

    const/4 v3, 0x6

    const-string/jumbo v7, "sh"

    aput-object v7, v0, v3

    const/4 v3, 0x7

    const-string v7, "sc"

    aput-object v7, v0, v3

    const/16 v3, 0x8

    const-string v7, "ks"

    aput-object v7, v0, v3

    const/16 v3, 0x9

    const-string/jumbo v7, "tt"

    aput-object v7, v0, v3

    const/16 v3, 0xa

    const-string v7, "masksProperties"

    aput-object v7, v0, v3

    const/16 v3, 0xb

    const-string/jumbo v7, "shapes"

    aput-object v7, v0, v3

    const/16 v3, 0xc

    const-string/jumbo v7, "t"

    aput-object v7, v0, v3

    const/16 v3, 0xd

    const-string v7, "ef"

    aput-object v7, v0, v3

    const/16 v3, 0xe

    const-string/jumbo v7, "sr"

    aput-object v7, v0, v3

    const/16 v3, 0xf

    const-string/jumbo v7, "st"

    aput-object v7, v0, v3

    const/16 v3, 0x10

    const-string/jumbo v7, "w"

    aput-object v7, v0, v3

    const/16 v3, 0x11

    const-string v7, "h"

    aput-object v7, v0, v3

    const/16 v3, 0x12

    const-string v7, "ip"

    aput-object v7, v0, v3

    const/16 v3, 0x13

    const-string v7, "op"

    aput-object v7, v0, v3

    const/16 v3, 0x14

    const-string/jumbo v7, "tm"

    aput-object v7, v0, v3

    const/16 v3, 0x15

    const-string v7, "cl"

    aput-object v7, v0, v3

    const/16 v3, 0x16

    const-string v7, "hd"

    aput-object v7, v0, v3

    const/16 v3, 0x17

    const-string v7, "ao"

    aput-object v7, v0, v3

    const/16 v3, 0x18

    const-string v7, "bm"

    aput-object v7, v0, v3

    invoke-static {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader$Options;->of([Ljava/lang/String;)Lcom/airbnb/lottie/parser/moshi/JsonReader$Options;

    move-result-object v0

    sput-object v0, Lcom/airbnb/lottie/parser/LayerParser;->NAMES:Lcom/airbnb/lottie/parser/moshi/JsonReader$Options;

    .line 69
    new-array v0, v5, [Ljava/lang/String;

    const-string v3, "d"

    aput-object v3, v0, v1

    const-string v3, "a"

    aput-object v3, v0, v4

    invoke-static {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader$Options;->of([Ljava/lang/String;)Lcom/airbnb/lottie/parser/moshi/JsonReader$Options;

    move-result-object v0

    sput-object v0, Lcom/airbnb/lottie/parser/LayerParser;->TEXT_NAMES:Lcom/airbnb/lottie/parser/moshi/JsonReader$Options;

    .line 74
    new-array v0, v5, [Ljava/lang/String;

    aput-object v6, v0, v1

    aput-object v2, v0, v4

    invoke-static {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader$Options;->of([Ljava/lang/String;)Lcom/airbnb/lottie/parser/moshi/JsonReader$Options;

    move-result-object v0

    sput-object v0, Lcom/airbnb/lottie/parser/LayerParser;->EFFECTS_NAMES:Lcom/airbnb/lottie/parser/moshi/JsonReader$Options;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    return-void
.end method

.method public static parse(Lcom/airbnb/lottie/LottieComposition;)Lcom/airbnb/lottie/model/layer/Layer;
    .locals 29
    .param p0, "composition"    # Lcom/airbnb/lottie/LottieComposition;

    .line 59
    invoke-virtual/range {p0 .. p0}, Lcom/airbnb/lottie/LottieComposition;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    .line 60
    .local v0, "bounds":Landroid/graphics/Rect;
    new-instance v1, Lcom/airbnb/lottie/model/layer/Layer;

    .line 61
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v2

    sget-object v7, Lcom/airbnb/lottie/model/layer/Layer$LayerType;->PRE_COMP:Lcom/airbnb/lottie/model/layer/Layer$LayerType;

    .line 62
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v11

    new-instance v12, Lcom/airbnb/lottie/model/animatable/AnimatableTransform;

    invoke-direct {v12}, Lcom/airbnb/lottie/model/animatable/AnimatableTransform;-><init>()V

    .line 64
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v4

    int-to-float v4, v4

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v22

    sget-object v23, Lcom/airbnb/lottie/model/layer/Layer$MatteType;->NONE:Lcom/airbnb/lottie/model/layer/Layer$MatteType;

    const/16 v27, 0x0

    sget-object v28, Lcom/airbnb/lottie/model/content/LBlendMode;->NORMAL:Lcom/airbnb/lottie/model/content/LBlendMode;

    move/from16 v19, v4

    const-string v4, "__container"

    const-wide/16 v5, -0x1

    const-wide/16 v8, -0x1

    const/4 v10, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x0

    move/from16 v18, v3

    move-object/from16 v3, p0

    invoke-direct/range {v1 .. v28}, Lcom/airbnb/lottie/model/layer/Layer;-><init>(Ljava/util/List;Lcom/airbnb/lottie/LottieComposition;Ljava/lang/String;JLcom/airbnb/lottie/model/layer/Layer$LayerType;JLjava/lang/String;Ljava/util/List;Lcom/airbnb/lottie/model/animatable/AnimatableTransform;IIIFFFFLcom/airbnb/lottie/model/animatable/AnimatableTextFrame;Lcom/airbnb/lottie/model/animatable/AnimatableTextProperties;Ljava/util/List;Lcom/airbnb/lottie/model/layer/Layer$MatteType;Lcom/airbnb/lottie/model/animatable/AnimatableFloatValue;ZLcom/airbnb/lottie/model/content/BlurEffect;Lcom/airbnb/lottie/parser/DropShadowEffect;Lcom/airbnb/lottie/model/content/LBlendMode;)V

    .line 60
    return-object v1
.end method

.method public static parse(Lcom/airbnb/lottie/parser/moshi/JsonReader;Lcom/airbnb/lottie/LottieComposition;)Lcom/airbnb/lottie/model/layer/Layer;
    .locals 41
    .param p0, "reader"    # Lcom/airbnb/lottie/parser/moshi/JsonReader;
    .param p1, "composition"    # Lcom/airbnb/lottie/LottieComposition;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 82
    move-object/from16 v0, p0

    move-object/from16 v2, p1

    const-string v1, "UNSET"

    .line 83
    .local v1, "layerName":Ljava/lang/String;
    const/4 v3, 0x0

    .line 84
    .local v3, "layerType":Lcom/airbnb/lottie/model/layer/Layer$LayerType;
    const/4 v4, 0x0

    .line 85
    .local v4, "refId":Ljava/lang/String;
    const-wide/16 v5, 0x0

    .line 86
    .local v5, "layerId":J
    const/4 v7, 0x0

    .line 87
    .local v7, "solidWidth":I
    const/4 v8, 0x0

    .line 88
    .local v8, "solidHeight":I
    const/4 v9, 0x0

    .line 89
    .local v9, "solidColor":I
    const/4 v10, 0x0

    .line 90
    .local v10, "preCompWidth":F
    const/4 v11, 0x0

    .line 91
    .local v11, "preCompHeight":F
    const-wide/16 v12, -0x1

    .line 92
    .local v12, "parentId":J
    const/high16 v14, 0x3f800000    # 1.0f

    .line 93
    .local v14, "timeStretch":F
    const/4 v15, 0x0

    .line 94
    .local v15, "startFrame":F
    const/16 v16, 0x0

    .line 95
    .local v16, "inFrame":F
    const/16 v17, 0x0

    .line 96
    .local v17, "outFrame":F
    const/16 v18, 0x0

    .line 97
    .local v18, "cl":Ljava/lang/String;
    const/16 v19, 0x0

    .line 98
    .local v19, "hidden":Z
    const/16 v20, 0x0

    .line 99
    .local v20, "blurEffect":Lcom/airbnb/lottie/model/content/BlurEffect;
    const/16 v21, 0x0

    .line 100
    .local v21, "dropShadowEffect":Lcom/airbnb/lottie/parser/DropShadowEffect;
    const/16 v22, 0x0

    .line 102
    .local v22, "autoOrient":Z
    sget-object v23, Lcom/airbnb/lottie/model/layer/Layer$MatteType;->NONE:Lcom/airbnb/lottie/model/layer/Layer$MatteType;

    .line 103
    .local v23, "matteType":Lcom/airbnb/lottie/model/layer/Layer$MatteType;
    sget-object v24, Lcom/airbnb/lottie/model/content/LBlendMode;->NORMAL:Lcom/airbnb/lottie/model/content/LBlendMode;

    .line 104
    .local v24, "blendMode":Lcom/airbnb/lottie/model/content/LBlendMode;
    const/16 v25, 0x0

    .line 105
    .local v25, "transform":Lcom/airbnb/lottie/model/animatable/AnimatableTransform;
    const/16 v26, 0x0

    .line 106
    .local v26, "text":Lcom/airbnb/lottie/model/animatable/AnimatableTextFrame;
    const/16 v27, 0x0

    .line 107
    .local v27, "textProperties":Lcom/airbnb/lottie/model/animatable/AnimatableTextProperties;
    const/16 v28, 0x0

    .line 109
    .local v28, "timeRemapping":Lcom/airbnb/lottie/model/animatable/AnimatableFloatValue;
    new-instance v29, Ljava/util/ArrayList;

    invoke-direct/range {v29 .. v29}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v30, v29

    .line 110
    .local v30, "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    new-instance v29, Ljava/util/ArrayList;

    invoke-direct/range {v29 .. v29}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v31, v29

    .line 112
    .local v31, "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->beginObject()V

    move-object/from16 v29, v25

    move-object/from16 v32, v26

    move-object/from16 v33, v27

    move-object/from16 v34, v28

    move/from16 v25, v19

    move-object/from16 v26, v20

    move-object/from16 v27, v21

    move-object/from16 v28, v24

    move/from16 v19, v11

    move/from16 v20, v14

    move/from16 v21, v15

    move-object/from16 v24, v23

    move v14, v8

    move v15, v9

    move/from16 v23, v17

    move-object v8, v1

    move-object v9, v3

    move-object/from16 v1, v18

    move/from16 v3, v22

    move/from16 v18, v10

    move/from16 v22, v16

    move-object v10, v4

    move-wide/from16 v16, v12

    move-wide v11, v5

    move v13, v7

    .line 113
    .end local v4    # "refId":Ljava/lang/String;
    .end local v5    # "layerId":J
    .end local v7    # "solidWidth":I
    .end local v12    # "parentId":J
    .end local v17    # "outFrame":F
    .local v1, "cl":Ljava/lang/String;
    .local v3, "autoOrient":Z
    .local v8, "layerName":Ljava/lang/String;
    .local v9, "layerType":Lcom/airbnb/lottie/model/layer/Layer$LayerType;
    .local v10, "refId":Ljava/lang/String;
    .local v11, "layerId":J
    .local v13, "solidWidth":I
    .local v14, "solidHeight":I
    .local v15, "solidColor":I
    .local v16, "parentId":J
    .local v18, "preCompWidth":F
    .local v19, "preCompHeight":F
    .local v20, "timeStretch":F
    .local v21, "startFrame":F
    .local v22, "inFrame":F
    .local v23, "outFrame":F
    .local v24, "matteType":Lcom/airbnb/lottie/model/layer/Layer$MatteType;
    .local v25, "hidden":Z
    .local v26, "blurEffect":Lcom/airbnb/lottie/model/content/BlurEffect;
    .local v27, "dropShadowEffect":Lcom/airbnb/lottie/parser/DropShadowEffect;
    .local v28, "blendMode":Lcom/airbnb/lottie/model/content/LBlendMode;
    .local v29, "transform":Lcom/airbnb/lottie/model/animatable/AnimatableTransform;
    .local v32, "text":Lcom/airbnb/lottie/model/animatable/AnimatableTextFrame;
    .local v33, "textProperties":Lcom/airbnb/lottie/model/animatable/AnimatableTextProperties;
    .local v34, "timeRemapping":Lcom/airbnb/lottie/model/animatable/AnimatableFloatValue;
    :goto_0
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_e

    .line 114
    sget-object v4, Lcom/airbnb/lottie/parser/LayerParser;->NAMES:Lcom/airbnb/lottie/parser/moshi/JsonReader$Options;

    invoke-virtual {v0, v4}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->selectName(Lcom/airbnb/lottie/parser/moshi/JsonReader$Options;)I

    move-result v4

    const/4 v5, 0x0

    const/4 v6, 0x1

    packed-switch v4, :pswitch_data_0

    .line 278
    move-object v4, v1

    move-object/from16 v7, v30

    move-object/from16 v5, v31

    .end local v1    # "cl":Ljava/lang/String;
    .end local v30    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    .end local v31    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    .local v4, "cl":Ljava/lang/String;
    .local v5, "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    .local v7, "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    invoke-virtual/range {p0 .. p0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->skipName()V

    .line 279
    invoke-virtual/range {p0 .. p0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->skipValue()V

    goto/16 :goto_9

    .line 269
    .end local v4    # "cl":Ljava/lang/String;
    .end local v5    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    .end local v7    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    .restart local v1    # "cl":Ljava/lang/String;
    .restart local v30    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    .restart local v31    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    :pswitch_0
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->nextInt()I

    move-result v4

    .line 270
    .local v4, "blendModeIndex":I
    invoke-static {}, Lcom/airbnb/lottie/model/content/LBlendMode;->values()[Lcom/airbnb/lottie/model/content/LBlendMode;

    move-result-object v5

    array-length v5, v5

    if-lt v4, v5, :cond_0

    .line 271
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unsupported Blend Mode: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Lcom/airbnb/lottie/LottieComposition;->addWarning(Ljava/lang/String;)V

    .line 272
    sget-object v28, Lcom/airbnb/lottie/model/content/LBlendMode;->NORMAL:Lcom/airbnb/lottie/model/content/LBlendMode;

    .line 273
    goto :goto_0

    .line 275
    :cond_0
    invoke-static {}, Lcom/airbnb/lottie/model/content/LBlendMode;->values()[Lcom/airbnb/lottie/model/content/LBlendMode;

    move-result-object v5

    aget-object v28, v5, v4

    .line 276
    goto :goto_0

    .line 266
    .end local v4    # "blendModeIndex":I
    :pswitch_1
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->nextInt()I

    move-result v4

    if-ne v4, v6, :cond_1

    move v5, v6

    :cond_1
    move v3, v5

    .line 267
    goto :goto_0

    .line 263
    :pswitch_2
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->nextBoolean()Z

    move-result v25

    .line 264
    goto :goto_0

    .line 260
    :pswitch_3
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->nextString()Ljava/lang/String;

    move-result-object v1

    .line 261
    goto :goto_0

    .line 257
    :pswitch_4
    invoke-static {v0, v2, v5}, Lcom/airbnb/lottie/parser/AnimatableValueParser;->parseFloat(Lcom/airbnb/lottie/parser/moshi/JsonReader;Lcom/airbnb/lottie/LottieComposition;Z)Lcom/airbnb/lottie/model/animatable/AnimatableFloatValue;

    move-result-object v34

    .line 258
    goto :goto_0

    .line 254
    :pswitch_5
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->nextDouble()D

    move-result-wide v4

    double-to-float v4, v4

    .line 255
    .end local v23    # "outFrame":F
    .local v4, "outFrame":F
    move/from16 v23, v4

    goto :goto_0

    .line 251
    .end local v4    # "outFrame":F
    .restart local v23    # "outFrame":F
    :pswitch_6
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->nextDouble()D

    move-result-wide v4

    double-to-float v4, v4

    .line 252
    .end local v22    # "inFrame":F
    .local v4, "inFrame":F
    move/from16 v22, v4

    goto :goto_0

    .line 248
    .end local v4    # "inFrame":F
    .restart local v22    # "inFrame":F
    :pswitch_7
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->nextDouble()D

    move-result-wide v4

    invoke-static {}, Lcom/airbnb/lottie/utils/Utils;->dpScale()F

    move-result v6

    float-to-double v6, v6

    mul-double/2addr v4, v6

    double-to-float v4, v4

    .line 249
    .end local v19    # "preCompHeight":F
    .local v4, "preCompHeight":F
    move/from16 v19, v4

    goto :goto_0

    .line 245
    .end local v4    # "preCompHeight":F
    .restart local v19    # "preCompHeight":F
    :pswitch_8
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->nextDouble()D

    move-result-wide v4

    invoke-static {}, Lcom/airbnb/lottie/utils/Utils;->dpScale()F

    move-result v6

    float-to-double v6, v6

    mul-double/2addr v4, v6

    double-to-float v4, v4

    .line 246
    .end local v18    # "preCompWidth":F
    .local v4, "preCompWidth":F
    move/from16 v18, v4

    goto/16 :goto_0

    .line 242
    .end local v4    # "preCompWidth":F
    .restart local v18    # "preCompWidth":F
    :pswitch_9
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->nextDouble()D

    move-result-wide v4

    double-to-float v4, v4

    .line 243
    .end local v21    # "startFrame":F
    .local v4, "startFrame":F
    move/from16 v21, v4

    goto/16 :goto_0

    .line 239
    .end local v4    # "startFrame":F
    .restart local v21    # "startFrame":F
    :pswitch_a
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->nextDouble()D

    move-result-wide v4

    double-to-float v4, v4

    .line 240
    .end local v20    # "timeStretch":F
    .local v4, "timeStretch":F
    move/from16 v20, v4

    goto/16 :goto_0

    .line 207
    .end local v4    # "timeStretch":F
    .restart local v20    # "timeStretch":F
    :pswitch_b
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->beginArray()V

    .line 208
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 209
    .local v4, "effectNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :goto_1
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_5

    .line 210
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->beginObject()V

    .line 211
    :cond_2
    :goto_2
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 212
    sget-object v5, Lcom/airbnb/lottie/parser/LayerParser;->EFFECTS_NAMES:Lcom/airbnb/lottie/parser/moshi/JsonReader$Options;

    invoke-virtual {v0, v5}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->selectName(Lcom/airbnb/lottie/parser/moshi/JsonReader$Options;)I

    move-result v5

    packed-switch v5, :pswitch_data_1

    .line 226
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->skipName()V

    .line 227
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->skipValue()V

    goto :goto_2

    .line 222
    :pswitch_c
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->nextString()Ljava/lang/String;

    move-result-object v5

    .line 223
    .local v5, "effectName":Ljava/lang/String;
    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 224
    goto :goto_2

    .line 214
    .end local v5    # "effectName":Ljava/lang/String;
    :pswitch_d
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->nextInt()I

    move-result v5

    .line 215
    .local v5, "type":I
    const/16 v6, 0x1d

    if-ne v5, v6, :cond_3

    .line 216
    invoke-static/range {p0 .. p1}, Lcom/airbnb/lottie/parser/BlurEffectParser;->parse(Lcom/airbnb/lottie/parser/moshi/JsonReader;Lcom/airbnb/lottie/LottieComposition;)Lcom/airbnb/lottie/model/content/BlurEffect;

    move-result-object v26

    goto :goto_2

    .line 217
    :cond_3
    const/16 v6, 0x19

    if-ne v5, v6, :cond_2

    .line 218
    new-instance v6, Lcom/airbnb/lottie/parser/DropShadowEffectParser;

    invoke-direct {v6}, Lcom/airbnb/lottie/parser/DropShadowEffectParser;-><init>()V

    invoke-virtual {v6, v0, v2}, Lcom/airbnb/lottie/parser/DropShadowEffectParser;->parse(Lcom/airbnb/lottie/parser/moshi/JsonReader;Lcom/airbnb/lottie/LottieComposition;)Lcom/airbnb/lottie/parser/DropShadowEffect;

    move-result-object v27

    goto :goto_2

    .line 231
    .end local v5    # "type":I
    :cond_4
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->endObject()V

    goto :goto_1

    .line 233
    :cond_5
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->endArray()V

    .line 234
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Lottie doesn\'t support layer effects. If you are using them for  fills, strokes, trim paths etc. then try adding them directly as contents  in your shape. Found: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Lcom/airbnb/lottie/LottieComposition;->addWarning(Ljava/lang/String;)V

    .line 237
    goto/16 :goto_0

    .line 183
    .end local v4    # "effectNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :pswitch_e
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->beginObject()V

    .line 184
    :goto_3
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_8

    .line 185
    sget-object v4, Lcom/airbnb/lottie/parser/LayerParser;->TEXT_NAMES:Lcom/airbnb/lottie/parser/moshi/JsonReader$Options;

    invoke-virtual {v0, v4}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->selectName(Lcom/airbnb/lottie/parser/moshi/JsonReader$Options;)I

    move-result v4

    packed-switch v4, :pswitch_data_2

    .line 200
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->skipName()V

    .line 201
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->skipValue()V

    goto :goto_3

    .line 190
    :pswitch_f
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->beginArray()V

    .line 191
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6

    .line 192
    invoke-static/range {p0 .. p1}, Lcom/airbnb/lottie/parser/AnimatableTextPropertiesParser;->parse(Lcom/airbnb/lottie/parser/moshi/JsonReader;Lcom/airbnb/lottie/LottieComposition;)Lcom/airbnb/lottie/model/animatable/AnimatableTextProperties;

    move-result-object v33

    .line 194
    :cond_6
    :goto_4
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_7

    .line 195
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->skipValue()V

    goto :goto_4

    .line 197
    :cond_7
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->endArray()V

    .line 198
    goto :goto_3

    .line 187
    :pswitch_10
    invoke-static/range {p0 .. p1}, Lcom/airbnb/lottie/parser/AnimatableValueParser;->parseDocumentData(Lcom/airbnb/lottie/parser/moshi/JsonReader;Lcom/airbnb/lottie/LottieComposition;)Lcom/airbnb/lottie/model/animatable/AnimatableTextFrame;

    move-result-object v32

    .line 188
    goto :goto_3

    .line 204
    :cond_8
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->endObject()V

    .line 205
    goto/16 :goto_0

    .line 173
    :pswitch_11
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->beginArray()V

    .line 174
    :goto_5
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_a

    .line 175
    invoke-static/range {p0 .. p1}, Lcom/airbnb/lottie/parser/ContentModelParser;->parse(Lcom/airbnb/lottie/parser/moshi/JsonReader;Lcom/airbnb/lottie/LottieComposition;)Lcom/airbnb/lottie/model/content/ContentModel;

    move-result-object v4

    .line 176
    .local v4, "shape":Lcom/airbnb/lottie/model/content/ContentModel;
    if-eqz v4, :cond_9

    .line 177
    move-object/from16 v5, v31

    .end local v31    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    .local v5, "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    invoke-interface {v5, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_6

    .line 176
    .end local v5    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    .restart local v31    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    :cond_9
    move-object/from16 v5, v31

    .line 179
    .end local v4    # "shape":Lcom/airbnb/lottie/model/content/ContentModel;
    .end local v31    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    .restart local v5    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    :goto_6
    move-object/from16 v31, v5

    goto :goto_5

    .line 180
    .end local v5    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    .restart local v31    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    :cond_a
    move-object/from16 v5, v31

    .end local v31    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    .restart local v5    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->endArray()V

    .line 181
    move-object v4, v1

    move-object/from16 v7, v30

    goto/16 :goto_9

    .line 165
    .end local v5    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    .restart local v31    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    :pswitch_12
    move-object/from16 v5, v31

    .end local v31    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    .restart local v5    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->beginArray()V

    .line 166
    :goto_7
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_b

    .line 167
    invoke-static/range {p0 .. p1}, Lcom/airbnb/lottie/parser/MaskParser;->parse(Lcom/airbnb/lottie/parser/moshi/JsonReader;Lcom/airbnb/lottie/LottieComposition;)Lcom/airbnb/lottie/model/content/Mask;

    move-result-object v4

    move-object/from16 v7, v30

    .end local v30    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    .restart local v7    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    invoke-interface {v7, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_7

    .line 169
    .end local v7    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    .restart local v30    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    :cond_b
    move-object/from16 v7, v30

    .end local v30    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    .restart local v7    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v4

    invoke-virtual {v2, v4}, Lcom/airbnb/lottie/LottieComposition;->incrementMatteOrMaskCount(I)V

    .line 170
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->endArray()V

    .line 171
    move-object v4, v1

    goto/16 :goto_9

    .line 148
    .end local v5    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    .end local v7    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    .restart local v30    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    .restart local v31    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    :pswitch_13
    move-object/from16 v7, v30

    move-object/from16 v5, v31

    .end local v30    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    .end local v31    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    .restart local v5    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    .restart local v7    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    invoke-virtual {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->nextInt()I

    move-result v4

    .line 149
    .local v4, "matteTypeIndex":I
    invoke-static {}, Lcom/airbnb/lottie/model/layer/Layer$MatteType;->values()[Lcom/airbnb/lottie/model/layer/Layer$MatteType;

    move-result-object v6

    array-length v6, v6

    if-lt v4, v6, :cond_c

    .line 150
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Unsupported matte type: "

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Lcom/airbnb/lottie/LottieComposition;->addWarning(Ljava/lang/String;)V

    .line 151
    move-object v4, v1

    goto/16 :goto_9

    .line 153
    :cond_c
    invoke-static {}, Lcom/airbnb/lottie/model/layer/Layer$MatteType;->values()[Lcom/airbnb/lottie/model/layer/Layer$MatteType;

    move-result-object v0

    aget-object v24, v0, v4

    .line 154
    sget-object v0, Lcom/airbnb/lottie/parser/LayerParser$1;->$SwitchMap$com$airbnb$lottie$model$layer$Layer$MatteType:[I

    invoke-virtual/range {v24 .. v24}, Lcom/airbnb/lottie/model/layer/Layer$MatteType;->ordinal()I

    move-result v6

    aget v0, v0, v6

    packed-switch v0, :pswitch_data_3

    goto :goto_8

    .line 159
    :pswitch_14
    const-string v0, "Unsupported matte type: Luma Inverted"

    invoke-virtual {v2, v0}, Lcom/airbnb/lottie/LottieComposition;->addWarning(Ljava/lang/String;)V

    goto :goto_8

    .line 156
    :pswitch_15
    const-string v0, "Unsupported matte type: Luma"

    invoke-virtual {v2, v0}, Lcom/airbnb/lottie/LottieComposition;->addWarning(Ljava/lang/String;)V

    .line 157
    nop

    .line 162
    :goto_8
    const/4 v0, 0x1

    invoke-virtual {v2, v0}, Lcom/airbnb/lottie/LottieComposition;->incrementMatteOrMaskCount(I)V

    .line 163
    move-object/from16 v0, p0

    move-object/from16 v31, v5

    move-object/from16 v30, v7

    goto/16 :goto_0

    .line 145
    .end local v4    # "matteTypeIndex":I
    .end local v5    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    .end local v7    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    .restart local v30    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    .restart local v31    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    :pswitch_16
    move-object/from16 v7, v30

    move-object/from16 v5, v31

    .end local v30    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    .end local v31    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    .restart local v5    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    .restart local v7    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    invoke-static/range {p0 .. p1}, Lcom/airbnb/lottie/parser/AnimatableTransformParser;->parse(Lcom/airbnb/lottie/parser/moshi/JsonReader;Lcom/airbnb/lottie/LottieComposition;)Lcom/airbnb/lottie/model/animatable/AnimatableTransform;

    move-result-object v29

    .line 146
    move-object/from16 v0, p0

    goto/16 :goto_0

    .line 142
    .end local v5    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    .end local v7    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    .restart local v30    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    .restart local v31    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    :pswitch_17
    move-object/from16 v7, v30

    move-object/from16 v5, v31

    .end local v30    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    .end local v31    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    .restart local v5    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    .restart local v7    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    invoke-virtual/range {p0 .. p0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->nextString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v15

    .line 143
    move-object/from16 v0, p0

    goto/16 :goto_0

    .line 139
    .end local v5    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    .end local v7    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    .restart local v30    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    .restart local v31    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    :pswitch_18
    move-object/from16 v7, v30

    move-object/from16 v5, v31

    .end local v30    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    .end local v31    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    .restart local v5    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    .restart local v7    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    invoke-virtual/range {p0 .. p0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->nextInt()I

    move-result v0

    int-to-float v0, v0

    invoke-static {}, Lcom/airbnb/lottie/utils/Utils;->dpScale()F

    move-result v4

    mul-float/2addr v0, v4

    float-to-int v14, v0

    .line 140
    move-object/from16 v0, p0

    goto/16 :goto_0

    .line 136
    .end local v5    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    .end local v7    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    .restart local v30    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    .restart local v31    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    :pswitch_19
    move-object/from16 v7, v30

    move-object/from16 v5, v31

    .end local v30    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    .end local v31    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    .restart local v5    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    .restart local v7    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    invoke-virtual/range {p0 .. p0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->nextInt()I

    move-result v0

    int-to-float v0, v0

    invoke-static {}, Lcom/airbnb/lottie/utils/Utils;->dpScale()F

    move-result v4

    mul-float/2addr v0, v4

    float-to-int v13, v0

    .line 137
    move-object/from16 v0, p0

    goto/16 :goto_0

    .line 133
    .end local v5    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    .end local v7    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    .restart local v30    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    .restart local v31    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    :pswitch_1a
    move-object/from16 v7, v30

    move-object/from16 v5, v31

    .end local v30    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    .end local v31    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    .restart local v5    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    .restart local v7    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    invoke-virtual/range {p0 .. p0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->nextInt()I

    move-result v0

    move-object v4, v1

    .end local v1    # "cl":Ljava/lang/String;
    .local v4, "cl":Ljava/lang/String;
    int-to-long v0, v0

    .line 134
    .end local v16    # "parentId":J
    .local v0, "parentId":J
    move-wide/from16 v16, v0

    move-object v1, v4

    move-object/from16 v0, p0

    goto/16 :goto_0

    .line 125
    .end local v0    # "parentId":J
    .end local v4    # "cl":Ljava/lang/String;
    .end local v5    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    .end local v7    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    .restart local v1    # "cl":Ljava/lang/String;
    .restart local v16    # "parentId":J
    .restart local v30    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    .restart local v31    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    :pswitch_1b
    move-object v4, v1

    move-object/from16 v7, v30

    move-object/from16 v5, v31

    .end local v1    # "cl":Ljava/lang/String;
    .end local v30    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    .end local v31    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    .restart local v4    # "cl":Ljava/lang/String;
    .restart local v5    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    .restart local v7    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    invoke-virtual/range {p0 .. p0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->nextInt()I

    move-result v0

    .line 126
    .local v0, "layerTypeInt":I
    sget-object v1, Lcom/airbnb/lottie/model/layer/Layer$LayerType;->UNKNOWN:Lcom/airbnb/lottie/model/layer/Layer$LayerType;

    invoke-virtual {v1}, Lcom/airbnb/lottie/model/layer/Layer$LayerType;->ordinal()I

    move-result v1

    if-ge v0, v1, :cond_d

    .line 127
    invoke-static {}, Lcom/airbnb/lottie/model/layer/Layer$LayerType;->values()[Lcom/airbnb/lottie/model/layer/Layer$LayerType;

    move-result-object v1

    aget-object v9, v1, v0

    move-object/from16 v0, p0

    move-object v1, v4

    move-object/from16 v31, v5

    move-object/from16 v30, v7

    goto/16 :goto_0

    .line 129
    :cond_d
    sget-object v9, Lcom/airbnb/lottie/model/layer/Layer$LayerType;->UNKNOWN:Lcom/airbnb/lottie/model/layer/Layer$LayerType;

    .line 131
    move-object/from16 v0, p0

    move-object v1, v4

    move-object/from16 v31, v5

    move-object/from16 v30, v7

    goto/16 :goto_0

    .line 122
    .end local v0    # "layerTypeInt":I
    .end local v4    # "cl":Ljava/lang/String;
    .end local v5    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    .end local v7    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    .restart local v1    # "cl":Ljava/lang/String;
    .restart local v30    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    .restart local v31    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    :pswitch_1c
    move-object v4, v1

    move-object/from16 v7, v30

    move-object/from16 v5, v31

    .end local v1    # "cl":Ljava/lang/String;
    .end local v30    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    .end local v31    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    .restart local v4    # "cl":Ljava/lang/String;
    .restart local v5    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    .restart local v7    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    invoke-virtual/range {p0 .. p0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->nextString()Ljava/lang/String;

    move-result-object v10

    .line 123
    move-object/from16 v0, p0

    goto/16 :goto_0

    .line 119
    .end local v4    # "cl":Ljava/lang/String;
    .end local v5    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    .end local v7    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    .restart local v1    # "cl":Ljava/lang/String;
    .restart local v30    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    .restart local v31    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    :pswitch_1d
    move-object v4, v1

    move-object/from16 v7, v30

    move-object/from16 v5, v31

    .end local v1    # "cl":Ljava/lang/String;
    .end local v30    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    .end local v31    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    .restart local v4    # "cl":Ljava/lang/String;
    .restart local v5    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    .restart local v7    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    invoke-virtual/range {p0 .. p0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->nextInt()I

    move-result v0

    int-to-long v11, v0

    .line 120
    move-object/from16 v0, p0

    goto/16 :goto_0

    .line 116
    .end local v4    # "cl":Ljava/lang/String;
    .end local v5    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    .end local v7    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    .restart local v1    # "cl":Ljava/lang/String;
    .restart local v30    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    .restart local v31    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    :pswitch_1e
    move-object v4, v1

    move-object/from16 v7, v30

    move-object/from16 v5, v31

    .end local v1    # "cl":Ljava/lang/String;
    .end local v30    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    .end local v31    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    .restart local v4    # "cl":Ljava/lang/String;
    .restart local v5    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    .restart local v7    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    invoke-virtual/range {p0 .. p0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->nextString()Ljava/lang/String;

    move-result-object v8

    .line 117
    move-object/from16 v0, p0

    goto/16 :goto_0

    .line 113
    :goto_9
    move-object/from16 v0, p0

    move-object v1, v4

    move-object/from16 v31, v5

    move-object/from16 v30, v7

    goto/16 :goto_0

    .line 282
    .end local v4    # "cl":Ljava/lang/String;
    .end local v5    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    .end local v7    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    .restart local v1    # "cl":Ljava/lang/String;
    .restart local v30    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    .restart local v31    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    :cond_e
    move-object v4, v1

    move-object/from16 v7, v30

    move-object/from16 v5, v31

    .end local v1    # "cl":Ljava/lang/String;
    .end local v30    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    .end local v31    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    .restart local v4    # "cl":Ljava/lang/String;
    .restart local v5    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    .restart local v7    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    invoke-virtual/range {p0 .. p0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->endObject()V

    .line 284
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 286
    .local v0, "inOutKeyframes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/value/Keyframe<Ljava/lang/Float;>;>;"
    const/16 v30, 0x0

    cmpl-float v1, v22, v30

    if-lez v1, :cond_f

    .line 287
    new-instance v1, Lcom/airbnb/lottie/value/Keyframe;

    move v6, v3

    .end local v3    # "autoOrient":Z
    .local v6, "autoOrient":Z
    invoke-static/range {v30 .. v30}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    move-object/from16 v31, v4

    .end local v4    # "cl":Ljava/lang/String;
    .local v31, "cl":Ljava/lang/String;
    invoke-static/range {v30 .. v30}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    move/from16 v35, v6

    .end local v6    # "autoOrient":Z
    .local v35, "autoOrient":Z
    const/4 v6, 0x0

    move-object/from16 v36, v7

    .end local v7    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    .local v36, "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    invoke-static/range {v22 .. v22}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    move-object/from16 v37, v5

    .end local v5    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    .local v37, "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    const/4 v5, 0x0

    move-object/from16 v40, v31

    move-object/from16 v31, v9

    move-object/from16 v9, v40

    move/from16 v40, v35

    move-object/from16 v35, v10

    move/from16 v10, v40

    .local v9, "cl":Ljava/lang/String;
    .local v10, "autoOrient":Z
    .local v31, "layerType":Lcom/airbnb/lottie/model/layer/Layer$LayerType;
    .local v35, "refId":Ljava/lang/String;
    invoke-direct/range {v1 .. v7}, Lcom/airbnb/lottie/value/Keyframe;-><init>(Lcom/airbnb/lottie/LottieComposition;Ljava/lang/Object;Ljava/lang/Object;Landroid/view/animation/Interpolator;FLjava/lang/Float;)V

    .line 288
    .local v1, "preKeyframe":Lcom/airbnb/lottie/value/Keyframe;, "Lcom/airbnb/lottie/value/Keyframe<Ljava/lang/Float;>;"
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_a

    .line 286
    .end local v1    # "preKeyframe":Lcom/airbnb/lottie/value/Keyframe;, "Lcom/airbnb/lottie/value/Keyframe<Ljava/lang/Float;>;"
    .end local v31    # "layerType":Lcom/airbnb/lottie/model/layer/Layer$LayerType;
    .end local v35    # "refId":Ljava/lang/String;
    .end local v36    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    .end local v37    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    .restart local v3    # "autoOrient":Z
    .restart local v4    # "cl":Ljava/lang/String;
    .restart local v5    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    .restart local v7    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    .local v9, "layerType":Lcom/airbnb/lottie/model/layer/Layer$LayerType;
    .local v10, "refId":Ljava/lang/String;
    :cond_f
    move-object/from16 v37, v5

    move-object/from16 v36, v7

    move-object/from16 v31, v9

    move-object/from16 v35, v10

    move v10, v3

    move-object v9, v4

    .line 292
    .end local v3    # "autoOrient":Z
    .end local v4    # "cl":Ljava/lang/String;
    .end local v5    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    .end local v7    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    .local v9, "cl":Ljava/lang/String;
    .local v10, "autoOrient":Z
    .restart local v31    # "layerType":Lcom/airbnb/lottie/model/layer/Layer$LayerType;
    .restart local v35    # "refId":Ljava/lang/String;
    .restart local v36    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    .restart local v37    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    :goto_a
    cmpl-float v1, v23, v30

    if-lez v1, :cond_10

    move/from16 v6, v23

    goto :goto_b

    :cond_10
    invoke-virtual/range {p1 .. p1}, Lcom/airbnb/lottie/LottieComposition;->getEndFrame()F

    move-result v1

    move v6, v1

    :goto_b
    move/from16 v23, v6

    .line 293
    new-instance v1, Lcom/airbnb/lottie/value/Keyframe;

    .line 294
    const/high16 v2, 0x3f800000    # 1.0f

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    const/4 v5, 0x0

    invoke-static/range {v23 .. v23}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    move-object/from16 v2, p1

    move/from16 v6, v22

    .end local v22    # "inFrame":F
    .local v6, "inFrame":F
    invoke-direct/range {v1 .. v7}, Lcom/airbnb/lottie/value/Keyframe;-><init>(Lcom/airbnb/lottie/LottieComposition;Ljava/lang/Object;Ljava/lang/Object;Landroid/view/animation/Interpolator;FLjava/lang/Float;)V

    move/from16 v38, v6

    .line 295
    .end local v6    # "inFrame":F
    .local v1, "visibleKeyframe":Lcom/airbnb/lottie/value/Keyframe;, "Lcom/airbnb/lottie/value/Keyframe<Ljava/lang/Float;>;"
    .local v38, "inFrame":F
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 297
    move-object v2, v1

    .end local v1    # "visibleKeyframe":Lcom/airbnb/lottie/value/Keyframe;, "Lcom/airbnb/lottie/value/Keyframe<Ljava/lang/Float;>;"
    .local v2, "visibleKeyframe":Lcom/airbnb/lottie/value/Keyframe;, "Lcom/airbnb/lottie/value/Keyframe<Ljava/lang/Float;>;"
    new-instance v1, Lcom/airbnb/lottie/value/Keyframe;

    .line 298
    invoke-static/range {v30 .. v30}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-static/range {v30 .. v30}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    const v5, 0x7f7fffff    # Float.MAX_VALUE

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    const/4 v5, 0x0

    move-object/from16 v30, v2

    move/from16 v6, v23

    move-object/from16 v2, p1

    .end local v2    # "visibleKeyframe":Lcom/airbnb/lottie/value/Keyframe;, "Lcom/airbnb/lottie/value/Keyframe<Ljava/lang/Float;>;"
    .end local v23    # "outFrame":F
    .local v6, "outFrame":F
    .local v30, "visibleKeyframe":Lcom/airbnb/lottie/value/Keyframe;, "Lcom/airbnb/lottie/value/Keyframe<Ljava/lang/Float;>;"
    invoke-direct/range {v1 .. v7}, Lcom/airbnb/lottie/value/Keyframe;-><init>(Lcom/airbnb/lottie/LottieComposition;Ljava/lang/Object;Ljava/lang/Object;Landroid/view/animation/Interpolator;FLjava/lang/Float;)V

    move/from16 v39, v6

    .line 299
    .end local v6    # "outFrame":F
    .local v1, "outKeyframe":Lcom/airbnb/lottie/value/Keyframe;, "Lcom/airbnb/lottie/value/Keyframe<Ljava/lang/Float;>;"
    .local v39, "outFrame":F
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 301
    const-string v3, ".ai"

    invoke-virtual {v8, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_11

    const-string v3, "ai"

    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_12

    .line 302
    :cond_11
    const-string v3, "Convert your Illustrator layers to shape layers."

    invoke-virtual {v2, v3}, Lcom/airbnb/lottie/LottieComposition;->addWarning(Ljava/lang/String;)V

    .line 305
    :cond_12
    if-eqz v10, :cond_14

    .line 306
    if-nez v29, :cond_13

    .line 307
    new-instance v3, Lcom/airbnb/lottie/model/animatable/AnimatableTransform;

    invoke-direct {v3}, Lcom/airbnb/lottie/model/animatable/AnimatableTransform;-><init>()V

    .end local v29    # "transform":Lcom/airbnb/lottie/model/animatable/AnimatableTransform;
    .local v3, "transform":Lcom/airbnb/lottie/model/animatable/AnimatableTransform;
    goto :goto_c

    .line 306
    .end local v3    # "transform":Lcom/airbnb/lottie/model/animatable/AnimatableTransform;
    .restart local v29    # "transform":Lcom/airbnb/lottie/model/animatable/AnimatableTransform;
    :cond_13
    move-object/from16 v3, v29

    .line 309
    .end local v29    # "transform":Lcom/airbnb/lottie/model/animatable/AnimatableTransform;
    .restart local v3    # "transform":Lcom/airbnb/lottie/model/animatable/AnimatableTransform;
    :goto_c
    invoke-virtual {v3, v10}, Lcom/airbnb/lottie/model/animatable/AnimatableTransform;->setAutoOrient(Z)V

    move-object/from16 v29, v3

    .line 311
    .end local v3    # "transform":Lcom/airbnb/lottie/model/animatable/AnimatableTransform;
    .restart local v29    # "transform":Lcom/airbnb/lottie/model/animatable/AnimatableTransform;
    :cond_14
    move-object v3, v1

    .end local v1    # "outKeyframe":Lcom/airbnb/lottie/value/Keyframe;, "Lcom/airbnb/lottie/value/Keyframe<Ljava/lang/Float;>;"
    .local v3, "outKeyframe":Lcom/airbnb/lottie/value/Keyframe;, "Lcom/airbnb/lottie/value/Keyframe<Ljava/lang/Float;>;"
    new-instance v1, Lcom/airbnb/lottie/model/layer/Layer;

    move-object/from16 v4, v35

    move/from16 v35, v10

    move-object v10, v4

    move-object/from16 v22, v0

    move-object v0, v3

    move-object v4, v8

    move-wide v5, v11

    move-object/from16 v23, v24

    move-object/from16 v12, v29

    move-object/from16 v7, v31

    move-object/from16 v24, v34

    move-object/from16 v11, v36

    move-object v3, v2

    move-object/from16 v31, v9

    move-wide/from16 v8, v16

    move/from16 v16, v20

    move/from16 v17, v21

    move-object/from16 v20, v32

    move-object/from16 v21, v33

    move-object/from16 v2, v37

    .end local v3    # "outKeyframe":Lcom/airbnb/lottie/value/Keyframe;, "Lcom/airbnb/lottie/value/Keyframe<Ljava/lang/Float;>;"
    .end local v9    # "cl":Ljava/lang/String;
    .end local v29    # "transform":Lcom/airbnb/lottie/model/animatable/AnimatableTransform;
    .end local v32    # "text":Lcom/airbnb/lottie/model/animatable/AnimatableTextFrame;
    .end local v33    # "textProperties":Lcom/airbnb/lottie/model/animatable/AnimatableTextProperties;
    .end local v34    # "timeRemapping":Lcom/airbnb/lottie/model/animatable/AnimatableFloatValue;
    .end local v36    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    .end local v37    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    .local v0, "outKeyframe":Lcom/airbnb/lottie/value/Keyframe;, "Lcom/airbnb/lottie/value/Keyframe<Ljava/lang/Float;>;"
    .local v2, "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    .local v4, "layerName":Ljava/lang/String;
    .local v5, "layerId":J
    .local v7, "layerType":Lcom/airbnb/lottie/model/layer/Layer$LayerType;
    .local v8, "parentId":J
    .local v10, "refId":Ljava/lang/String;
    .local v11, "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    .local v12, "transform":Lcom/airbnb/lottie/model/animatable/AnimatableTransform;
    .local v16, "timeStretch":F
    .local v17, "startFrame":F
    .local v20, "text":Lcom/airbnb/lottie/model/animatable/AnimatableTextFrame;
    .local v21, "textProperties":Lcom/airbnb/lottie/model/animatable/AnimatableTextProperties;
    .local v22, "inOutKeyframes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/value/Keyframe<Ljava/lang/Float;>;>;"
    .local v23, "matteType":Lcom/airbnb/lottie/model/layer/Layer$MatteType;
    .local v24, "timeRemapping":Lcom/airbnb/lottie/model/animatable/AnimatableFloatValue;
    .local v31, "cl":Ljava/lang/String;
    .local v35, "autoOrient":Z
    invoke-direct/range {v1 .. v28}, Lcom/airbnb/lottie/model/layer/Layer;-><init>(Ljava/util/List;Lcom/airbnb/lottie/LottieComposition;Ljava/lang/String;JLcom/airbnb/lottie/model/layer/Layer$LayerType;JLjava/lang/String;Ljava/util/List;Lcom/airbnb/lottie/model/animatable/AnimatableTransform;IIIFFFFLcom/airbnb/lottie/model/animatable/AnimatableTextFrame;Lcom/airbnb/lottie/model/animatable/AnimatableTextProperties;Ljava/util/List;Lcom/airbnb/lottie/model/layer/Layer$MatteType;Lcom/airbnb/lottie/model/animatable/AnimatableFloatValue;ZLcom/airbnb/lottie/model/content/BlurEffect;Lcom/airbnb/lottie/parser/DropShadowEffect;Lcom/airbnb/lottie/model/content/LBlendMode;)V

    .end local v2    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    .end local v11    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    .restart local v36    # "masks":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/Mask;>;"
    .restart local v37    # "shapes":Ljava/util/List;, "Ljava/util/List<Lcom/airbnb/lottie/model/content/ContentModel;>;"
    return-object v1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_e
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_d
        :pswitch_c
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x0
        :pswitch_10
        :pswitch_f
    .end packed-switch

    :pswitch_data_3
    .packed-switch 0x1
        :pswitch_15
        :pswitch_14
    .end packed-switch
.end method
