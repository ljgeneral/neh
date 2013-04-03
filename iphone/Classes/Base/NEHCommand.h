//
//  NEHCommand.h
//  iphone
//
//  Created by hxl on 13-2-1.
//  Copyright (c) 2013年 NetEase FD. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NEHUIWebView;
@interface NEHCommand : NSObject{}
@property(nonatomic,copy) NSString* className;
@property(nonatomic,copy) NSString* methodName;
@property(nonatomic,copy) NSString* callbackId;
@property(nonatomic,strong) NSArray* arguments;
- (NEHCommand*)initWithJSON:(NSString*)json;
- (NEHCommand*)initWithClassName:(NSString*)className
                      methodName:(NSString*)methodName
                      callbackId:(NSString*)callbackId
                       arguments:(NSArray*)arguments;
@end
