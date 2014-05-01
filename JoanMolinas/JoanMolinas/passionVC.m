//
//  passionVC.m
//  JoanMolinas
//
//  Created by Joan Molinas on 10/04/14.
//  Copyright (c) 2014 joan molinas ramon. All rights reserved.
//

#import "passionVC.h"
#import "JMScroll.h"
#import "UIViewController+MaryPopin.h"
#import "UIColor+ColorWithHex.h"
#import "ArrowView.h"

#define IS_IPHONE_5 (fabs((double)[[UIScreen mainScreen] bounds].size.height) > 480)

@interface passionVC ()<JMScrollDelegate>
@property (nonatomic, strong) JMScroll *scroll;
@property (nonatomic, strong) UIView *v1,*v2;
@property (nonatomic, strong) ArrowView *arrow;

@end

@implementation passionVC
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.frame = CGRectMake(0, 100, 320, 370);
    
    UIButton *b = [UIButton buttonWithType:UIButtonTypeSystem];
    [b setImage:[UIImage imageNamed:@"cancel"] forState:UIControlStateNormal];
    b.center= CGPointMake(self.view.frame.size.width/2-15, -30);
    [b setTintColor:[UIColor whiteColor]];
    [b sizeToFit];
    [b addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:b];
    
    _scroll=[[JMScroll alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 70)];
    _scroll.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height /2 - 10);
    _scroll.scrollDelegate = self;
    _scroll.showsPageControl = YES;
    _scroll.pagingEnabled = YES;
    _scroll.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_scroll];
    
    CGRect viewFrame = CGRectMake(0, 0, _scroll.frame.size.width -20, _scroll.frame.size.height);
    
    _v1 = [[UIView alloc] initWithFrame:viewFrame];
    _v1.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.97];
    _v1.layer.masksToBounds = YES;
    _v1.layer.cornerRadius = 8;
    
    UIImageView *v = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"heart2"]];
    v.frame  =CGRectMake(0, 0, 55,49);
    v.center = CGPointMake(_v1.frame.size.width/2, 50);
    [_v1 addSubview:v];
    
    UITextView *tv = [UITextView new];
    tv.frame = CGRectMake(8, 80, _v1.frame.size.width - 20, 290);
    tv.text =  @"I consider myself a person who likes trying everything arround the world, If I see the opportunity to do something, I do it. I want to try any kind of adventure whether I like it or not. \nFrom partying with friends to going to a 'Campus Party'. ";
    tv.textColor = [UIColor colorWithHexString:@"979797"];
    tv.backgroundColor = [UIColor clearColor];
    tv.font = [UIFont fontWithName:@"Avenir Next Ultra Light" size:17];
    tv.editable = NO;
    tv.textAlignment = NSTextAlignmentJustified;
    [_v1 addSubview:tv];
    
    [_scroll addView:_v1];
    
    _v2 = [[UIView alloc] initWithFrame:viewFrame];
    _v2.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.97];
    _v2.layer.masksToBounds = YES;
    _v2.layer.cornerRadius = 8;
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    _scrollView.delegate = self;
	_scrollView.contentSize = CGSizeMake(300*13, 300);
	[_scrollView scrollRectToVisible:CGRectMake(0,0,300,20) animated:NO];
    _scrollView.backgroundColor = [UIColor clearColor];
    
    
    for (int i = 0; i<13; i++){
        [self addImageWithName:[NSString stringWithFormat:@"i%i.png",i+1] atPosition:i];
    }
        
    
    [_v2 addSubview:_scrollView];
    [_scroll addView:_v2];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapGestureCaptured:)];
    [_scrollView addGestureRecognizer:singleTap];
    
    BOOL isRunMoreThanOnce= [[NSUserDefaults standardUserDefaults] boolForKey:@"isRunMoreThanOnce2"];
    if(!isRunMoreThanOnce){
    _arrow = [[ArrowView alloc] initWithFrame:CGRectMake(_v2.frame.size.width/2 - 50, 280, 100, 20)];
    self.arrow.arrowStrokeColor = [UIColor whiteColor];
    [self.arrow drawFromPoint:CGPointMake(0, 0) toPoint:CGPointMake(100, 0) radius:900 clockwise:NO];
    [_v2 addSubview:_arrow];
    
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isRunMoreThanOnce2"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    }
}
-(void)close{
    [self.presentingPopinViewController dismissCurrentPopinControllerAnimated:YES completion:^{}];
}
- (void)addImageWithName:(NSString*)imageString atPosition:(int)position {
	UIImage *image = [UIImage imageNamed:imageString];
	UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
	imageView.frame = CGRectMake(position*300, 0, 300, 300);
	[_scrollView addSubview:imageView];
}

- (void)singleTapGestureCaptured:(UITapGestureRecognizer *)gesture
{
    [_arrow removeFromSuperview];
}
@end
