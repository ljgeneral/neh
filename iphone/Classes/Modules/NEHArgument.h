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
@property(nonatomic,retain) NSString* callbackId;
@property(nonatomic,retain) NSMutableArray *arguments;
-(NEHArgument*) initWithCallbackId:(NSString *)callbackId
                methodArugments:(NSMutableArray*)methodArugments;
@end
