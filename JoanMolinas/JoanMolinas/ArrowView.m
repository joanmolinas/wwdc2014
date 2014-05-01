//
//  ArrowView.m
//  JoanMolinas
//
//  Created by Joan Molinas on 10/04/14.
//  Copyright (c) 2014 joan molinas ramon. All rights reserved.
//

#import "ArrowView.h"
#import "ArrowVC.h"

@interface ArrowView ()
@property ArrowVC *arrow;
@end

@implementation ArrowView

- (void)awakeFromNib
{
    self.activeClearColor = [UIColor whiteColor];
    self.inactiveClearColor = [UIColor whiteColor];
}

- (void)drawFromPoint:(CGPoint)fromPoint toPoint:(CGPoint)toPoint radius:(CGFloat)radius clockwise:(BOOL)clockwise {

    self.arrow = [[ArrowVC alloc] initFromPoint:fromPoint toPoint:toPoint radius:radius clockwise:clockwise];
    self.arrow.arrowStrokeColor = self.arrowStrokeColor;
    self.arrow.arrowFillColor = self.activeClearColor;

    NSArray *layers = [self.arrow calculateShapeLayers];
    for (CAShapeLayer *layer in layers) {
        [self.layer addSublayer:layer];
    }
}

- (void)setArrowStrokeColor:(UIColor *)arrowStrokeColor
{
    _arrowStrokeColor = arrowStrokeColor;
    if (self.arrow) {
        self.arrow.arrowStrokeColor = arrowStrokeColor;
    }
}


@end
