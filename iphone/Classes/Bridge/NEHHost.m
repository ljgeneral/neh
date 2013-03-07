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
- (NEHHost*)initWithWebView:(NEHUIWebView*)theWebView{
    self.webView=theWebView;
    return self;
}

- (NSString*)evalJs:(NSString*)js{
    return [self.webView stringByEvaluatingJavaScriptFromString:js];
}

- (void)getCommandsFromJs{
    NSString* commandString = [self evalJs:@"neh.getCommands()"];
    NSArray* commandArray = [commandString cdvjk_mutableObjectFromJSONString];
    for(NSInteger i=0;i<[commandArray count];i++){
        [[[NEHCommand alloc] initWithJSON:[[commandArray objectAtIndex:i] cdvjk_JSONString] host:self] execute];
    }
}

- (void)callbackJsWithCallbackId:(NSString*)callbackId
                          result:(NSString*)result
                    keepCallback:(NSString*)keepCallback{
    [self evalJs:[NSString stringWithFormat:@"neh.callback('%@','%@','%@')",callbackId,result,keepCallback]];
}
@end
