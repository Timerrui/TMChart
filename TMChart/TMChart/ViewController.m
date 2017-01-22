//
//  ViewController.m
//  TMChart
//
//  Created by harry on 17/1/18.
//  Copyright © 2017年 timer. All rights reserved.
//

#import "ViewController.h"
#import "TMLineChart.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    TMLineChart *line = [[TMLineChart alloc]initWithFrame:CGRectMake(0, 60, [UIScreen mainScreen].bounds.size.width, 300)];
    NSArray *array = @[@(0),@(10),@(20),@(300),@(130),@(150),@(60),@(70),@(80),@(90),@(101),@(130),@(150),@(160),@(170),@(180),@(190),@(221),@(230),@(250),@(260)];
    line.xLableStyle = TMChartXlableStyle_Week;
    NSArray *xLable = @[@"1",@"2",@"3",@"4",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30",@"1",@"2",@"3",@"4",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14"];
    
    [line setXLables:xLable];
    [line.pointArray addObjectsFromArray:array];
    
    
//    line.backgroundColor = [UIColor blueColor];
    [self.view addSubview:line];
    [line startDraw];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
