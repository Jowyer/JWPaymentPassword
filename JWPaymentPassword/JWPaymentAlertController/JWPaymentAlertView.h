//
//  JWPaymentAlertView.h
//  TestAlertView
//
//  Created by Jowyer on 15/7/22.
//  Copyright (c) 2015年 Jowyer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JWPaymentPasswordView.h"
#import "JWAlertAction.h"

@interface JWPaymentAlertView : UIView
@property (strong, nonatomic) JWAlertAction *leftAction;
@property (strong, nonatomic) JWAlertAction *rightAction;

@property (weak, nonatomic) IBOutlet JWPaymentPasswordView *passwordView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;

@property (weak, nonatomic) IBOutlet UIView *contentPanel;
@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;

- (void)show;
@end
