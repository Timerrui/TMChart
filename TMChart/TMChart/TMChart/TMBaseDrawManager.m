//
//  TMBaseDrawManager.m
//  TMChart
//
//  Created by harry on 17/1/20.
//  Copyright © 2017年 timer. All rights reserved.
//

#import "TMBaseDrawManager.h"

@implementation TMBaseDrawManager

+(void)drawLineStartPoint:(CGPoint)startPoint EndPoint:(CGPoint )endPoint LineWidth:(float)lineWidth LineColor:(UIColor *)linecolor InView:(UIView *)view
{
    CAShapeLayer *line = [CAShapeLayer layer];
    line.lineCap = kCALineCapRound;
    line.lineJoin = kCALineJoinBevel;
    line.strokeColor = linecolor.CGColor;
    line.lineWidth   = lineWidth;
    line.strokeEnd   = 0.0;
    [view.layer addSublayer:line];
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path moveToPoint:startPoint];
    [path addLineToPoint:endPoint];
    [path setLineWidth:lineWidth];
    [path setLineCapStyle:kCGLineCapRound];
    [path setLineJoinStyle:kCGLineJoinRound];
    line.path = path.CGPath;
    line.strokeEnd = 1.0;
    
}



+(void)drawLinesWithPoints:(NSArray *)points LineWidth:(float)lineWidth LineColor:(UIColor *)linecolor InView:(UIView *)view
{


}
@end
