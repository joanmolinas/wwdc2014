//
//  passionVC.h
//  JoanMolinas
//
//  Created by Joan Molinas on 10/04/14.
//  Copyright (c) 2014 joan molinas ramon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface passionVC : UIViewController <UIScrollViewDelegate>
@property (nonatomic, retain) UIScrollView *scrollView;
-(void)addImageWithName:(NSString *)imageString atPosition:(int)position;


@end
