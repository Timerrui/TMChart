//
//  TMDrawLineManage.h
//  TMChart
//
//  Created by harry on 17/1/20.
//  Copyright © 2017年 timer. All rights reserved.
//

#import "TMBaseDrawManager.h"
#import "TMLineChart.h"
@interface TMDrawLineManager : TMBaseDrawManager
+(void)drawXlablesInView:(TMLineChart *)chart;

+(void)drawLineStartPoint:(CGPoint )startPoint EndPoint:(CGPoint )endPoint InView:(TMLineChart *)view;
@end
