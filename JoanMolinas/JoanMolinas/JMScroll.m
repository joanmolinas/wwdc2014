//
//  JMScroll.m
//  JoanMolinas
//
//  Created by joan molinas ramon on 04/04/14.
//  Copyright (c) 2014 joan molinas ramon. All rights reserved.
//


#import "JMScroll.h"
#import "UIColor+ColorWithHex.h"

#define IS_IPHONE_5 (fabs((double)[[UIScreen mainScreen] bounds].size.height) > 480)



@interface JMScroll () <UIScrollViewDelegate> {
    NSInteger numberOfPages;
    NSInteger privateIndex;
}

@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation JMScroll

- (CGFloat)width
{
    return self.frame.size.width;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        privateIndex = 1;
        self.delegate = self;
    }
    return self;
}

- (void)addView:(UIView *)view
{
    self.contentSize = CGSizeMake(self.width * ++numberOfPages, self.height);
    
    view.center = CGPointMake(self.width/2 * privateIndex, self.height/2);
    [self addSubview:view];
    
    privateIndex += 2;
}
- (void)addViews:(NSArray *)views
{
    for (UIView *v in views) {
        [self addView:v];
    }
}

- (void)scrollToPageAtIndex:(NSInteger)index animated:(BOOL)animated
{
    [self setContentOffset:CGPointMake(self.width * index, 0) animated:animated];
}

- (void)addPageControl
{
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, self.width, 00)];
    self.pageControl.center = CGPointMake(self.width/2, self.height + ((IS_IPHONE_5) ? 45 : 60));
    self.pageControl.numberOfPages = numberOfPages;
    self.pageControl.pageIndicatorTintColor = [UIColor colorWithWhite:1.0 alpha:0.6];
    self.pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    
    [self.superview addSubview:self.pageControl];
}

- (void)setShowsPageControl:(BOOL)showsPageControl
{
    if (showsPageControl) [self performSelectorOnMainThread:@selector(addPageControl) withObject:nil waitUntilDone:NO];
}

#pragma mark - ScrollView Delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.pageControl.currentPage = lround(self.contentOffset.x / self.width);

    if ([self.scrollDelegate respondsToSelector:@selector(scrollView:didScrollToPageAtIndex:)]) {
        [self.scrollDelegate scrollView:self didScrollToPageAtIndex:lround(self.contentOffset.x / self.width)];
    }
    
    if ([self.scrollDelegate respondsToSelector:@selector(scrollView:didScrollWithContentOffset:)]) {
        [self.scrollDelegate scrollView:self didScrollWithContentOffset:self.contentOffset];
    }
}

@end
