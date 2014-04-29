//
//  ArrowVC.m
//  JoanMolinas
//
//  Created by Joan Molinas on 10/04/14.
//  Copyright (c) 2014 joan molinas ramon. All rights reserved.
//

#import "ArrowVC.h"

CGFloat distance(CGPoint p1, CGPoint p2)
{
    return sqrtf((p1.x-p2.x)*(p1.x-p2.x)+(p1.y-p2.y)*(p1.y-p2.y));
}

BOOL isValid(CGFloat separation, CGFloat radius) {
    return separation > 0.0f && separation <= 2*radius;
}

CGPoint findCentre(CGPoint p1, CGPoint p2, CGFloat radius, CGFloat separation, BOOL clockwise) {
    if(separation == 2*radius) {
        return CGPointMake((p1.x+p2.x)/2, (p1.y+p2.y)/2);
    }

    float mirrorDistance = sqrtf(radius * radius - separation * separation / 4);
    float mult = clockwise ? 1.0f : -1.0f;
    return CGPointMake((p1.x+p2.x)/2 + mult * mirrorDistance*(p1.y-p2.y)/separation, (p1.y+p2.y)/2 + mult * mirrorDistance*(p2.x-p1.x)/separation);
}

float findAngle(CGPoint from, CGPoint to) {

    float dy = to.y - from.y;
    float dx = to.x - from.x;
    return atan2f(dy, dx);
}


@interface ArrowVC()
@property CGPoint circleCenter;
@property CGFloat radius;
@property BOOL clockwise;
@property float startAngle;
@property float endAngle;

@property CGPoint toPoint;
@end

@implementation ArrowVC

- (id)initFromPoint:(CGPoint)fromPoint toPoint:(CGPoint)toPoint radius:(CGFloat)radius clockwise:(BOOL)clockwise {

    if (self = [super init]) {

        CGFloat separation = distance(fromPoint,toPoint);
        if (!isValid(separation, radius))
            radius = 0.5f * separation;

        self.circleCenter = findCentre(fromPoint, toPoint, radius, separation, clockwise);
        self.startAngle = findAngle(self.circleCenter, fromPoint);
        self.endAngle = findAngle(self.circleCenter, toPoint);

        self.toPoint = toPoint;
        self.radius = radius;
        self.clockwise = clockwise;

        self.arrowStrokeColor = [UIColor whiteColor];
        self.arrowLineWidth = 2.0f;
        self.arrowSidesLineLength = 20.0f;
    }
    return self;
}

- (NSArray *)calculateShapeLayers
{
    return [self shapesForArrow];
}

- (NSArray *)shapesForArrow
{
    UIBezierPath *arc = [UIBezierPath bezierPath];
    [arc addArcWithCenter:self.circleCenter radius:self.radius startAngle:self.startAngle endAngle:self.endAngle clockwise:self.clockwise];
    [arc setLineWidth:self.arrowLineWidth];
    CAShapeLayer *arcLayer = [self createShapeLayerWithPath:arc.CGPath];

    float mult = self.clockwise ? 1.0f : -1.0f;
    float arrowAngle = self.endAngle + mult * (float)M_PI_2;

    float leftAngle = arrowAngle - (float)(0.8*M_PI);
    float rightAngle = arrowAngle + (float)(0.8*M_PI);

    CAShapeLayer *leftLayer = [self shapeForLineWithAngle:leftAngle length:self.arrowSidesLineLength];
    CAShapeLayer *rightLayer = [self shapeForLineWithAngle:rightAngle length:self.arrowSidesLineLength];

    return @[arcLayer, leftLayer, rightLayer];
}

- (CAShapeLayer *)shapeForLineWithAngle:(float)angle length:(float)length {

    float dx = cosf(angle) * length;
    float dy = sinf(angle) * length;
    CGPoint arrowEnd = CGPointMake(self.toPoint.x + dx, self.toPoint.y + dy);

    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, self.toPoint.x, self.toPoint.y);
    CGPathAddLineToPoint(path, NULL, arrowEnd.x, arrowEnd.y);

    CAShapeLayer *shapeLayer = [self createShapeLayerWithPath:path];
    return shapeLayer;
}

- (CAShapeLayer *)createShapeLayerWithPath:(CGPathRef)path {
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = self.arrowStrokeColor.CGColor;
    shapeLayer.fillColor = self.arrowFillColor.CGColor;
    shapeLayer.lineWidth = self.arrowLineWidth;
    shapeLayer.lineJoin = kCALineJoinRound;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.path = path;
    return shapeLayer;
}

@end
