//
//  JWPaymentPasswordView.m
//  
//
//  Created by Jowyer on 15/7/10.
//
//

#import "JWPaymentPasswordView.h"
#import "JWPPDotView.h"

@implementation JWPaymentPasswordView {
    NSArray *dotsArray;
    JWBoolBlock myBlock;
}

-(void)awakeFromNib {
    self.hiddenTF.delegate = self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotification:) name:UITextFieldTextDidChangeNotification object:nil];
}

- (void)dealloc
{
    self.hiddenTF = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)setViewBackgroundColor:(UIColor *)bgColor BorderColor:(UIColor *)borderColor DotColor:(UIColor *)dotColor {
    JWPPDotView *dot1 = (JWPPDotView *)[self viewWithTag:1];
    JWPPDotView *dot2 = (JWPPDotView *)[self viewWithTag:2];
    JWPPDotView *dot3 = (JWPPDotView *)[self viewWithTag:3];
    JWPPDotView *dot4 = (JWPPDotView *)[self viewWithTag:4];
    JWPPDotView *dot5 = (JWPPDotView *)[self viewWithTag:5];
    JWPPDotView *dot6 = (JWPPDotView *)[self viewWithTag:6];
    dotsArray = @[dot1, dot2, dot3, dot4, dot5, dot6];
    
    self.backgroundColor = bgColor;
    self.layer.borderColor = borderColor.CGColor;
    self.layer.borderWidth = 1.0;
    
    for (JWPPDotView *dot in dotsArray) {
        [dot setDotBorderColor:borderColor FilledColor:dotColor];
        dot.filled = NO;
    }
    
    [self.hiddenTF becomeFirstResponder];
}

- (void)setFlagDidChangeHandler:(JWBoolBlock)handler {
    myBlock = handler;
}

- (void)handleNotification:(NSNotification *)notification {
    NSInteger count = self.hiddenTF.text.length;
    for (JWPPDotView *dot in dotsArray) {
        dot.filled = dot.tag <= count;
    }
    
    BOOL isSix = count == 6;
    if (self.isFinished != isSix) {
        self.isFinished = isSix;
        if (myBlock) {
            myBlock(self.isFinished);
        }
    }
}

#pragma mark - UITextField Delegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (range.location >= 6) {
        return NO;
    }
    return YES;
}

@end
