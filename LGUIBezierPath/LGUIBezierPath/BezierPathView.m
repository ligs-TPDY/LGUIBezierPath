//
//  BezierPathView.m
//  LGUIBezierPath
//
//  Created by carnet on 2018/6/11.
//  Copyright © 2018年 LG. All rights reserved.
//

#import "BezierPathView.h"

@implementation BezierPathView

- (void)drawRect:(CGRect)rect
{
    UIColor *color = [UIColor orangeColor];
    [color set];
    
    ///初始化一个对象
    UIBezierPath *path0 = [UIBezierPath bezierPath];
    [self setPro:path0];
    //设置起点
    [path0 moveToPoint:CGPointMake(0, 50)];
    //添加拐点
    [path0 addLineToPoint:CGPointMake(50, 80)];
    [path0 addLineToPoint:CGPointMake(100, 100)];
    //连接
    [path0 stroke];///连接
//    [path0 fill];///连接并填充颜色
    
    ///初始化对象并创建一个矩形
    UIBezierPath *path1 = [UIBezierPath bezierPathWithRect:CGRectMake(0, 100, 50, 50)];
    [self setPro:path1];
    [path1 stroke];
    
    ///初始化对象并创建一个带圆角的矩形
    UIBezierPath *path2 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(150, 100, 50, 50) cornerRadius:5.0];
    [self setPro:path2];
    [path2 stroke];
    
    ///初始化对象并创建一个矩形内切圆
    UIBezierPath *path3 = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 150, 50, 50)];
    [self setPro:path3];
    [path3 fill];
    
    ///初始化对象并创建一个圆弧
    UIBezierPath *path4 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(0, 250) radius:50 startAngle:M_PI endAngle:2*M_PI clockwise:YES];
    [self setPro:path4];
    [path4 stroke];
    
    ///初始化对象并创建二元曲线
    UIBezierPath *path5 = [UIBezierPath bezierPath];
    [path5 moveToPoint:CGPointMake(100, 250)];
    [path5 addQuadCurveToPoint:CGPointMake(200, 250) controlPoint:CGPointMake(150, 200)];
    [self setPro:path5];
    [path5 stroke];
    
    ///初始化对象并创建三元曲线
    UIBezierPath *path51 = [UIBezierPath bezierPath];
    [path51 moveToPoint:CGPointMake(100, 300)];
    [path51 addCurveToPoint:CGPointMake(300, 300) controlPoint1:CGPointMake(230, 250) controlPoint2:CGPointMake(270, 350)];
    [self setPro:path51];
    [path51 stroke];
    
    ///利用core Graphics创建路径
    UIBezierPath *path6 = [UIBezierPath bezierPath];
    CGMutablePathRef cgPath = CGPathCreateMutable();
    CGPathAddEllipseInRect(cgPath, NULL, CGRectMake(0, 0, 300, 300));
    CGPathAddEllipseInRect(cgPath, NULL, CGRectMake(50, 50, 200, 200));
    path6.CGPath = cgPath;
    path6.usesEvenOddFillRule = YES;
    CGPathRelease(cgPath);
}
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    CGContextSaveGState(ctx);
    CGRect rect = CGRectMake(0, 0, 100, 100);
    CGContextAddEllipseInRect(ctx, rect);
    CGContextSetLineWidth(ctx, 5.0);
    CGContextSetStrokeColorWithColor(ctx,[UIColor orangeColor].CGColor);
    CGContextStrokePath(ctx);
    CGContextSetFillColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextFillEllipseInRect(ctx, rect);
    CGContextRestoreGState(ctx);
}
- (void)setPro:(UIBezierPath *)path
{
    ///线宽
    path.lineWidth = 5.0;
    //线条拐角
    path.lineCapStyle = kCGLineCapRound;
    //终点处理
    path.lineJoinStyle = kCGLineCapRound;
}
@end
