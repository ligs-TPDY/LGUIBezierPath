//
//  CoreGraphicsView.m
//  LGUIBezierPath
//
//  Created by carnet on 2018/6/13.
//  Copyright © 2018年 LG. All rights reserved.
//

#import "CoreGraphicsView.h"

@implementation CoreGraphicsView

- (void)drawRect:(CGRect)rect
{
    //获取当前的上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //创建路径
    CGMutablePathRef path = CGPathCreateMutable();
    //设置起点
    CGPathMoveToPoint(path, nil, 200, 100);
    //设置终点
    CGPathAddLineToPoint(path, nil, 20 , 200);
    //设置终点
    CGPathAddLineToPoint(path, nil, 200 , 200);
    //将路径添加到上下文
    CGContextAddPath(context, path);
    
    //设置笔触颜色
    CGContextSetRGBStrokeColor(context, 0.2, 0.2, 0.2, 1);
    //设置填充颜色
    CGContextSetRGBFillColor(context, 1, 1, 0, 1);
    //设置边框宽度
    CGContextSetLineWidth(context, 50.0);
    //设置顶点样式
    CGContextSetLineCap(context, kCGLineCapRound);
    //设置连接点样式
    CGContextSetLineJoin(context, kCGLineJoinRound);
    //设置虚线
    CGFloat lengths[2] = {18,9};
    CGContextSetLineDash(context, 0, lengths, 2);
    //设置阴影
    CGContextSetShadowWithColor(context, CGSizeMake(2, 2), 0, [UIColor blackColor].CGColor);
    //设置填充类型并绘制路径
    CGContextDrawPath(context, kCGPathFill);
    //释放当前的上下文
    CGContextRelease(context);
}

@end
