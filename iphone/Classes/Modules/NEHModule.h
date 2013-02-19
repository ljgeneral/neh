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
#import "NEHModuleDelegate.h"

@interface NEHModule : NSObject{
    NEHModuleDelegate* _moduleDelegate;
}
-(void)success;
@end
