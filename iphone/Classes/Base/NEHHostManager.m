//
//  NEHHostManager.m
//  iphone
//
//  Created by hxl on 13-2-27.
//  Copyright (c) 2013年 NetEase FD. All rights reserved.
//

#import "NEHHostManager.h"

@implementation NEHHostManager
static NEHHostManager* singleton;
static NSString* LOCK = @"neh";
+ (NEHHostManager*) sharedInstance{
  @synchronized(LOCK){
    if(singleton == nil){
      singleton = [[NEHHostManager alloc] init];
    }
  }
  return singleton;
}

- (void)addHost:(NEHHost*)host
         forKey:(NSString*)key{
  if(_pool==nil)_pool = [[NSMutableDictionary alloc] initWithCapacity:100];
  [_pool setValue:host forKey:key];
}

- (void)removeHostForKey:(NSString*)key{
  [_pool removeObjectForKey:key];
}

- (NEHHost*)getHostForKey:(NSString*)key{
  return [_pool valueForKey:key];
}
@end
