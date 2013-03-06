//
//  NEHResult.h
//  iphone
//
//  Created by hxl on 13-2-1.
//  Copyright (c) 2013年 hxl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NEHResult : NSObject
@property (nonatomic,strong) NSString* code;
@property (nonatomic,strong) NSString* message;
@property (nonatomic,strong) NSMutableDictionary* data;
-(NEHResult*)initWithCode:(NSString*)code
                   message:(NSString*)message
                    data:(NSMutableDictionary*)data;
-(NEHResult*)initWithSuccessData:(NSMutableDictionary*)data;
-(NSString*)resultWithString;
@end
