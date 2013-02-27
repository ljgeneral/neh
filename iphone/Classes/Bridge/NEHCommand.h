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
@property(nonatomic,retain) NEHHost * host;
@property(nonatomic,retain) NSString * className;
@property(nonatomic,retain) NSString * methodName;
@property(nonatomic,retain) NSString * callbackId;
@property(nonatomic,retain) NSMutableArray *arguments;
-(NEHCommand *)initWithJSON:(NSString *)json host:(NEHHost*)theHost;
-(NEHCommand *)executeCommand;
@end
