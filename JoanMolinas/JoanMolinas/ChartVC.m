//
//  ChartVC.m
//  JoanMolinas
//
//  Created by joan molinas ramon on 10/04/14.
//  Copyright (c) 2014 joan molinas ramon. All rights reserved.
//

#import "ChartVC.h"
#import "UIViewController+MaryPopin.h"
#import "PNChart.h"
#import "UIColor+ColorWithHex.h"

#define IS_IPHONE_5 (fabs((double)[[UIScreen mainScreen] bounds].size.height) > 480)

@interface ChartVC () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tb;
@end

@implementation ChartVC
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.frame = CGRectMake(0, 30, 305,420);
    
    
    _tb = [[UITableView alloc] initWithFrame:CGRectMake(0, IS_IPHONE_5 ? 40 : 40, self.view.frame.size.width, self.view.frame.size.height - (IS_IPHONE_5 ? 0 : 30)) style:UITableViewStylePlain];
    _tb.delegate = self;
    _tb.dataSource = self;
    _tb.scrollEnabled = IS_IPHONE_5 ? NO : YES;
    _tb.separatorInset = UIEdgeInsetsZero;
    _tb.separatorColor = [UIColor clearColor];
    _tb.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.97];;
    _tb.layer.masksToBounds = YES;
    _tb.layer.cornerRadius = 8;
    [self.view addSubview:_tb];
    
    UIButton *b = [UIButton buttonWithType:UIButtonTypeSystem];
    [b setImage:[UIImage imageNamed:@"cancel"] forState:UIControlStateNormal];
    b.center= CGPointMake(self.view.frame.size.width/2-15,  IS_IPHONE_5 ? -5 : -3);
    [b setTintColor:[UIColor whiteColor]];
    [b sizeToFit];
    [b addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:b];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    
    if (cell == nil) cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"id"];
    
    NSArray *a = [NSArray arrayWithObjects:@"Objective-C",@"Java",@"C/C++",@"HTML5 / CSS3",@"JavaScript",@"Databases",@"UI Designer", nil];
    UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 170, 20)];
    switch (indexPath.row) {
        case 0:
            [self createChart:70 onView:cell colored:PNGreen];
            l.text  = a[indexPath.row];
            
            break;
        case 1:
            [self createChart:55 onView:cell colored:PNBlue];
            l.text =a[indexPath.row];
            break;
        case 2:
            [self createChart:50 onView:cell colored:PNYellow];
            l.text =a[indexPath.row];
            break;
        case 3:
            [self createChart:60 onView:cell colored:PNPinkGrey];
            l.text =a[indexPath.row];
            break;
        case 4:
            [self createChart:30 onView:cell colored:PNRed];
            l.text =a[indexPath.row];
            break;
        case 5:
            [self createChart:40 onView:cell colored:PNBrown];
            l.text =a[indexPath.row];
            break;
        case 6:
            [self createChart:70 onView:cell colored:PNDarkBlue];
            l.text =a[indexPath.row];
            break;
        default:
            break;
    }
    l.textAlignment = NSTextAlignmentRight;
    l.font = [UIFont fontWithName:@"Avenir Next Ultra Light" size:17];
    l.textColor = [UIColor colorWithHexString:@"979797"];
    [cell addSubview:l];
    
    cell.backgroundColor = [UIColor clearColor];
    cell.selectedBackgroundView = [UIView new];
    
    
    return cell;
}
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

-(void)createChart:(int)current onView:(UIView *)view colored:(UIColor *)color{
    PNCircleChart * circleChart = [[PNCircleChart alloc] initWithFrame:CGRectMake(25, 5, SCREEN_WIDTH, 40.0) andTotal:[NSNumber numberWithInt:100] andCurrent:[NSNumber numberWithInt:current] andClockwise:YES];
    circleChart.backgroundColor = [UIColor clearColor];
    [circleChart setStrokeColor:color];
    [circleChart strokeChart];
    [view addSubview:circleChart];
}
-(void)close{
    [self.presentingPopinViewController dismissCurrentPopinControllerAnimated:YES completion:^{}];
}
@end
