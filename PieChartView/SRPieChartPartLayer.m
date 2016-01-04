//
//  SRPieChartPartLayer.m
//  bzt
//
//  Created by shoron on 15/12/28.
//  Copyright © 2015年 com. All rights reserved.
//

#import "SRPieChartPartLayer.h"

@interface SRPieChartPartLayer ()

@property (strong, nonatomic) CATextLayer *textLayer;

@end

@implementation SRPieChartPartLayer

- (void)refreshLayer {
    [self setNeedsDisplay];
}

#pragma mark - Draw Layer

- (void)drawInContext:(CGContextRef)ctx {
    
    // draw layer
    CGPoint center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    if (self.data.isRingStyle) {
        CGContextBeginPath(ctx);
        CGContextSetFillColorWithColor(ctx, self.data.fillColor.CGColor);
        CGContextSetStrokeColorWithColor(ctx, self.data.fillColor.CGColor);
        CGContextSetLineWidth(ctx, 1);
        CGContextMoveToPoint(ctx, center.x, center.y);
        CGContextAddArc(ctx, center.x, center.y, self.data.outerRadius, self.data.startAngle, self.data.endAngle, 0);
        CGContextClosePath(ctx);
        CGContextDrawPath(ctx, kCGPathFillStroke);

        CGContextBeginPath(ctx);
        CGContextSetFillColorWithColor(ctx, [UIColor whiteColor].CGColor);
        CGContextSetStrokeColorWithColor(ctx, [UIColor whiteColor].CGColor);
        CGContextSetLineWidth(ctx, 3);
        CGContextMoveToPoint(ctx, center.x, center.y);
        CGContextAddArc(ctx, center.x, center.y, self.data.innerRadius, self.data.startAngle, self.data.endAngle, 0);
        CGContextClosePath(ctx);
        CGContextDrawPath(ctx, kCGPathFillStroke);
    } else {
        CGContextBeginPath(ctx);
        CGContextSetFillColorWithColor(ctx, self.data.fillColor.CGColor);
        CGContextSetStrokeColorWithColor(ctx, self.data.strokeColor.CGColor);
        CGContextSetLineWidth(ctx, 0.1);
        CGContextMoveToPoint(ctx, center.x, center.y);
        CGContextAddArc(ctx, center.x, center.y, self.data.outerRadius, self.data.startAngle, self.data.endAngle, 0);
        CGContextClosePath(ctx);
        CGContextDrawPath(ctx, kCGPathFillStroke);
        if (self.data.showPercentage) {
            [self addSublayer:self.textLayer];
            CGFloat averageArc = (self.data.startAngle + self.data.endAngle) / 2.0;
            CGPoint drawTextPoint = [self pointForCircleCenter:center radius:self.data.outerRadius / 2.0 angle:averageArc];
            [self.textLayer setFrame:CGRectMake(drawTextPoint.x, drawTextPoint.y, 50, 20)];
            self.textLayer.string = @"26%";
        } else {
            [self.textLayer removeFromSuperlayer];
        }
    }
    
    // color
    if (self.data.isSelected) {
        CGFloat direction = self.data.outerRadius / 9;
        CGFloat angle = self.data.startAngle + (self.data.endAngle - self.data.startAngle) / 2;
        self.transform = CATransform3DMakeTranslation(direction * cosf(angle), direction * sinf(angle), 0);
    } else {
        self.transform = CATransform3DMakeTranslation(0, 0, 0);
    }
}

- (CGPoint)pointForCircleCenter:(CGPoint)center radius:(CGFloat)radius angle:(CGFloat)angle {
    if (radius < 0) {
        return center;
    }
    return CGPointMake(center.x + radius * cosf(angle), center.y + sinf(angle));
}

#pragma mark - Getters && Setters

- (CATextLayer *)textLayer {
    if (!_textLayer) {
        _textLayer = [CATextLayer layer];
        _textLayer.bounds = self.bounds;
    }
    return _textLayer;
}

@end
