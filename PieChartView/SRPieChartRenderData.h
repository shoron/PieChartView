//
//  PieChartPartData.h
//  bzt
//
//  Created by shoron on 15/12/29.
//  Copyright © 2015年 com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SRPieChartRenderData : NSObject

@property (assign, nonatomic) CGFloat startAngle;
@property (assign, nonatomic) CGFloat endAngle;
@property (strong, nonatomic) UIColor *fillColor;
@property (strong, nonatomic) UIColor *strokeColor;
@property (assign, nonatomic) CGFloat innerRadius;
@property (assign, nonatomic) CGFloat outerRadius;
@property (assign, nonatomic) BOOL isRingStyle;
@property (assign, nonatomic, getter=isSelected) BOOL selected;
@property (assign, nonatomic) NSString *text;
@property (assign, nonatomic) BOOL showPercentage;

- (void)resetDefault;

@end
