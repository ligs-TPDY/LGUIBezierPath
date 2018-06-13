    #import <Foundation/Foundation.h>
    #import <CoreGraphics/CoreGraphics.h>
    #import <UIKit/UIKitDefines.h>

    NS_ASSUME_NONNULL_BEGIN

    typedef NS_OPTIONS(NSUInteger, UIRectCorner) {
        UIRectCornerTopLeft     = 1 << 0,
        UIRectCornerTopRight    = 1 << 1,
        UIRectCornerBottomLeft  = 1 << 2,
        UIRectCornerBottomRight = 1 << 3,
        UIRectCornerAllCorners  = ~0UL
    };

    NS_CLASS_AVAILABLE_IOS(3_2) @interface UIBezierPath : NSObject<NSCopying, NSSecureCoding>
    
    - (instancetype)init NS_DESIGNATED_INITIALIZER;
    - (nullable instancetype)initWithCoder:(NSCoder *)aDecoder NS_DESIGNATED_INITIALIZER;
    + (instancetype)bezierPathWithCGPath:(CGPathRef)CGPath;
    @property(nonatomic) CGPathRef CGPath;
    - (CGPathRef)CGPath 
    
    ///创建一个对象
    + (instancetype)bezierPath;
    ///------------------------矩形------------------------
    ///创建一个对象，同时绘制一个矩形
    + (instancetype)bezierPathWithRect:(CGRect)rect;
    ///创建一个对象，同时绘制一个带圆角的矩形
    + (instancetype)bezierPathWithRoundedRect:(CGRect)rect     
                                 cornerRadius:(CGFloat)cornerRadius;
    + (instancetype)bezierPathWithRoundedRect:(CGRect)rect 
                            byRoundingCorners:(UIRectCorner)corners 
                                  cornerRadii:(CGSize)cornerRadii;
    ///------------------------圆------------------------
    ///创建一个对象，同时根据矩形绘制内切圆
    + (instancetype)bezierPathWithOvalInRect:(CGRect)rect;
    ///------------------------弧线------------------------
    ///使用UIBezierPath创建一段弧线
    ///其中的参数分别指定：这段圆弧的中心，半径，开始角度，结束角度，是否顺时针方向。
    + (instancetype)bezierPathWithArcCenter:(CGPoint)center 
                                     radius:(CGFloat)radius 
                                 startAngle:(CGFloat)startAngle 
                                   endAngle:(CGFloat)endAngle 
                                  clockwise:(BOOL)clockwise;
    - (void)addArcWithCenter:(CGPoint)center 
                      radius:(CGFloat)radius
                  startAngle:(CGFloat)startAngle 
                    endAngle:(CGFloat)endAngle 
                   clockwise:(BOOL)clockwise NS_AVAILABLE_IOS(4_0);
    
    ///设置起点
    - (void)moveToPoint:(CGPoint)point;
    ///增加拐点
    - (void)addLineToPoint:(CGPoint)point;
    ///绘制二次贝塞尔曲线
    - (void)addQuadCurveToPoint:(CGPoint)endPoint controlPoint:(CGPoint)controlPoint;
    ///绘制三次贝塞尔曲线
    - (void)addCurveToPoint:(CGPoint)endPoint controlPoint1:(CGPoint)controlPoint1 controlPoint2:(CGPoint)controlPoint2;
    ///连接起点和最后一个点
    - (void)closePath;
    ///删除所有的点
    - (void)removeAllPoints;
    ///拼接另一条曲线
    - (void)appendPath:(UIBezierPath *)bezierPath;

    // Modified paths

    - (UIBezierPath *)bezierPathByReversingPath NS_AVAILABLE_IOS(6_0);

    // Transforming paths

    - (void)applyTransform:(CGAffineTransform)transform;

    // Path info

    @property(readonly,getter=isEmpty) BOOL empty;
    @property(nonatomic,readonly) CGRect bounds;
    @property(nonatomic,readonly) CGPoint currentPoint;
    - (BOOL)containsPoint:(CGPoint)point;

    // Drawing properties

    @property(nonatomic) CGFloat lineWidth;
    @property(nonatomic) CGLineCap lineCapStyle;
    @property(nonatomic) CGLineJoin lineJoinStyle;
    @property(nonatomic) CGFloat miterLimit; // Used when lineJoinStyle is kCGLineJoinMiter
    @property(nonatomic) CGFloat flatness;
    @property(nonatomic) BOOL usesEvenOddFillRule; // Default is NO. When YES, the even-odd fill rule is used for drawing, clipping, and hit testing.

    - (void)setLineDash:(nullable const CGFloat *)pattern count:(NSInteger)count phase:(CGFloat)phase;
    - (void)getLineDash:(nullable CGFloat *)pattern count:(nullable NSInteger *)count phase:(nullable CGFloat *)phase;

    // Path operations on the current graphics context

    - (void)fill;
    - (void)stroke;

    // These methods do not affect the blend mode or alpha of the current graphics context
    - (void)fillWithBlendMode:(CGBlendMode)blendMode alpha:(CGFloat)alpha;
    - (void)strokeWithBlendMode:(CGBlendMode)blendMode alpha:(CGFloat)alpha;

    - (void)addClip;

    @end

    NS_ASSUME_NONNULL_END
