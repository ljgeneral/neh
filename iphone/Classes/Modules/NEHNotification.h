//
//  NEHNotification.h
//  iphone
//
//  Created by hxl on 13-3-6.
//  Copyright (c) 2013年 NetEase FD. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioServices.h>
#import "NEHModule.h"

#import "NEHModule.h"

@interface NEHNotification : NEHModule<UIAlertViewDelegate>
- (void)alert:(NEHArgument*)nehArgument;
- (void)confirm:(NEHArgument*)nehArgument;
@end
@interface NEHUIAlertView : UIAlertView
@property (nonatomic,copy)NSString* callbackId;
@end