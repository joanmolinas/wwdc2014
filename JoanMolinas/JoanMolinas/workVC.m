//
//  workVC.m
//  JoanMolinas
//
//  Created by Joan Molinas on 09/04/14.
//  Copyright (c) 2014 joan molinas ramon. All rights reserved.
//

#import "workVC.h"
#import "UIViewController+MaryPopin.h"
#import "UIColor+ColorWithHex.h"

#define FONT @"Avenir Next Ultra Light"
#define IS_IPHONE_5 (fabs((double)[[UIScreen mainScreen] bounds].size.height) > 480)


@interface workVC () <UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *cv;

@end

@implementation workVC

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
    _cv=[[UICollectionView alloc] initWithFrame:CGRectMake(0, IS_IPHONE_5 ? 0 : 15, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:layout];
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
    
    UILabel *com = [UILabel new];
    com.center = CGPointMake(20, 12.5);
    com.font = [UIFont fontWithName:FONT size:15];
    com.textColor = [UIColor colorWithHexString:@"979797"];
    
    UILabel *roll = [UILabel new];
    roll.center = CGPointMake(20,32.5);
    roll.font = [UIFont fontWithName:FONT size:15];
    roll.textColor = [UIColor colorWithHexString:@"979797"];
    
    UILabel *date = [UILabel new];
    date.center = CGPointMake(20,52.5);
    date.font = [UIFont fontWithName:FONT size:15];
    date.textColor = [UIColor colorWithHexString:@"979797"];
    
    
    
    
    switch (indexPath.row) {
        case 0:
            com.text = @"Eat Out";
            roll.text = @"iOS Lead Developer";
            date.text = @"2013 to Actually";
            [self drawlineOnView:cell withColorHexString:@"16B5FA"];
            break;
        case 1:
            com.text = @"Uli Development";
            roll.text = @"CEO & iOS Developer";
            date.text = @"2012 to Actually";
            [self drawlineOnView:cell withColorHexString:@"A6E47E"];
            break;
        case 2:
            com.text = @"Impremta Ramon";
            roll.text = @"Digital printer & Designer";
            date.text = @"Summer 2010 - 2011 - 2013";
            [self drawlineOnView:cell withColorHexString:@"FB4343"];
            break;
        case 3:
            com.text = @"Le Meridien Ra ";
            roll.text = @"IT";
            date.text = @"October 2012 to September 2013";
            [self drawlineOnView:cell withColorHexString:@"F9B463"];
            break;
        default:
            break;
    }
    [date sizeToFit];
    [cell addSubview:date];
    [roll sizeToFit];
    [com sizeToFit];
    [cell addSubview:roll];
    [cell addSubview:com];
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
