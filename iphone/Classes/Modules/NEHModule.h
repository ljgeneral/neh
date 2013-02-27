//
//  NEHModule.h
//  iphone
//
//  Created by hxl on 13-2-1.
//  Copyright (c) 2013年 hxl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NEHArgument.h"
#import "NEHResult.h"
#import "NEHHost.h"

@class NEHHost;
@interface NEHModule : NSObject{
    //
}
@property(nonatomic,retain) NEHHost * host;
-(id)initWithHost:(NEHHost *)host;
-(NSString *)executeJs:(NSString *)js;
-(void)success;
-(void)buildResult:(NEHResult *)result
        callbackId:(NSString *)callbackId
          noDelete:(BOOL)noDelete;
@end
