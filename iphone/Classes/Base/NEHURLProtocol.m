//
//  NEHURLProtocol.m
//  iphone
//
//  Created by hxl on 13-1-31.
//  Copyright (c) 2013年 NetEase FD. All rights reserved.
//

#import "NEHURLProtocol.h"
#import "NEHHostManager.h"

@implementation NEHURLProtocol

+ (BOOL)canInitWithRequest:(NSURLRequest*)theRequest{
    NSURL* requestUrl = [theRequest URL];
    if([[requestUrl scheme] isEqualToString:@"neh"]){
        NSString *resourceSpecifier = [requestUrl resourceSpecifier];
        NEHHost* host = [[NEHHostManager sharedInstance] getHostForKey:[resourceSpecifier substringFromIndex:([resourceSpecifier rangeOfString:@"?"].location+1)] ];
        [host performSelectorOnMainThread:@selector(getCommandsFromJs)
                               withObject:nil
                            waitUntilDone:NO];
    }
    return NO;
}


@end
