//
//  NEHHost.m
//  iphone
//
//  Created by hxl on 13-2-22.
//  Copyright (c) 2013年 hxl. All rights reserved.
//

#import "NEHHost.h"

@implementation NEHHost
@synthesize webView=_webView;
-(NEHHost*)initWithWebView:(NEHUIWebView *)theWebView{
    self.webView=theWebView;
    return (self);
}
-(NSString *)evalJs:(NSString *)js{
    return [self.webView stringByEvaluatingJavaScriptFromString:js];
};
-(void)getCommandsFromJs{
    NSString* tmp = [self evalJs:@"neh.fetchCommands()"];
    NSArray* temArray = [tmp cdvjk_mutableObjectFromJSONString];
   [[[NEHCommand alloc] initWithJSON:[[temArray objectAtIndex:0] cdvjk_JSONString] host:self] executeCommand];
}
-(void)callbackToJs:(NSString *)callbackId
             result:(NSString*)result
           noDelete:(BOOL)noDelete
{
    [self evalJs:[NSString stringWithFormat:@"neh.callback('%@','%@','%@')",callbackId,result,noDelete]];
}
@end
