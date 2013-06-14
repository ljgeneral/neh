//
//  NEHDevice.m
//  iphone
//
//  Created by hxl on 13-2-21.
//  Copyright (c) 2013年 NetEase FD. All rights reserved.
//

#import "NEHDevice.h"
#include <sys/types.h>
#include <sys/sysctl.h>

@implementation NEHDevice
- (void)getDeviceInfo:(NEHArgument*)nehArgument{
    NEHResult* result = [[NEHResult alloc] initWithSuccessData:[self deviceProperties]];
    [self successWithCallbackId:nehArgument.callbackId result:result];
}

- (NSString*) hardwarePlatform{
  int mib[2];
  size_t len;
  char* machine;
  
  mib[0] = CTL_HW;
  mib[1] = HW_MACHINE;
  sysctl(mib, 2, NULL, &len, NULL, 0);
  machine = malloc(len);
  sysctl(mib, 2, machine, &len, NULL, 0);
  
  NSString* platform = [NSString stringWithCString:machine encoding:NSASCIIStringEncoding];
  free(machine);
  return platform;
}

- (NSDictionary*)deviceProperties{
    UIDevice* device = [UIDevice currentDevice];
    NSMutableDictionary* deviceInfo = [NSMutableDictionary dictionaryWithCapacity:4];
    
    [deviceInfo setObject:[self hardwarePlatform] forKey:@"platform"];
    [deviceInfo setObject:[device systemVersion] forKey:@"version"];
    [deviceInfo setObject:[device model] forKey:@"model"];
    [deviceInfo setObject:[[[UIDevice currentDevice] identifierForVendor] UUIDString]  forKey:@"id"];
    
    NSDictionary* devReturn = [NSDictionary dictionaryWithDictionary:deviceInfo];
    return devReturn;
}

@end
