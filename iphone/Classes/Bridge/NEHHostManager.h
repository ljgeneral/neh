//
//  NEHHostManager.h
//  iphone
//
//  Created by hxl on 13-2-27.
//  Copyright (c) 2013年 hxl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NEHHost.h"

@class NEHHost;
@interface NEHHostManager : NSObject{
    NSMutableDictionary *_pool;
}
- (void)addHost:(NEHHost *)host
         forKey:(NSString *)key;
- (void)removeHostForKey:(NSString *)key;
- (NEHHost *)getHostForKey:(NSString *)key;

@end
