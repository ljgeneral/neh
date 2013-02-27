//
//  NEHResult.m
//  iphone
//
//  Created by hxl on 13-2-1.
//  Copyright (c) 2013年 hxl. All rights reserved.
//

#import "NEHResult.h"

@implementation NEHResult
@synthesize result=_result;
@synthesize message=_message;
@synthesize data=_data;
@synthesize keepCallback=_keepCallback;
-(NEHResult *)initWithCallback{
    return self;
};
@end
