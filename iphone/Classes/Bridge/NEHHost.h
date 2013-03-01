//
//  NEHHost.h
//  iphone
//
//  Created by hxl on 13-2-22.
//  Copyright (c) 2013年 hxl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NEHUIWebView.h"
#import "NEHCommand.h"

@interface NEHHost : NSObject
@property NEHUIWebView* webView;
-(NEHHost*)initWithWebView:(NEHUIWebView *)webView;
-(NSString*)evalJs:(NSString *)js;
-(void)getCommandsFromJs;
-(void)callbackToJs:(NSString *)callbackId
             result:(NSString *)result
       keepCallback:(NSString *)keepCallback;
@end
