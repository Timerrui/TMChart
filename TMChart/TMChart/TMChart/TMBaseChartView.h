//
//  TMBaseChartView.h
//  TMChart
//
//  Created by harry on 17/1/18.
//  Copyright © 2017年 timer. All rights reserved.
//

#import <UIKit/UIKit.h>

//x轴 lable 类型
typedef NS_ENUM(NSInteger, TMChartXlableStyle)
{
    TMChartXlableStyle_Year,        //年  显示12个月
    TMChartXlableStyle_Month_Type1, //月  显示一个月的数据
    TMChartXlableStyle_Month_Type2, //月  显示一个月的数据
    TMChartXlableStyle_Week,        //周  显示一周的数据
    TMChartXlableStyle_Custom       //有用户自定义  显示传入的数据
    
};


@interface TMBaseChartView : UIView
@property(nonatomic,assign)CGFloat leftSpace;
@property(nonatomic,assign)CGFloat bottomSpace;

//x轴 lable 类型
@property(nonatomic,assign)TMChartXlableStyle xLableStyle;
@end
