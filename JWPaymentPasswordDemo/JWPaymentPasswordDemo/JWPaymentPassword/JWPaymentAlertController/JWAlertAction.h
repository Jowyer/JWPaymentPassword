//
//  JWAlertAction.h
//  TestAlertView
//
//  Created by Jowyer on 15/7/22.
//  Copyright (c) 2015年 Jowyer. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{
    jwaasNormal = 0,
    jwaasStressed = 1
}JWAlertActionStyle;

typedef void(^JWBlock)(void);

@interface JWAlertAction : NSObject

@property (nonatomic) JWAlertActionStyle actionStyle;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) JWBlock handler;

+ (instancetype)actionWithStyle:(JWAlertActionStyle)style Title:(NSString *)title handler:(JWBlock)handler;

@end
