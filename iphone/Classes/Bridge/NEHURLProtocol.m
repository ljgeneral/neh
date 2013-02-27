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
    NSString* urlString = [[theRequest URL] absoluteString];
    BOOL result = [urlString hasPrefix:@"neh"];
    if(result){
        NEHHost* host = [[NEHHostManager sharedInstance] getHostForKey:@"aaa"];
        [host performSelectorOnMainThread:@selector(getCommandsFromJs) withObject:nil waitUntilDone:NO];
    }
    NSLog(@"canInitWithRequest: %@",urlString);
    return NO;
}

@end
