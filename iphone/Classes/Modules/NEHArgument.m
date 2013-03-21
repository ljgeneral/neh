//
//  NEHArgument.m
//  iphone
//
//  Created by hxl on 13-2-1.
//  Copyright (c) 2013年 NetEase FD. All rights reserved.
//

#import "NEHArgument.h"

@implementation NEHArgument
@synthesize callbackId=_callbackId;
@synthesize arguments=_arguments;
- (NEHArgument*) initWithCallbackId:(NSString*)theCallbackId
                          arugments:(NSArray*)theArguments{
    self.callbackId=[theCallbackId copy];
    self.arguments=theArguments;
    return self;
}

@end
