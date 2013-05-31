//
//  NEHResult.m
//  iphone
//
//  Created by hxl on 13-2-1.
//  Copyright (c) 2013年 NetEase FD. All rights reserved.
//

#import "NEHResult.h"

@implementation NEHResult
@synthesize code=_code;
@synthesize message=_message;
@synthesize data=_data;
- (NEHResult*)initWithCode:(NSString*)code
                   message:(NSString*)message
                      data:(NSDictionary*)data{
    self.code = [code copy];
    self.message=[message copy];
    self.data = data;
    return self;
}

- (NEHResult*)initWithSuccessData:(NSDictionary*)data{
    return [self initWithCode:@"1"
                      message:@""
                         data:data];
}

- (NEHResult*)initWithErrorMessage:(NSString*)message{
    return [self initWithCode:@"0"
                      message:message
                         data:nil];
}

- (NSString*)resultToString{
    NSMutableDictionary* tmpDictionary = [[NSMutableDictionary alloc] initWithCapacity:4];
    [tmpDictionary setValue:self.code forKey:@"code"];
    [tmpDictionary setValue:self.message forKey:@"message"];
    [tmpDictionary setValue:self.data forKey:@"data"];
    return [tmpDictionary cdvjk_JSONString];
}
@end
