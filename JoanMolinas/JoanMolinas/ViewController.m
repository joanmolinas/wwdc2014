//
//  ViewController.m
//  JoanMolinas
//
//  Created by joan molinas ramon on 04/04/14.
//  Copyright (c) 2014 joan molinas ramon. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+MaryPopin.h"
#import "iamVC.h"
#import "SchoolVC.h"
#import "workVC.h"
#import "ChartVC.h"
#import "UIColor+ColorWithHex.h"
#import "passionVC.h"
#import "ArrowView.h"
#import "awardVC.h"

@interface ViewController ()
@property (nonatomic, retain) NSArray *a;
@property (nonatomic, getter = isDismissable) BOOL dismissable;
@property (nonatomic, strong) ArrowView *arrow;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    UIImageView *i = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background"]];
    i.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:i];

    
    _a = [[NSArray alloc] initWithObjects:_iam,_school,_cv,_bulb,_heart,_award, nil];
    
    for (int i=0; i<_a.count; i++) {
        [self roundButton:_a[i] view:self.view];
    }
    [_iam addTarget:self action:@selector(myLife) forControlEvents:UIControlEventTouchUpInside];
    [_school addTarget:self action:@selector(schoolVC) forControlEvents:UIControlEventTouchUpInside];
    [_cv addTarget:self action:@selector(workVC) forControlEvents:UIControlEventTouchUpInside];
    [_bulb  addTarget:self action:@selector(chartVC) forControlEvents:UIControlEventTouchUpInside];
    [_heart  addTarget:self action:@selector(passions) forControlEvents:UIControlEventTouchUpInside];
    [_award  addTarget:self action:@selector(awards) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)roundButton:(UIButton *)buton view:(UIView *)view{
    buton.layer.cornerRadius = (buton == _iam) ? 113/2 : 37;
    buton.layer.masksToBounds = YES;
    [self.view addSubview:buton];
}
-(void)myLife{
    iamVC *vc = [[iamVC alloc] init];
    [vc setPopinTransitionStyle:BKTPopinTransitionStyleZoom];
    [self presentPopinController:vc animated:YES completion:nil];
}
-(void)schoolVC{
    SchoolVC *vc = [[SchoolVC alloc] init];
    [vc setPopinTransitionStyle:BKTPopinTransitionStyleZoom];
    [self presentPopinController:vc animated:YES completion:nil];
}
-(void)workVC{
    workVC *vc = [[workVC alloc] init];
    [vc setPopinTransitionStyle:BKTPopinTransitionStyleZoom];
    [self presentPopinController:vc animated:YES completion:nil];
}
-(void)chartVC{
    ChartVC *vc = [[ChartVC alloc] init];
    [vc setPopinTransitionStyle:BKTPopinTransitionStyleZoom];
    [self presentPopinController:vc animated:YES completion:nil];
}
-(void)passions{
    passionVC *vc = [[passionVC alloc] init];
    [vc setPopinTransitionStyle:BKTPopinTransitionStyleZoom];
    [self presentPopinController:vc animated:YES completion:nil];
}
-(void)awards{
    awardVC *vc = [[awardVC alloc] init];
    [vc setPopinTransitionStyle:BKTPopinTransitionStyleZoom];
    [self presentPopinController:vc animated:YES completion:nil];
}
@end











