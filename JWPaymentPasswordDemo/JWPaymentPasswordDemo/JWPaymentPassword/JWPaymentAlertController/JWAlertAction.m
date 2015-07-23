//
//  JWAlertAction.m
//  TestAlertView
//
//  Created by Jowyer on 15/7/22.
//  Copyright (c) 2015年 Jowyer. All rights reserved.
//

#import "JWAlertAction.h"

@implementation JWAlertAction

+ (instancetype)actionWithStyle:(JWAlertActionStyle)style Title:(NSString *)title handler:(JWBlock)handler {
    JWAlertAction *action = [JWAlertAction new];
    action.actionStyle = style;
    action.title = title;
    action.handler = handler;
    return action;
}
@end
