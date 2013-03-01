//
//  NEHResult.h
//  iphone
//
//  Created by hxl on 13-2-1.
//  Copyright (c) 2013年 hxl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NEHResult : NSObject
@property (nonatomic,retain) NSString *code;
@property (nonatomic,retain) NSString *message;
@property (nonatomic,retain) NSMutableDictionary *data;
-(NEHResult *)initWithCode:(NSString*)code
                   message:(NSString*)message
                    data:(NSMutableDictionary*)data;
-(NEHResult *)initWithSuccessData:(NSMutableDictionary*)data;
-(NSString *)resultWithString;
@end
