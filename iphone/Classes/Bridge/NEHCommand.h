//
//  NEHCommand.h
//  iphone
//
//  Created by hxl on 13-2-1.
//  Copyright (c) 2013年 hxl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NEHModule.h"
#import "NEHArgument.h"

@class NEHHost;
@class NEHUIWebView;
@interface NEHCommand : NSObject{}
@property(nonatomic,strong) NEHHost* host;
@property(nonatomic,strong) NSString* className;
@property(nonatomic,strong) NSString* methodName;
@property(nonatomic,strong) NSString* callbackId;
@property(nonatomic,strong) NSMutableArray* arguments;
- (NEHCommand*)initWithJSON:(NSString*)json
                        host:(NEHHost*)theHost;
- (NEHCommand*)executeCommand;
@end
