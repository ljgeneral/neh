//
//  NEHHost.m
//  iphone
//
//  Created by hxl on 13-2-22.
//  Copyright (c) 2013年 NetEase FD. All rights reserved.
//

#import "NEHHost.h"

@implementation NEHHost
@synthesize viewController=_viewController;
- (NEHHost*)initWithViewController:(NEHViewController *)viewController{
    self.viewController=viewController;
    return self;
}

- (NSString*)evalJS:(NSString*)js{
    return [self.viewController evalJS:js];
}

- (void)executeCommand:(NEHCommand*)command{
  NEHModule* obj = [[NSClassFromString (command.className)alloc] initWithHost:self];
  SEL normalSelector = NSSelectorFromString([NSString stringWithFormat:@"%@:", command.methodName]);
  NEHArgument* argument=[[NEHArgument alloc] initWithCallbackId:command.callbackId
                                                      arugments:command.arguments];
  objc_msgSend(obj, normalSelector, argument);
}

- (void)getCommandsFromJS{
    NSString* commandString = [self evalJS:@"neh.getCommands()"];
    NSArray* commandArray = [commandString cdvjk_mutableObjectFromJSONString];
    for(NSInteger i=0;i<[commandArray count];i++){
      NEHCommand* command = [[NEHCommand alloc] initWithJSON:[[commandArray objectAtIndex:i] cdvjk_JSONString]];
      [self executeCommand:command];
    }
}

- (void)callbackJSWithCallbackId:(NSString*)callbackId
                          result:(NSString*)result
                    keepCallback:(NSString*)keepCallback{
    [self evalJS:[NSString stringWithFormat:@"neh.callback('%@','%@','%@')",callbackId,result,keepCallback]];
}

@end
