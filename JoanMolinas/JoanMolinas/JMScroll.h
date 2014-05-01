//
//  JMScroll.m
//  JoanMolinas
//
//  Created by joan molinas ramon on 04/04/14.
//  Copyright (c) 2014 joan molinas ramon. All rights reserved.
//


#import <UIKit/UIKit.h>

@class JMScroll;

@protocol JMScrollDelegate <NSObject>
@optional
- (void)scrollView:(JMScroll *)scroll didScrollToPageAtIndex:(NSInteger)index;
- (void)scrollView:(JMScroll *)scroll didScrollWithContentOffset:(CGPoint)offset;
@end

@interface JMScroll : UIScrollView

@property (nonatomic, weak) id <JMScrollDelegate> scrollDelegate;
@property (nonatomic, assign) BOOL showsPageControl;

- (void)addView:(UIView *)view;
- (void)addViews:(NSArray *)views;

- (void)scrollToPageAtIndex:(NSInteger)index animated:(BOOL)animated;
@end



