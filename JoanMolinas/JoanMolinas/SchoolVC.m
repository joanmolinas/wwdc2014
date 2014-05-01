//
//  SchoolVC.m
//  JoanMolinas
//
//  Created by joan molinas ramon on 08/04/14.
//  Copyright (c) 2014 joan molinas ramon. All rights reserved.
//

#import "SchoolVC.h"
#import "JMColCV.h"
#import "UIViewController+MaryPopin.h"
#import "UIColor+ColorWithHex.h"
#import "ArrowView.h"

@interface SchoolVC ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UICollectionView *cv;
@property (nonatomic, strong) UITableView *tb;
@property NSArray *a,*b,*c;
@property (nonatomic, strong) UILabel *l;
@property (nonatomic) NSUInteger numTaps;
@property (nonatomic, strong) JMColCV *dialLayout;

@end
@implementation SchoolVC
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor clearColor];
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    _cv = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height) collectionViewLayout:layout];
    _cv.dataSource = self;
    _cv.delegate = self;
    
    [_cv registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"id"];
    _cv.backgroundColor = [UIColor clearColor];
    

    _dialLayout = [[JMColCV alloc] initWithRadius:300.0  andAngularSpacing:41.0 andCellSize:CGSizeMake(305, 242) andAlignment:WHEELALIGNMENTCENTER andItemHeight:252  andXOffset:160];
    [_cv setCollectionViewLayout:_dialLayout];
    [self.view addSubview:_cv];
    
    
    UIButton *b = [UIButton buttonWithType:UIButtonTypeSystem];
    [b setImage:[UIImage imageNamed:@"cancel"] forState:UIControlStateNormal];
    b.center= CGPointMake(self.view.frame.size.width - 50, 40);
    [b setTintColor:[UIColor whiteColor]];
    [b sizeToFit];
    [b addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:b];
    
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"id" forIndexPath:indexPath];
    cell.backgroundColor=[UIColor clearColor];
    cell.layer.masksToBounds = YES;
    cell.layer.cornerRadius = 8;
    
    _tb = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 305, 242) style:UITableViewStylePlain];
    _tb.delegate = self;
    _tb.dataSource = self;
    _tb.backgroundColor = [UIColor whiteColor];
    _tb.separatorInset = UIEdgeInsetsZero;
    _tb.separatorColor = [UIColor clearColor];
    _tb.tableFooterView = [UIView new];
    _tb.scrollEnabled = YES;
    
    
    
    _a = [NSArray arrayWithObjects:@"Course:",@"Time:",@"Location:",@"Current Grade:",nil];
    _c = [NSArray arrayWithObjects:@"Sagrat Cor",@"Sagrat Cor", @"INS Camí de Mar",@"Cepi-Base",@"IES Ausias March",@"Diplomas", nil];
        
    switch (indexPath.row) {
        case 0:
            _b = [NSArray arrayWithObjects:@"Primary",@"2000 - 2006 ",@"El Vendrell ",@"9/10",nil];
            _tb.tableHeaderView = [self headerTable:_c[indexPath.row]];
            break;
        case 1:
            _b = [NSArray arrayWithObjects:@"High School",@"2006 - 2010 ",@"El Vendrell ",@"7.8/10",nil];
            _tb.tableHeaderView = [self headerTable:_c[indexPath.row]];
            break;
        case 2:
            _b = [NSArray arrayWithObjects:@"SMX (Medium Degree)",@"2010 - 2012 ",@"Calafell",@"8.3/10",nil];
            _tb.tableHeaderView = [self headerTable:_c[indexPath.row]];
            break;
        case 3:
            _b = [NSArray arrayWithObjects:@"Java-SQL",@"2012 - 2013 ",@"Barcelona",@"9.5/10",nil];
            _tb.tableHeaderView = [self headerTable:_c[indexPath.row]];
            break;
        case 4:
            _b = [NSArray arrayWithObjects:@"DAM (Superior Degree)",@"2013 - Actually ",@"Barcelona",@"*/10",nil];
            _tb.tableHeaderView = [self headerTable:_c[indexPath.row]];
            break;

        default:
            break;
    }

    [cell addSubview:_tb];
    return cell;
}
#pragma mark  - Tableview data Source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    
    if (cell == nil) cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"id"];
    
    
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = [NSString stringWithFormat:@" %@ %@",_a[indexPath.row] ,_b[indexPath.row]];
    cell.textLabel.font = [UIFont fontWithName:@"Avenir Next Ultra Light" size:17];
    cell.textLabel.textColor = [UIColor colorWithHexString:@"979797"];
    cell.selectedBackgroundView = [UIView new];
    return cell;
}


-(void)close{
    [self.presentingPopinViewController dismissCurrentPopinControllerAnimated:YES completion:^{}];
}
-(UIView *)headerTable:(NSString *)school {
    UIView *head = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 45)];
    head.backgroundColor=[UIColor clearColor];
   
    UILabel *n = [UILabel new];
    n.frame = CGRectMake(0, 10, _tb.frame.size.width, 30);
    n.textAlignment = NSTextAlignmentCenter;
    n.text = school;
    n.font = [UIFont fontWithName:@"Avenir Next Ultra Light" size:23];
    n.textColor = [UIColor colorWithHexString:@"979797"];
    [head addSubview:n];
    
    UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(20, 45, 265, 0.5)];
    l.backgroundColor = [UIColor colorWithHexString:@"979797"];
    [head addSubview:l];
    
    return head;
}

@end
