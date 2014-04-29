//
//  ArrowView.h
//  JoanMolinas
//
//  Created by Joan Molinas on 10/04/14.
//  Copyright (c) 2014 joan molinas ramon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArrowView : UIView

- (void)drawFromPoint:(CGPoint)fromPoint toPoint:(CGPoint)toPoint radius:(CGFloat)radius clockwise:(BOOL)clockwise;


@property(strong, nonatomic) UIColor *activeClearColor;
@property(strong, nonatomic) UIColor *inactiveClearColor;
@property(strong, nonatomic) UIColor *arrowStrokeColor;

@end