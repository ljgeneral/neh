//
//  NEHCommand.h
//  iphone
//
//  Created by hxl on 13-2-1.
//  Copyright (c) 2013年 NetEase FD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NEHModule.h"
#import "NEHArgument.h"

@class NEHUIWebView;
@interface NEHCommand : NSObject{}
@property(nonatomic,strong) NEHHost* host;
@property(nonatomic,copy) NSString* className;
@property(nonatomic,copy) NSString* methodName;
@property(nonatomic,copy) NSString* callbackId;
@property(nonatomic,strong) NSMutableArray* arguments;
- (NEHCommand*)initWithJSON:(NSString*)json
                        host:(NEHHost*)theHost;
- (NEHCommand*)execute;
@end
