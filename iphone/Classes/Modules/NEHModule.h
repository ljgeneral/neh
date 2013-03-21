//
//  NEHModule.h
//  iphone
//
//  Created by hxl on 13-2-1.
//  Copyright (c) 2013年 NetEase FD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NEHArgument.h"
#import "NEHResult.h"
#import "NEHHost.h"

@class NEHHost;
@interface NEHModule : NSObject

@property(nonatomic,strong) NEHHost* host;
- (id)initWithHost:(NEHHost*)host;
- (void)successWithCallbackId:(NSString*)callbackId
                       result:(NEHResult*)result;
@end
