//
//  NEHModule.m
//  iphone
//
//  Created by hxl on 13-2-1.
//  Copyright (c) 2013年 NetEase FD. All rights reserved.
//

#import "NEHModule.h"

@implementation NEHModule
@synthesize host=_host;
- (id)initWithHost:(NEHHost*)theHost{
    self.host = theHost;
    return self;
}

- (void)keepCallbackWithCallbackId:(NSString*)callbackId
                            result:(NEHResult*)result{
  [self.host callbackJSWithCallbackId:callbackId
                               result:[result resultToString]
                         keepCallback:@"true"];
  
}

- (void)successWithCallbackId:(NSString*)callbackId
                       result:(NEHResult*)result{
    [self.host callbackJSWithCallbackId:callbackId
                                 result:[result resultToString]
                           keepCallback:@"false"];
}
@end
