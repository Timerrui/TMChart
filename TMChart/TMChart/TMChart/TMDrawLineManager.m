//
//  TMDrawLineManage.m
//  TMChart
//
//  Created by harry on 17/1/20.
//  Copyright © 2017年 timer. All rights reserved.
//

#import "TMDrawLineManager.h"

@implementation TMDrawLineManager
+(void)drawXlablesInView:(TMLineChart *)chart
{
    NSInteger count = [chart getXcount];
    for (NSInteger i=0; i<count; i++)
    {
        float x = chart.leftSpace+i*((chart.frame.size.width-2*chart.leftSpace)/count);
        float y = chart.frame.size.height-(chart.bottomSpace-10);
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        UIBezierPath *path = [UIBezierPath bezierPath];
        
        if (chart.xLableStyle == TMChartXlableStyle_Month_Type1 && i %5 != 0)
        {
            y -= 5;
        }
        [path moveToPoint:CGPointMake(x,y)];
        [path addLineToPoint:CGPointMake(x,chart.frame.size.height-chart.bottomSpace)];
        
        [path closePath];
        shapeLayer.path = path.CGPath;
        shapeLayer.strokeColor = [[[UIColor blackColor] colorWithAlphaComponent:1] CGColor];
        shapeLayer.fillColor = [[UIColor whiteColor] CGColor];
        shapeLayer.lineWidth = 1;
        [chart.layer addSublayer:shapeLayer];
        
        
        
        
        UILabel *xLable = [[UILabel alloc]init];
        xLable.backgroundColor = [UIColor clearColor];
        xLable.frame = CGRectMake(0, 0, 30, 30);
        xLable.center = CGPointMake(x, y+10);
        [xLable setFont:[UIFont systemFontOfSize:8]];
        [xLable setTextAlignment:NSTextAlignmentCenter];
        
        if ((chart.xLableStyle == TMChartXlableStyle_Month_Type2 && i%2 != 0) ||(chart.xLableStyle == TMChartXlableStyle_Month_Type1 && i%5 == 0))
        {
            UILabel *xLable = [[UILabel alloc]init];
            xLable.backgroundColor = [UIColor clearColor];
            xLable.frame = CGRectMake(0, 0, 30, 30);
            xLable.center = CGPointMake(x, y+10);
            [xLable setFont:[UIFont systemFontOfSize:8]];
            [xLable setTextAlignment:NSTextAlignmentCenter];
            xLable.text = [NSString stringWithFormat:@"%ld",i+1];
            
            
        }
        else if (!chart.xLableStyle || chart.xLableStyle == TMChartXlableStyle_Custom)
        {
            UILabel *xLable = [[UILabel alloc]init];
            xLable.backgroundColor = [UIColor clearColor];
            xLable.frame = CGRectMake(0, 0, 30, 30);
            xLable.center = CGPointMake(x, y+10);
            [xLable setFont:[UIFont systemFontOfSize:8]];
            [xLable setTextAlignment:NSTextAlignmentCenter];
            xLable.text = chart.xLables[i];
            
        }
        else
        {
            xLable.text = [NSString stringWithFormat:@"%ld",i+1];
        }
        [chart addSubview:xLable];
    }
    
}



+(void)drawLineStartPoint:(CGPoint )startPoint EndPoint:(CGPoint )endPoint InView:(TMLineChart *)view
{
    
    [self drawLineStartPoint:startPoint EndPoint:endPoint LineWidth:1 LineColor:[UIColor redColor] InView:view];
}

@end
