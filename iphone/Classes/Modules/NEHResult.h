//
//  NEHResult.h
//  iphone
//
//  Created by hxl on 13-2-1.
//  Copyright (c) 2013年 NetEase FD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NEHResult : NSObject
@property (nonatomic,copy) NSString* code;
@property (nonatomic,copy) NSString* message;
@property (nonatomic,strong) NSDictionary* data;
- (NEHResult*)initWithCode:(NSString*)code
                   message:(NSString*)message
                      data:(NSDictionary*)data;
- (NEHResult*)initWithSuccessData:(NSDictionary*)data;
- (NEHResult*)initWithErrorMessage:(NSString*)message;
- (NSString*)resultToString;
@end
