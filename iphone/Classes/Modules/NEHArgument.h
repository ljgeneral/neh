//
//  NEHArgument.h
//  iphone
//
//  Created by hxl on 13-2-1.
//  Copyright (c) 2013年 hxl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NEHArgument : NSObject{
}
@property(nonatomic,strong) NSString* callbackId;
@property(nonatomic,strong) NSArray* arguments;
- (NEHArgument*) initWithCallbackId:(NSString*)theCallbackId
                          arugments:(NSArray*)theArguments;
@end
