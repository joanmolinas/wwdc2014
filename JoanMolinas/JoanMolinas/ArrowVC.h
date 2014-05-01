//
//  ArrowVC.h
//  JoanMolinas
//
//  Created by Joan Molinas on 10/04/14.
//  Copyright (c) 2014 joan molinas ramon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArrowVC : NSObject

/*
 @param fromPoint point where the arrow starts
 @param toPoint point where the arrow ends
 @param radius radius of circle passing between two points. If radius is too small, it is set to half the distance between the points (resulting in a semi-circle)
 @param clockwise whether the arrow direction is along the circle is clockwise or anti-clockwise
 */
- (id)initFromPoint:(CGPoint)fromPoint toPoint:(CGPoint)toPoint radius:(CGFloat)radius clockwise:(BOOL)clockwise;

/*
 Draws the arrow.
 @return Array of CAShapeLayers representing the arrow
 */
- (NSArray *)calculateShapeLayers;

/*
 Arrow color
 */
@property (strong) UIColor *arrowStrokeColor;
@property (strong) UIColor *arrowFillColor;
/*
 Line width for the arrow
 */
@property float arrowLineWidth;
@property float arrowSidesLineLength;

@end
