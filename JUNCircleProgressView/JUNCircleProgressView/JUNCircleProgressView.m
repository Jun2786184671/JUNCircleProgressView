//
//  HomeProgressView.m
//  WeBox
//
//  Created by 马欣淳 on 2021/12/17.
//  Copyright © 2021 Staff004. All rights reserved.
//

#import "JUNCircleProgressView.h"

#define JUNCircleProgressMaskColor [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5]

@implementation JUNCircleProgressView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    if (_progress == 1.0) {
        return;
    }
    CGFloat outboardWidth = MIN(rect.size.width, rect.size.height) * 0.05;
    CGFloat radius = MIN(rect.size.width, rect.size.height) * 0.5 - outboardWidth;
    CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
    [JUNCircleProgressMaskColor set];
    
    UIBezierPath *boundPath = [UIBezierPath bezierPathWithRect:rect];
    boundPath.usesEvenOddFillRule = YES;
    
    if (_progress != 0) {
        UIBezierPath *outboardPath = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:-M_PI_2 endAngle:-M_PI_2 + M_PI * 2  clockwise:YES];
        outboardPath.lineWidth = outboardWidth;
        
        CGFloat startAngle = -M_PI_2;
        CGFloat endAngle = startAngle + _progress * (M_PI * 2);
        UIBezierPath *progressPath = [UIBezierPath bezierPathWithArcCenter:center radius:(radius - outboardWidth) startAngle:startAngle endAngle:endAngle clockwise:NO];
        [progressPath addLineToPoint:center];
        
        [boundPath appendPath:outboardPath];
        [boundPath appendPath:progressPath];
    }
    
    [boundPath fill];
}

- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    [self setNeedsDisplay];
}

@end
