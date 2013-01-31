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
    NSLog(@"%@",urlString);
    return NO;
}
- (void)startLoading
{
    NSLog(@"in startLoading");
	id<NSURLProtocolClient> client = [self client];
    NSURLRequest *request = [self request];
	NSURL *url = [request URL];
}
@end
