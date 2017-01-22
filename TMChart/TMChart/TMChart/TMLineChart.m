//
//  TMLineChart.m
//  TMChart
//
//  Created by harry on 17/1/18.
//  Copyright © 2017年 timer. All rights reserved.
//

#import "TMLineChart.h"
#import "TMDrawLineManager.h"
@interface TMLineChart ()
@property(nonatomic) CABasicAnimation *pathAnimation;
@property(nonatomic,assign)CGFloat scaleValue;
@end
@implementation TMLineChart

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self initializeConfig];
    }
    return self;
}

-(void)initializeConfig
{
    self.clipsToBounds = YES;
    self.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.pointArray = [NSMutableArray array];
    if (!self.bottomSpace)
    {
        self.bottomSpace = 30;
    }
    
    if (!self.leftSpace)
    {
        self.leftSpace = 30;
    }
}


/**
 开始绘制
 */
-(void)startDraw
{
    [self configLimitValue];
    [self drawForm];
    [self drawLine2];
}

-(void)configLimitValue
{
    if (!self.yMaxValue)
    {
        self.yMaxValue = 300;
    }
    
    if (!self.yMinValue)
    {
        self.yMinValue = 0;
    }
    
}


-(float)scaleXvalueWithxValue:(float)xValue
{
    NSInteger count = _xLables.count;
    switch (self.xLableStyle)
    {
        case TMChartXlableStyle_Week:
            count = 7;
            break;
        case TMChartXlableStyle_Year:
            count = 12;
            break;
        case TMChartXlableStyle_Month_Type1:
        case TMChartXlableStyle_Month_Type2:
            count = 31;
            break;
        default:
            break;
    }

   return  self.leftSpace + ((self.frame.size.width-2*self.leftSpace)/count)* xValue;

}

-(float)scaleYvalueWithyValue:(float)yValue
{
    float frameH = self.frame.size.height;
    
    return frameH-self.bottomSpace -(yValue*1.0/300)*(frameH-2*self.bottomSpace);
    
}
/**
 画表格
 */
-(void)drawForm
{
    float frameW = self.frame.size.width;
    float frameH = self.frame.size.height;
    
    [TMDrawLineManager drawLineStartPoint:CGPointMake(self.leftSpace,frameH-self.bottomSpace) EndPoint:CGPointMake(frameW-self.leftSpace, frameH-self.bottomSpace) InView:self];
    
    [TMDrawLineManager drawLineStartPoint:CGPointMake(self.leftSpace,self.bottomSpace) EndPoint:CGPointMake(self.leftSpace, frameH-self.bottomSpace) InView:self];
}


-(void)drawLineChart
{
    
}





-(void)setXLables:(NSArray *)xLables
{
    _xLables = xLables;
    [TMDrawLineManager drawXlablesInView:self];
}

-(NSInteger)getXcount
{
    NSInteger count = _xLables.count;
    switch (self.xLableStyle)
    {
        case TMChartXlableStyle_Week:
            count = 7;
            break;
        case TMChartXlableStyle_Year:
            count = 12;
            break;
        case TMChartXlableStyle_Month_Type1:
        case TMChartXlableStyle_Month_Type2:
            count = 31;
            break;
        default:
            break;
    }
    return count;
}



-(void)drawLine2
{
    int i = 0;
    NSInteger count = [self getXcount];
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path setLineCapStyle:kCGLineCapRound];
    [path setLineJoinStyle:kCGLineJoinRound];

    CGPoint beginPoint = CGPointMake([self scaleXvalueWithxValue:i],[self scaleYvalueWithyValue:0]);
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    lineLayer.lineWidth = 2;
    lineLayer.strokeColor = [UIColor blueColor].CGColor;
    
    lineLayer.fillColor   = nil;
    lineLayer.strokeEnd = 0.0;
    lineLayer.lineCap = kCALineCapRound;
    lineLayer.lineJoin = kCALineJoinBevel;
    [self.layer addSublayer:lineLayer];

    while (i<count)
    {
        ;
        float x = [self scaleXvalueWithxValue:i];
        float y = [self scaleYvalueWithyValue:[self.pointArray[i] floatValue]];
        NSLog(@"%f---%@",y,self.pointArray[i]);
        CGPoint endPoint = CGPointMake(x, y);
        [self addPoint:beginPoint index:i isShow:YES value:beginPoint.y];
        if (i == 0)
        {
            [path moveToPoint:beginPoint];
        }
        else
        {
           [path addLineToPoint:endPoint];
        [self addPoint:beginPoint index:i isShow:YES value:beginPoint.y];
        }
        beginPoint = endPoint;
        
       
        

        
        i ++;
        
        if (i == count)
        {
          [self addPoint:beginPoint index:i isShow:YES value:beginPoint.y];
        }
    }
    
    
    lineLayer.path = path.CGPath;
    [lineLayer addAnimation:self.pathAnimation forKey:@"strokeEndAnimation"];
    lineLayer.strokeEnd = 1.0;
//    [self.layer addSublayer:lineLayer];

}

- (void)addPoint:(CGPoint)point index:(NSInteger)index isShow:(BOOL)isHollow value:(CGFloat)value
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(5, 5, 14, 14)];
    view.center = point;
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = 7;
    view.layer.borderWidth = 2;
    //    view.layer.borderColor = [[_colors objectAtIndex:index] CGColor]?[[_colors objectAtIndex:index] CGColor]:[UUColor green].CGColor;
    view.layer.borderColor = [UIColor redColor].CGColor;
    
    if (isHollow) {
        view.backgroundColor = [UIColor whiteColor];
    }else{
        view.backgroundColor = [UIColor yellowColor];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(point.x-30/2.0, point.y-30*2, 30, 30)];
        label.font = [UIFont systemFontOfSize:10];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = view.backgroundColor;
        label.text = [NSString stringWithFormat:@"%d",(int)value];
        [self addSubview:label];
    }
    
    [self addSubview:view];
}














- (CABasicAnimation *)pathAnimation {
//    if (self.displayAnimated && !_pathAnimation) {
        _pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        _pathAnimation.duration = 2;
        _pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        _pathAnimation.fromValue = @0.0f;
        _pathAnimation.toValue = @1.0f;
    
    
    _pathAnimation.autoreverses = NO;
//    }
    return _pathAnimation;
}

@end
