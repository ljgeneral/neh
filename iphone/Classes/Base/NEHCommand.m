//
//  NEHCommand.m
//  iphone
//
//  Created by hxl on 13-2-1.
//  Copyright (c) 2013年 NetEase FD. All rights reserved.
//

#import "NEHCommand.h"

@implementation NEHCommand
@synthesize className=_className;
@synthesize methodName=_methodName;
@synthesize callbackId=_callbackId;
@synthesize arguments=_arguments;
- (NEHCommand*)initWithJSON:(NSString*)json{
    NSDictionary* tmpDictionary = [json cdvjk_mutableObjectFromJSONString];
    return [self initWithClassName:[tmpDictionary valueForKey:@"className"]
                        methodName:[tmpDictionary valueForKey:@"methodName"]
                        callbackId:[tmpDictionary valueForKey:@"callbackId"]
                         arguments:[tmpDictionary valueForKey:@"arguments"]];
}

- (NEHCommand*)initWithClassName:(NSString*)className
                      methodName:(NSString*)methodName
                      callbackId:(NSString*)callbackId
                       arguments:(NSArray*)arguments{

  self.className=[className copy];
  self.methodName = [methodName copy];
  self.callbackId = [callbackId copy];
  self.arguments = arguments;
  return self;
}

- (void)dealloc{
  self.className=nil;
  self.methodName=nil;
  self.callbackId=nil;
  self.arguments=nil;
}
@end
