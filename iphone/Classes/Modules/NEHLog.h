//
//  NEHLog.h
//  iphone
//
//  Created by hxl on 13-2-5.
//  Copyright (c) 2013年 hxl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NEHModule.h"

@class NEHModule;
@interface NEHLog : NEHModule
-(void)write:(NEHArgument *)argument;
@end
