//
//  JWPaymentAlertController.m
//  TestAlertView
//
//  Created by Jowyer on 15/7/22.
//  Copyright (c) 2015年 Jowyer. All rights reserved.
//

#import "JWPaymentAlertController.h"
#import "JWPaymentAlertView.h"

@implementation JWPaymentAlertController

+ (JWPaymentAlertController *)sharedController {
    static JWPaymentAlertController *sharedInstance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [JWPaymentAlertController new];
    });
    
    return sharedInstance;
}

- (void)showWithTitle:(NSString *)title Message:(NSString *)message LeftOption:(JWAlertAction *)leftAction RightOption:(JWAlertAction *)rightAction {
    JWPaymentAlertView *alertView = [[[NSBundle mainBundle] loadNibNamed:@"JWPaymentAlertView" owner:self options:nil] objectAtIndex:0];
    
    alertView.titleLabel.text = title;
    alertView.messageLabel.text = message;
    alertView.leftAction = leftAction;
    alertView.rightAction = rightAction;
    
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    alertView.frame = CGRectMake(0, 0, screenSize.width, screenSize.height);
    
    [[UIApplication sharedApplication].delegate.window addSubview:alertView];
    
    [alertView show];
}

@end
