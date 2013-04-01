//
//  NEHCommand.m
//  iphone
//
//  Created by hxl on 13-2-1.
//  Copyright (c) 2013年 NetEase FD. All rights reserved.
//

#import "NEHCommand.h"

@implementation NEHCommand
@synthesize host=_host;
@synthesize className=_className;
@synthesize methodName=_methodName;
@synthesize callbackId=_callbackId;
@synthesize arguments=_arguments;
- (NEHCommand*)initWithJSON:(NSString*)json
                       host:(NEHHost*)theHost{
    NSDictionary* tmpDictionary = [json cdvjk_mutableObjectFromJSONString];
    self.className = [[tmpDictionary valueForKey:@"className"] copy];
    self.methodName = [[tmpDictionary valueForKey:@"methodName"] copy];
    self.callbackId = [[tmpDictionary valueForKey:@"callbackId"] copy];
    self.arguments = [tmpDictionary valueForKey:@"arguments"];
    self.host = theHost;
    return self;
}

- (NEHCommand*)execute{
    NEHModule* obj = [[NSClassFromString (self.className)alloc] initWithHost:self.host];
    SEL normalSelector = NSSelectorFromString([NSString stringWithFormat:@"%@:", self.methodName]);
    NEHArgument* argument=[[NEHArgument alloc] initWithCallbackId:self.callbackId
                                                        arugments:self.arguments];
    objc_msgSend(obj, normalSelector, argument);
}

- (void)dealloc{
  self.host=nil;
  self.className=nil;
  self.methodName=nil;
  self.callbackId=nil;
  self.arguments=nil;
}
@end