//
//  NEHResult.m
//  iphone
//
//  Created by hxl on 13-2-1.
//  Copyright (c) 2013年 hxl. All rights reserved.
//

#import "NEHResult.h"

@implementation NEHResult
@synthesize code=_code;
@synthesize message=_message;
@synthesize data=_data;
- (NEHResult*)initWithCode:(NSString*)code
                    message:(NSString*)message
                       data:(NSMutableDictionary*)data{
  
    self.code = code;
    self.message=message;
    self.data = data;
    return self;
};
- (NEHResult*)initWithSuccessData:(NSMutableDictionary*)data{
    return [self initWithCode:@"1" message:@"" data:data];
};
-(NSString*)resultWithString{
    NSMutableDictionary* tmpDictionary = [[NSMutableDictionary alloc] initWithCapacity:4];
    [tmpDictionary setValue:self.code forKey:@"code"];
    [tmpDictionary setValue:self.message forKey:@"message"];
    [tmpDictionary setValue:self.data forKey:@"data"];
    return [tmpDictionary cdvjk_JSONString];
};
@end
