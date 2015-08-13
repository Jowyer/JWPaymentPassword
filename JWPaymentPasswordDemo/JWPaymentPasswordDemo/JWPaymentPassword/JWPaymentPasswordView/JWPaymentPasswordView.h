//
//  JWPaymentPasswordView.h
//  
//
//  Created by Jowyer on 15/7/10.
//
//

#import <UIKit/UIKit.h>

static const float jwPaymentPasswordViewWidth = 220.0;
static const float jwPaymentPasswordViewHeight = 38.0;
typedef void(^JWBoolBlock)(BOOL isTrue);

@interface JWPaymentPasswordView : UIView <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *hiddenTF;
@property (nonatomic) BOOL isFinished;


- (void)setViewBackgroundColor:(UIColor *)bgColor BorderColor:(UIColor *)borderColor DotColor:(UIColor *)dotColor;

- (void)setFlagDidChangeHandler:(JWBoolBlock)handler;

- (void)resetPaymentPasswordView;
@end
