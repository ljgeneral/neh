//
//  NEHURLProtocol.m
//  iphone
//
//  Created by hxl on 13-1-31.
//  Copyright (c) 2013年 hxl. All rights reserved.
//

#import "NEHURLProtocol.h"

@implementation NEHURLProtocol

+ (BOOL)canInitWithRequest:(NSURLRequest*)theRequest
{
    NSURL *requestUrl = [theRequest URL];
    if([[requestUrl scheme] isEqualToString:@"neh"]){
        NEHHost* host = [[NEHHostManager sharedInstance] getHostForKey:[[requestUrl resourceSpecifier] substringFromIndex:2] ];
        [host performSelectorOnMainThread:@selector(getCommandsFromJs) withObject:nil waitUntilDone:NO];
    }
    return NO;
}


@end
