//
//  NEHHost.h
//  iphone
//
//  Created by hxl on 13-2-22.
//  Copyright (c) 2013年 NetEase FD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NEHViewController.h"
#import "NEHCommand.h"
#import "NEHModule.h"

@class NEHViewController;
@interface NEHHost : NSObject
@property (nonatomic,strong) NEHViewController* viewController;
- (NEHHost*)initWithViewController:(NEHViewController*)viewController;
- (NSString*)evalJs:(NSString*)js;
- (void)getCommandsFromJs;
- (void)callbackJsWithCallbackId:(NSString*)callbackId
                          result:(NSString*)result
                    keepCallback:(NSString*)keepCallback;
@end
