//
//  NEHModule.m
//  iphone
//
//  Created by hxl on 13-2-1.
//  Copyright (c) 2013年 hxl. All rights reserved.
//

#import "NEHModule.h"

@implementation NEHModule
@synthesize host=_host;
- (id)initWithHost:(NEHHost *)theHost
{
    self.host = theHost;
    return self;
};
- (void)successResult:(NEHResult *)result
           callbackId:(NSString *)callbackId
{
    [self.host callbackToJs:callbackId result:[result resultWithString] keepCallback:@"true"];
}
@end
