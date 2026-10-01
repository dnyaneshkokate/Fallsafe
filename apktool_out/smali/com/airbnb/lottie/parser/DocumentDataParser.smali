.class public Lcom/airbnb/lottie/parser/DocumentDataParser;
.super Ljava/lang/Object;
.source "DocumentDataParser.java"

# interfaces
.implements Lcom/airbnb/lottie/parser/ValueParser;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/airbnb/lottie/parser/ValueParser<",
        "Lcom/airbnb/lottie/model/DocumentData;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lcom/airbnb/lottie/parser/DocumentDataParser;

.field private static final NAMES:Lcom/airbnb/lottie/parser/moshi/JsonReader$Options;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 13
    new-instance v0, Lcom/airbnb/lottie/parser/DocumentDataParser;

    invoke-direct {v0}, Lcom/airbnb/lottie/parser/DocumentDataParser;-><init>()V

    sput-object v0, Lcom/airbnb/lottie/parser/DocumentDataParser;->INSTANCE:Lcom/airbnb/lottie/parser/DocumentDataParser;

    .line 14
    const/16 v0, 0xd

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "t"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "f"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "s"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "j"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string/jumbo v2, "tr"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "lh"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "ls"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "fc"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "sc"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string/jumbo v2, "sw"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "of"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "ps"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string/jumbo v2, "sz"

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader$Options;->of([Ljava/lang/String;)Lcom/airbnb/lottie/parser/moshi/JsonReader$Options;

    move-result-object v0

    sput-object v0, Lcom/airbnb/lottie/parser/DocumentDataParser;->NAMES:Lcom/airbnb/lottie/parser/moshi/JsonReader$Options;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    return-void
.end method


# virtual methods
.method public parse(Lcom/airbnb/lottie/parser/moshi/JsonReader;F)Lcom/airbnb/lottie/model/DocumentData;
    .locals 27
    .param p1, "reader"    # Lcom/airbnb/lottie/parser/moshi/JsonReader;
    .param p2, "scale"    # F
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 35
    const/4 v0, 0x0

    .line 36
    .local v0, "text":Ljava/lang/String;
    const/4 v1, 0x0

    .line 37
    .local v1, "fontName":Ljava/lang/String;
    const/4 v2, 0x0

    .line 38
    .local v2, "size":F
    sget-object v3, Lcom/airbnb/lottie/model/DocumentData$Justification;->CENTER:Lcom/airbnb/lottie/model/DocumentData$Justification;

    .line 39
    .local v3, "justification":Lcom/airbnb/lottie/model/DocumentData$Justification;
    const/4 v4, 0x0

    .line 40
    .local v4, "tracking":I
    const/4 v5, 0x0

    .line 41
    .local v5, "lineHeight":F
    const/4 v6, 0x0

    .line 42
    .local v6, "baselineShift":F
    const/4 v7, 0x0

    .line 43
    .local v7, "fillColor":I
    const/4 v8, 0x0

    .line 44
    .local v8, "strokeColor":I
    const/4 v9, 0x0

    .line 45
    .local v9, "strokeWidth":F
    const/4 v10, 0x1

    .line 46
    .local v10, "strokeOverFill":Z
    const/4 v11, 0x0

    .line 47
    .local v11, "boxPosition":Landroid/graphics/PointF;
    const/4 v12, 0x0

    .line 49
    .local v12, "boxSize":Landroid/graphics/PointF;
    invoke-virtual/range {p1 .. p1}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->beginObject()V

    move-object v14, v0

    move-object v15, v1

    move/from16 v16, v2

    move-object/from16 v17, v3

    move/from16 v18, v4

    move/from16 v19, v5

    move/from16 v20, v6

    move/from16 v21, v7

    move/from16 v22, v8

    move/from16 v23, v9

    move/from16 v24, v10

    move-object/from16 v25, v11

    move-object/from16 v26, v12

    .line 50
    .end local v0    # "text":Ljava/lang/String;
    .end local v1    # "fontName":Ljava/lang/String;
    .end local v2    # "size":F
    .end local v3    # "justification":Lcom/airbnb/lottie/model/DocumentData$Justification;
    .end local v4    # "tracking":I
    .end local v5    # "lineHeight":F
    .end local v6    # "baselineShift":F
    .end local v7    # "fillColor":I
    .end local v8    # "strokeColor":I
    .end local v9    # "strokeWidth":F
    .end local v10    # "strokeOverFill":Z
    .end local v11    # "boxPosition":Landroid/graphics/PointF;
    .end local v12    # "boxSize":Landroid/graphics/PointF;
    .local v14, "text":Ljava/lang/String;
    .local v15, "fontName":Ljava/lang/String;
    .local v16, "size":F
    .local v17, "justification":Lcom/airbnb/lottie/model/DocumentData$Justification;
    .local v18, "tracking":I
    .local v19, "lineHeight":F
    .local v20, "baselineShift":F
    .local v21, "fillColor":I
    .local v22, "strokeColor":I
    .local v23, "strokeWidth":F
    .local v24, "strokeOverFill":Z
    .local v25, "boxPosition":Landroid/graphics/PointF;
    .local v26, "boxSize":Landroid/graphics/PointF;
    :goto_0
    invoke-virtual/range {p1 .. p1}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 51
    sget-object v0, Lcom/airbnb/lottie/parser/DocumentDataParser;->NAMES:Lcom/airbnb/lottie/parser/moshi/JsonReader$Options;

    move-object/from16 v1, p1

    invoke-virtual {v1, v0}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->selectName(Lcom/airbnb/lottie/parser/moshi/JsonReader$Options;)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 101
    invoke-virtual {v1}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->skipName()V

    .line 102
    invoke-virtual {v1}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->skipValue()V

    goto :goto_0

    .line 96
    :pswitch_0
    invoke-virtual {v1}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->beginArray()V

    .line 97
    new-instance v0, Landroid/graphics/PointF;

    invoke-virtual {v1}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->nextDouble()D

    move-result-wide v2

    double-to-float v2, v2

    mul-float v2, v2, p2

    invoke-virtual {v1}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->nextDouble()D

    move-result-wide v3

    double-to-float v3, v3

    mul-float v3, v3, p2

    invoke-direct {v0, v2, v3}, Landroid/graphics/PointF;-><init>(FF)V

    move-object/from16 v26, v0

    .line 98
    invoke-virtual {v1}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->endArray()V

    .line 99
    goto :goto_0

    .line 91
    :pswitch_1
    invoke-virtual {v1}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->beginArray()V

    .line 92
    new-instance v0, Landroid/graphics/PointF;

    invoke-virtual {v1}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->nextDouble()D

    move-result-wide v2

    double-to-float v2, v2

    mul-float v2, v2, p2

    invoke-virtual {v1}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->nextDouble()D

    move-result-wide v3

    double-to-float v3, v3

    mul-float v3, v3, p2

    invoke-direct {v0, v2, v3}, Landroid/graphics/PointF;-><init>(FF)V

    move-object/from16 v25, v0

    .line 93
    invoke-virtual {v1}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->endArray()V

    .line 94
    goto :goto_0

    .line 88
    :pswitch_2
    invoke-virtual {v1}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->nextBoolean()Z

    move-result v24

    .line 89
    goto :goto_0

    .line 85
    :pswitch_3
    invoke-virtual {v1}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->nextDouble()D

    move-result-wide v2

    double-to-float v0, v2

    .line 86
    .end local v23    # "strokeWidth":F
    .local v0, "strokeWidth":F
    move/from16 v23, v0

    goto :goto_0

    .line 82
    .end local v0    # "strokeWidth":F
    .restart local v23    # "strokeWidth":F
    :pswitch_4
    invoke-static {v1}, Lcom/airbnb/lottie/parser/JsonUtils;->jsonToColor(Lcom/airbnb/lottie/parser/moshi/JsonReader;)I

    move-result v22

    .line 83
    goto :goto_0

    .line 79
    :pswitch_5
    invoke-static {v1}, Lcom/airbnb/lottie/parser/JsonUtils;->jsonToColor(Lcom/airbnb/lottie/parser/moshi/JsonReader;)I

    move-result v21

    .line 80
    goto :goto_0

    .line 76
    :pswitch_6
    invoke-virtual {v1}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->nextDouble()D

    move-result-wide v2

    double-to-float v0, v2

    .line 77
    .end local v20    # "baselineShift":F
    .local v0, "baselineShift":F
    move/from16 v20, v0

    goto :goto_0

    .line 73
    .end local v0    # "baselineShift":F
    .restart local v20    # "baselineShift":F
    :pswitch_7
    invoke-virtual {v1}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->nextDouble()D

    move-result-wide v2

    double-to-float v0, v2

    .line 74
    .end local v19    # "lineHeight":F
    .local v0, "lineHeight":F
    move/from16 v19, v0

    goto :goto_0

    .line 70
    .end local v0    # "lineHeight":F
    .restart local v19    # "lineHeight":F
    :pswitch_8
    invoke-virtual {v1}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->nextInt()I

    move-result v18

    .line 71
    goto :goto_0

    .line 62
    :pswitch_9
    invoke-virtual {v1}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->nextInt()I

    move-result v0

    .line 63
    .local v0, "justificationInt":I
    sget-object v2, Lcom/airbnb/lottie/model/DocumentData$Justification;->CENTER:Lcom/airbnb/lottie/model/DocumentData$Justification;

    invoke-virtual {v2}, Lcom/airbnb/lottie/model/DocumentData$Justification;->ordinal()I

    move-result v2

    if-gt v0, v2, :cond_1

    if-gez v0, :cond_0

    goto :goto_1

    .line 66
    :cond_0
    invoke-static {}, Lcom/airbnb/lottie/model/DocumentData$Justification;->values()[Lcom/airbnb/lottie/model/DocumentData$Justification;

    move-result-object v2

    aget-object v17, v2, v0

    .line 68
    goto/16 :goto_0

    .line 64
    :cond_1
    :goto_1
    sget-object v17, Lcom/airbnb/lottie/model/DocumentData$Justification;->CENTER:Lcom/airbnb/lottie/model/DocumentData$Justification;

    goto/16 :goto_0

    .line 59
    .end local v0    # "justificationInt":I
    :pswitch_a
    invoke-virtual {v1}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->nextDouble()D

    move-result-wide v2

    double-to-float v0, v2

    .line 60
    .end local v16    # "size":F
    .local v0, "size":F
    move/from16 v16, v0

    goto/16 :goto_0

    .line 56
    .end local v0    # "size":F
    .restart local v16    # "size":F
    :pswitch_b
    invoke-virtual {v1}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->nextString()Ljava/lang/String;

    move-result-object v15

    .line 57
    goto/16 :goto_0

    .line 53
    :pswitch_c
    invoke-virtual {v1}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->nextString()Ljava/lang/String;

    move-result-object v14

    .line 54
    goto/16 :goto_0

    .line 105
    :cond_2
    move-object/from16 v1, p1

    invoke-virtual {v1}, Lcom/airbnb/lottie/parser/moshi/JsonReader;->endObject()V

    .line 107
    new-instance v13, Lcom/airbnb/lottie/model/DocumentData;

    invoke-direct/range {v13 .. v26}, Lcom/airbnb/lottie/model/DocumentData;-><init>(Ljava/lang/String;Ljava/lang/String;FLcom/airbnb/lottie/model/DocumentData$Justification;IFFIIFZLandroid/graphics/PointF;Landroid/graphics/PointF;)V

    return-object v13

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_c
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
.end method

.method public bridge synthetic parse(Lcom/airbnb/lottie/parser/moshi/JsonReader;F)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 12
    invoke-virtual {p0, p1, p2}, Lcom/airbnb/lottie/parser/DocumentDataParser;->parse(Lcom/airbnb/lottie/parser/moshi/JsonReader;F)Lcom/airbnb/lottie/model/DocumentData;

    move-result-object p1

    return-object p1
.end method
