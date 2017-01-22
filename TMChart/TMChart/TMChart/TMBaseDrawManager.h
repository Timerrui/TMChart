//
//  TMBaseDrawManager.h
//  TMChart
//
//  Created by harry on 17/1/20.
//  Copyright © 2017年 timer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,lineStyle)
{
   lineStyle_Broken,
   lineStyle_parabola
};
@interface TMBaseDrawManager : NSObject


+(void)drawLineStartPoint:(CGPoint )startPoint EndPoint:(CGPoint )endPoint LineWidth:(float)lineWidth LineColor:(UIColor *)linecolor InView:(UIView *)view;


+(void)drawLinesWithPoints:(NSArray *)points LineWidth:(float)lineWidth LineColor:(UIColor *)linecolor InView:(UIView *)view;
@end
