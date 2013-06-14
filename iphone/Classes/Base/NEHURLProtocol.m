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

+ (void)enable{
  [NSURLProtocol registerClass:[NEHURLProtocol class]];
}

+ (BOOL)canInitWithRequest:(NSURLRequest*)theRequest{
    NSURL* requestUrl = [theRequest URL];
    if([[requestUrl scheme] isEqualToString:@"neh"]){
        NSString* resourceSpecifier = [requestUrl resourceSpecifier];
        NSString* webViewKey = [resourceSpecifier substringFromIndex:([resourceSpecifier rangeOfString:@"?"].location+1)];
        NEHHost* host = [[NEHHostManager sharedInstance] getHostForKey:webViewKey];
        [host performSelectorOnMainThread:@selector(getCommandsFromJS)
                               withObject:nil
                            waitUntilDone:NO];
    }
    return NO;
  
}


@end
