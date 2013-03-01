//
//  NEHDevice.m
//  iphone
//
//  Created by hxl on 13-2-21.
//  Copyright (c) 2013年 hxl. All rights reserved.
//

#import "NEHDevice.h"

@implementation NEHDevice
-(void)getDeviceInfo:(NEHArgument *)nehArgument{
    NEHResult *result = [[NEHResult alloc] initWithSuccessData:[self deviceProperties]];
    [self successResult:result callbackId:nehArgument.callbackId];
};
- (NSDictionary*)deviceProperties
{
    UIDevice* device = [UIDevice currentDevice];
    NSMutableDictionary* devProps = [NSMutableDictionary dictionaryWithCapacity:4];
    
    [devProps setObject:@"iOS" forKey:@"platform"];
    [devProps setObject:[device systemVersion] forKey:@"version"];
    [devProps setObject:[device model] forKey:@"name"];
    
    NSDictionary* devReturn = [NSDictionary dictionaryWithDictionary:devProps];
    return devReturn;
}
@end
