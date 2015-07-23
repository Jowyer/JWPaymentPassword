//
//  JWPPDotView.m
//  TestPasswordView
//
//  Created by Jowyer on 15/7/10.
//  Copyright (c) 2015年 Jowyer. All rights reserved.
//

#import "JWPPDotView.h"

@implementation JWPPDotView {
    UIColor *borderColor;
    UIColor *filledColor;
}

-(void)awakeFromNib {
    self.layer.cornerRadius = 5.0;
}

-(void)setFilled:(BOOL)filled {
    if (filled) {
        self.backgroundColor = filledColor;
        self.layer.borderWidth = 0.0;
    } else {
        self.backgroundColor = [UIColor clearColor];
        self.layer.borderWidth = 1.0;
    }
}

- (void)setDotBorderColor:(UIColor *)bColor FilledColor:(UIColor *)fColor {
    borderColor = bColor;
    filledColor = fColor;
    self.layer.borderColor = borderColor.CGColor;
}

@end
