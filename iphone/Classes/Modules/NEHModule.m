//
//  NEHModule.m
//  iphone
//
//  Created by hxl on 13-2-1.
//  Copyright (c) 2013年 hxl. All rights reserved.
//

#import "NEHModule.h"

@implementation NEHModule
@synthesize host=_host;
-(id)initWithHost:(NEHHost *)theHost{
    self.host = theHost;
    return self;
};
-(void)success{
    //_moduleDelegate
}
-(void)buildResult:(NEHResult *)result
        callbackId:(NSString *)callbackId
          noDelete:(BOOL)noDelete
{
    [self.host callbackToJs:callbackId result:[result.data cdvjk_JSONString] noDelete:noDelete];
}
@end
