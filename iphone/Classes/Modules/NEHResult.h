//
//  NEHResult.h
//  iphone
//
//  Created by hxl on 13-2-1.
//  Copyright (c) 2013年 hxl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NEHResult : NSObject
@property double result;
@property NSString *message;
@property NSMutableDictionary *data;
@property BOOL keepCallback;
-(NEHResult *)initWithCallback;

@end
