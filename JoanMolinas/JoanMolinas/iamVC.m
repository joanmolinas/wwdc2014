//
//  iamVC.m
//  JoanMolinas
//
//  Created by Joan Molinas on 07/04/14.
//  Copyright (c) 2014 joan molinas ramon. All rights reserved.
//

#import "iamVC.h"
#import "UIColor+ColorWithHex.h"
#import "UIViewController+MaryPopin.h"
#import "JMScroll.h"
#import "ArrowView.h"
#import <MapKit/MapKit.h>

#define IS_IPHONE_5 (fabs((double)[[UIScreen mainScreen] bounds].size.height) > 480)

@interface iamVC ()<JMScrollDelegate,MKMapViewDelegate,UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) JMScroll *scroll;
@property (nonatomic, strong) UIView *view1, *view2,*view3;
@property (nonatomic, strong) MKMapView *map;
@property (nonatomic, strong) UITableView *tb;
@property(strong, nonatomic) ArrowView *arrow;


@end

@implementation iamVC


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.frame = CGRectMake(0, 100, 320,(IS_IPHONE_5 ? 478 : 410));

    UIButton *b = [UIButton buttonWithType:UIButtonTypeSystem];
    [b setImage:[UIImage imageNamed:@"cancel"] forState:UIControlStateNormal];
    b.center= CGPointMake(self.view.frame.size.width/2-15, -10);
    [b setTintColor:[UIColor whiteColor]];
    [b sizeToFit];
    [b addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:b];
    
    _scroll = [[JMScroll alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,self.view.frame.size.height -70)];
    _scroll.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height /2);
    _scroll.scrollDelegate = self;
    _scroll.showsPageControl = YES;
    _scroll.pagingEnabled = YES;
    _scroll.showsHorizontalScrollIndicator = NO;

    [self.view addSubview:_scroll];

    CGRect viewFrame = CGRectMake(0, 0, _scroll.frame.size.width -20, _scroll.frame.size.height);
    
    
    _view1 = [[UIView alloc] initWithFrame:viewFrame];
    _view1.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.97];
    _view1.layer.masksToBounds = YES;
    _view1.layer.cornerRadius = 8;

    CGFloat width = _view1.frame.size.width;
    CGFloat height = _view1.frame.size.height;
    
    UIImageView *yo = [[UIImageView alloc]  initWithImage:[UIImage imageNamed:@"i"]];
    yo.frame = CGRectMake(width/2 - 45, 18, 88, 88);
    yo.backgroundColor =  [UIColor grayColor];
    yo.layer.masksToBounds = YES;
    yo.layer.cornerRadius = 44;
    [_view1 addSubview:yo];
    
    UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(43.5, 136, 200, 0.5)];
    line.backgroundColor = [UIColor colorWithHexString:@"979797"];
    [_view1 addSubview:line];
    
    
    UITextView *tv = [UITextView new];
    tv.frame = CGRectMake(8, 150, 255, 290);
    tv.text =  @"My name is Joan Molinas, I'm 19 years old and I live in El Vendrell. I started programming when I was 14.\nI develope Apps, Webs, Librarys and anything I can think of.\nAt the moment I work on Eat Out as iOS Lead Developer and I make a websites.\nI love clean work.\nIt's a pleasure.";
    tv.textColor = [UIColor colorWithHexString:@"979797"];
    tv.backgroundColor = [UIColor clearColor];
    tv.font = [UIFont fontWithName:@"Avenir Next Ultra Light" size: IS_IPHONE_5 ? 15 : 13.5];
    tv.editable = NO;
    tv.textAlignment = NSTextAlignmentJustified;
   
    [_view1 addSubview:tv];
    
    [_scroll addView:_view1];
    
    _view2 = [[UIView alloc] initWithFrame:viewFrame];
    _view2.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.96];
    _view2.layer.masksToBounds = YES;
    _view2.layer.cornerRadius = 8;
    
    _map = [MKMapView new];
    _map.frame = CGRectMake(0, 0, width, (IS_IPHONE_5) ? 315 : 250);
    _map.delegate = self;
    _map.mapType = MKMapTypeStandard;
    _map.zoomEnabled = YES;
    _map.showsUserLocation = NO;
    
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    span.longitudeDelta = 0.005;
    span.latitudeDelta = 0.005;
    CLLocationCoordinate2D coordenada;
    coordenada.latitude = 41.22583834177893;
    coordenada.longitude = 1.5328770875930786;
    region.span = span;
    region.center = coordenada;
    [_map setRegion:region animated:YES];
    [_view2 addSubview:_map];
    [self addLocations];
    
    UIImageView *h = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"house"]];
    h.frame = CGRectMake(25, height - 80, 20, 20);
    [_view2 addSubview:h];
    
    UILabel *lh = [UILabel new];
    lh.center = CGPointMake(52, height - 80);
    lh.text = @"Camí dels molins 2, 3-2";
    lh.textColor = [UIColor colorWithHexString:@"979797"];
    [lh sizeToFit];
    lh.font = [UIFont fontWithName:@"Avenir Next Ultra Light" size:15];
    [_view2 addSubview:lh];
    
    
    UIImageView *w = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"world"]];
    w.frame = CGRectMake(25, height - 45, 20, 20);
    [_view2 addSubview:w];
    
    UILabel *lw = [UILabel new];
    lw.center = CGPointMake(52, height - 45);
    lw.text = @"El Vendrell, Spain";
    lw.textColor = [UIColor colorWithHexString:@"979797"];
    [lw sizeToFit];
    lw.font = [UIFont fontWithName:@"Avenir Next Ultra Light" size:15];
    [_view2 addSubview:lw];
    [_scroll addView:_view2];
    
    _view3 = [[UIView alloc] initWithFrame:viewFrame];
    _view3.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.98];
    _view3.layer.masksToBounds = YES;
    _view3.layer.cornerRadius = 8;
    
    _tb = [[UITableView alloc] initWithFrame:viewFrame style:UITableViewStylePlain];
    _tb.delegate = self;
    _tb.dataSource = self;
    _tb.backgroundColor = [UIColor clearColor];
    _tb.separatorInset = UIEdgeInsetsZero;
    _tb.separatorColor = [UIColor clearColor];
    _tb.tableFooterView = [UIView new];
    _tb.tableHeaderView = [self headerTable];
    _tb.scrollEnabled = IS_IPHONE_5 ? NO : YES;
    [_view3 addSubview:_tb];
    
    
    [_scroll addView:_view3];
    
    
    BOOL isRunMoreThanOnce = [[NSUserDefaults standardUserDefaults] boolForKey:@"isRunMoreThanOnce"];
    if(!isRunMoreThanOnce){
        _arrow = [[ArrowView alloc] initWithFrame:CGRectMake(_scroll.frame.size.width/2 - 50, 480, 100, 40)];
        self.arrow.arrowStrokeColor = [UIColor whiteColor];
        [self.arrow drawFromPoint:CGPointMake(0, 0) toPoint:CGPointMake(100, 0) radius:90 clockwise:NO];
        [self.view addSubview:_arrow];
    
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isRunMoreThanOnce"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
}
#pragma mark  - Tableview data Source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    
    if (cell == nil) cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"id"];
    cell.backgroundColor = [UIColor clearColor];
    
    NSArray *a = @[@"fb",@"tw",@"ins",@"3w",@"mbl",@"mail"];
    NSArray *t = @[@"/joan.molinas1",@"/JoanMolinas",@"/JoanMolinas",@"www.joanmolinas.com",@"+34 646 548 142",@"joanm@ulidev.com"];
    
    UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:a[indexPath.row]]];
    img.center = CGPointMake(36, 25);
    [cell addSubview:img];
    
    UILabel *l = [UILabel new];
    l.center = CGPointMake(60, 15);
    l.text = t[indexPath.row];
    l.textColor = [UIColor colorWithHexString:@"979797"];
    l.font = [UIFont fontWithName:@"Avenir Next Ultra Light" size:15];
    [l sizeToFit];
    [cell addSubview:l];
    
    cell.selectedBackgroundView = [UIView new];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}
-(UIView *)headerTable {
    
    UIView *head = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 90)];
    head.backgroundColor=[UIColor clearColor];
    
    UIImageView *i = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"plus"]];
    i.center = CGPointMake(_scroll.frame.size.width/2 - 12.5, 50);
    [head addSubview:i];
    
    UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(43.5, 80, 200, 0.5)];
    l.backgroundColor = [UIColor colorWithHexString:@"979797"];
    [head addSubview:l];
    
    return head;
}



-(void)close{
    [self.presentingPopinViewController dismissCurrentPopinControllerAnimated:YES completion:^{}];
}
- (void)scrollAnimated
{
    [_scroll setContentOffset:CGPointMake(_scroll.frame.size.width * 2, 0) animated:YES];
}
-(void)addLocations{
    CLLocationCoordinate2D coordenada;
    MKPointAnnotation *an = [MKPointAnnotation new];
    coordenada.latitude = 41.22583834177893;
    coordenada.longitude = 1.5328770875930786;
    an.title = @"My Home";
    an.coordinate = coordenada;

    MKCoordinateRegionMakeWithDistance(coordenada, 50, 50);
    
    [_map addAnnotation:an];
}
@end
