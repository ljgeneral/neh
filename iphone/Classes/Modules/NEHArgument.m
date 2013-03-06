//
//  NEHArgument.m
//  iphone
//
//  Created by hxl on 13-2-1.
//  Copyright (c) 2013年 hxl. All rights reserved.
//

#import "NEHArgument.h"

@implementation NEHArgument
@synthesize callbackId=_callbackId;
@synthesize arguments=_arguments;
- (NEHArgument*) initWithCallbackId:(NSString*)jsCallbackId
                     methodArugments:(NSMutableArray*)methodArugments{
    self.callbackId=jsCallbackId;
    self.arguments=methodArugments;
    return self;
};

@end
