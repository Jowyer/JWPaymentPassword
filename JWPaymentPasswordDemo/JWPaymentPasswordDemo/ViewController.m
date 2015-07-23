//
//  ViewController.m
//  JWPaymentPasswordDemo
//
//  Created by Jowyer on 15/7/23.
//  Copyright (c) 2015年 Jowyer. All rights reserved.
//

#import "ViewController.h"
#import "JWPaymentPasswordView.h"
#import "JWPaymentAlertController.h"

@implementation ViewController {
    JWPaymentPasswordView *ppView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)showAlert:(id)sender {
    JWAlertAction *leftAction = [JWAlertAction actionWithStyle:jwaasNormal Title:@"Cancel" handler:NULL];
    JWAlertAction *rightAction = [JWAlertAction actionWithStyle:jwaasStressed Title:@"Confirm" handler:^{
        NSLog(@"Confirm Tapped");
    }];
    [[JWPaymentAlertController sharedController] showWithTitle:@"Payment Password" Message:@"6 characters" LeftOption:leftAction RightOption:rightAction];
}

- (IBAction)showPasswordView:(id)sender {
    ppView = [[[NSBundle mainBundle] loadNibNamed:@"JWPaymentPasswordView" owner:self options:nil] objectAtIndex:0];
    ppView.frame = CGRectMake(0, 0, jwPaymentPasswordViewWidth, jwPaymentPasswordViewHeight);
    ppView.center = CGPointMake(self.view.center.x, 200);
    [ppView setViewBackgroundColor:[UIColor clearColor] BorderColor:[UIColor greenColor] DotColor:[UIColor blackColor]];
    [self.view addSubview:ppView];
}



@end
