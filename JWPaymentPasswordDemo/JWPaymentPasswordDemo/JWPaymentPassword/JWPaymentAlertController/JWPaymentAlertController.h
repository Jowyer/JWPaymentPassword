//
//  JWPaymentAlertController.h
//  TestAlertView
//
//  Created by Jowyer on 15/7/22.
//  Copyright (c) 2015年 Jowyer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JWAlertAction.h"
#import "JWPaymentAlertView.h"

@interface JWPaymentAlertController : NSObject

@property (weak, nonatomic) JWPaymentAlertView *alertView;

+ (JWPaymentAlertController *)sharedController;

- (void)showWithTitle:(NSString *)title Message:(NSString *)message LeftOption:(JWAlertAction *)leftAction RightOption:(JWAlertAction *)rightAction;

@end
