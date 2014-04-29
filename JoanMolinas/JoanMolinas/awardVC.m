//
//  awardVC.m
//  JoanMolinas
//
//  Created by Joan Molinas on 11/04/14.
//  Copyright (c) 2014 joan molinas ramon. All rights reserved.
//

#import "awardVC.h"
#import "UIColor+ColorWithHex.h"
#import "UIViewController+MaryPopin.h"

#define FONT @"Avenir Next Ultra Light"
#define IS_IPHONE_5 (fabs((double)[[UIScreen mainScreen] bounds].size.height) > 480)

@interface awardVC () <UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *cv;

@end

@implementation awardVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.frame = CGRectMake(0, 30, 305,370);
    
    UIButton *b = [UIButton buttonWithType:UIButtonTypeSystem];
    [b setImage:[UIImage imageNamed:@"cancel"] forState:UIControlStateNormal];
    b.center= CGPointMake(self.view.frame.size.width/2-15, IS_IPHONE_5 ? -45 : -30);
    [b setTintColor:[UIColor whiteColor]];
    [b sizeToFit];
    [b addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:b];
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    _cv = [[UICollectionView alloc] initWithFrame:CGRectMake(0, IS_IPHONE_5 ? 0 : 15, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:layout];
    [_cv setDataSource:self];
    [_cv setDelegate:self];
    
    [_cv registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    
    [_cv setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:_cv];

}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    
    cell.backgroundColor=[UIColor colorWithWhite:1.0 alpha:0.97];
    
    UILabel *name = [UILabel new];
    name.center = CGPointMake(20, 23.5);
    name.font = [UIFont fontWithName:FONT size:15];
    name.textColor = [UIColor colorWithHexString:@"979797"];
    
    UILabel *date = [UILabel new];
    date.center = CGPointMake(20,43.5);
    date.font = [UIFont fontWithName:FONT size:15];
    date.textColor = [UIColor colorWithHexString:@"979797"];
    
    switch (indexPath.row) {
        case 0:
            name.text = @"Secondary Education Graduate";
            date.text = @"Year: 2010";
            [self drawlineOnView:cell withColorHexString:@"9B9B9B"];
            break;
        case 1:
            name.text = @"Computer Technician Average Grade";
            date.text = @"Year: 2012";
            [self drawlineOnView:cell withColorHexString:@"8555B9"];
            break;
        case 2:
            name.text = @"Java-SQL Certificate";
            date.text = @"Year: 2013";
            [self drawlineOnView:cell withColorHexString:@"4955CB"];
            break;
        case 3:
            name.text = @"Winner Robocode School League";
            date.text = @"Year: 2014";
            [self drawlineOnView:cell withColorHexString:@"DE65A9"];
            break;
        default:
            break;
    }
    [date sizeToFit];
    [cell addSubview:date];
    [name sizeToFit];
    [cell addSubview:name];
    return cell;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(305, 85);
}



-(void)close{
    [self.presentingPopinViewController dismissCurrentPopinControllerAnimated:YES completion:^{}];
}
-(UILabel *)drawlineOnView:(UIView *)view withColorHexString:(NSString *)color{
    UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,2, 85)];
    line.backgroundColor = [UIColor colorWithHexString:color];
    
    [view addSubview:line];
    return line;
}

@end
