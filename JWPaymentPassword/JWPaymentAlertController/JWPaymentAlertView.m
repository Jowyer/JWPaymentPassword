//
//  JWPaymentAlertView.m
//  TestAlertView
//
//  Created by Jowyer on 15/7/22.
//  Copyright (c) 2015年 Jowyer. All rights reserved.
//

#import "JWPaymentAlertView.h"

@implementation JWPaymentAlertView

- (void)dealloc
{
    NSLog(@"2");
}

- (void)show {
    CGRect storyboardFrame = self.passwordView.frame;
    self.passwordView = [[[NSBundle mainBundle] loadNibNamed:@"JWPaymentPasswordView" owner:self options:nil] objectAtIndex:0];
    self.passwordView.frame = storyboardFrame;
    [self.passwordView setViewBackgroundColor:[UIColor clearColor] BorderColor:[UIColor lightGrayColor] DotColor:[UIColor orangeColor]];
    [self.passwordView setFlagDidChangeHandler:^(BOOL isTrue) {
        self.rightButton.enabled = isTrue;
    }];
    [self.contentPanel addSubview:self.passwordView];
    
    [self.leftButton setTitle:self.leftAction.title forState:UIControlStateNormal];
    UIFont *leftFont = self.leftAction.actionStyle == jwaasNormal ? [UIFont systemFontOfSize:12] : [UIFont boldSystemFontOfSize:13];
    self.leftButton.titleLabel.font = leftFont;

    [self.rightButton setTitle:self.rightAction.title forState:UIControlStateNormal];
    UIFont *rightFont = self.rightAction.actionStyle == jwaasNormal ? [UIFont systemFontOfSize:12] : [UIFont boldSystemFontOfSize:13];
    self.rightButton.titleLabel.font = rightFont;
    self.rightButton.enabled = NO;
    
    self.alpha = 0;
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.alpha = 1;
    } completion:NULL];
}

- (IBAction)leftButtonTapped:(id)sender {
    if (self.leftAction.handler) {
        self.leftAction.handler();
    }
    [self dismiss];
}

- (IBAction)rightButtonTapped:(id)sender {
    if (self.rightAction.handler) {
        self.rightAction.handler();
    }
    [self dismiss];
}

- (void)dismiss {
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        [self.passwordView removeFromSuperview];
    }];
}

@end
