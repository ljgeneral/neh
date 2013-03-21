//
//  NEHDevice.h
//  iphone
//
//  Created by hxl on 13-2-21.
//  Copyright (c) 2013年 NetEase FD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NEHModule.h"

@class NEHModule;
@interface NEHDevice : NEHModule
- (void)getDeviceInfo:(NEHArgument*)nehArgument;
@end
