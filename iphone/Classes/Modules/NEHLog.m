//
//  NEHLog.m
//  iphone
//
//  Created by hxl on 13-2-5.
//  Copyright (c) 2013年 hxl. All rights reserved.
//

#import "NEHLog.h"

@implementation NEHLog
-(void)write:(NEHArgument* )nehArgument{
    NSString *message = [nehArgument.arguments objectAtIndex:0];
    NSLog(message);
}
@end
