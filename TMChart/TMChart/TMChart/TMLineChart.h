//
//  TMLineChart.h
//  TMChart
//
//  Created by harry on 17/1/18.
//  Copyright © 2017年 timer. All rights reserved.
//

#import "TMBaseChartView.h"

@interface TMLineChart : TMBaseChartView
@property(nonatomic,strong)NSMutableArray *pointArray;

@property(nonatomic,assign)BOOL isShowPoint;

/**
 y轴最大值  最小值  （如果不设置  会自动读取要显示点的最大 和最小）
 */
@property(nonatomic,assign)float yMaxValue;
@property(nonatomic,assign)float yMinValue;


/**
 y轴刻度显示   x轴刻度显示
 */
@property(nonatomic,strong)NSArray *yLables;
@property(nonatomic,strong)NSArray *xLables;



/**
 
 */
@property(nonatomic,strong)NSArray *Values;


-(void)startDraw;


-(NSInteger)getXcount;
@end
