//
//  PieChartPartData.m
//  bzt
//
//  Created by shoron on 15/12/29.
//  Copyright © 2015年 com. All rights reserved.
//

#import "SRPieChartPartData.h"

@implementation SRPieChartPartData

@synthesize startAngle = _startAngle;
@synthesize endAngle = _endAngle;
@synthesize fillColor = _fillColor;
@synthesize strokeColor = _strokeColor;
@synthesize innerRadius = _innerRadius;
@synthesize outerRadius = _outerRadius;
@synthesize isRingStyle = _isRingStyle;
@synthesize selected = _selected;
@synthesize text = _text;

#pragma mark - Init

- (instancetype)init {
    self = [super init];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    self.startAngle = 0;
    self.endAngle = 0;
    self.fillColor = [UIColor yellowColor];
    self.strokeColor = [UIColor blackColor];
    self.innerRadius = 0;
    self.outerRadius = 0;
    self.isRingStyle = NO;
    self.selected = NO;
    self.text = @"";
}

- (void)resetDefault {
    [self commonInit];
}

#pragma mark - Getters && Setters

- (void)setIsRingStyle:(BOOL)isRingStyle {
    _isRingStyle = isRingStyle;
    if (isRingStyle) {
        self.innerRadius = self.outerRadius * 0.4;
    } else {
        self.innerRadius = 0;
    }
}

- (void)setOuterRadius:(CGFloat)outerRadius {
    _outerRadius = outerRadius;
    if (self.isRingStyle) {
        self.innerRadius = self.outerRadius * 0.4;
    } else {
        self.innerRadius = 0;
    }
}

@end
