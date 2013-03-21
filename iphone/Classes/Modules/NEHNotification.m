//
//  NEHNotification.m
//  iphone
//
//  Created by hxl on 13-3-6.
//  Copyright (c) 2013年 NetEase FD. All rights reserved.
//

#import "NEHNotification.h"

@implementation NEHNotification
- (void)showDialogWithMessage:(NSString*)message
                        title:(NSString*)title
                      buttons:(NSString*)buttons
                   callbackId:(NSString*)callbackId{
  NEHUIAlertView* alertView =   [[NEHUIAlertView alloc] initWithTitle:title
                                                              message:message
                                                             delegate:self
                                                    cancelButtonTitle:nil
                                                    otherButtonTitles:nil];
  alertView.callbackId = [callbackId copy];
  NSArray* labels = [buttons componentsSeparatedByString:@","];
  int count = [labels count];
  for (int n = 0;n<count;n++) {
    [alertView addButtonWithTitle:[labels objectAtIndex:n]];
  }
  [alertView show];
}

- (void)alert:(NEHArgument*)nehArgument{
  NSString* callbackId = nehArgument.callbackId;
  NSArray* arguments = nehArgument.arguments;
  int argc = [arguments count];
  
  NSString* message = argc>0?[arguments objectAtIndex:0]:nil;
  NSString* title = argc>1?[arguments objectAtIndex:1]:nil;
  NSString* buttons = argc>2?[arguments objectAtIndex:2]:nil;
  
  if (!title) {
    title = NSLocalizedString(@"Alert", @"Alert");
  }
  if (!buttons) {
    buttons = NSLocalizedString(@"OK", @"OK");
  }
  
  [self showDialogWithMessage:message
                        title:title
                      buttons:buttons
                   callbackId:callbackId];
}

- (void)confirm:(NEHArgument*)nehArgument
{
  NSString* callbackId = nehArgument.callbackId;
  NSArray* arguments = nehArgument.arguments;
  int argc = [arguments count];
  
  NSString* message = argc>0?[arguments objectAtIndex:0]:nil;
  NSString* title = argc>1?[arguments objectAtIndex:1]:nil;
  NSString* buttons = argc>2?[arguments objectAtIndex:2]:nil;
  
  if (!title) {
    title = NSLocalizedString(@"Confirm", @"Confirm");
  }
  if (!buttons) {
    buttons = NSLocalizedString(@"OK,Cancel", @"OK,Cancel");
  }
  
  [self showDialogWithMessage:message
                        title:title
                      buttons:buttons
                   callbackId:callbackId];
}

/*callback to js*/
- (void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
  NEHUIAlertView* nehAlertView = (NEHUIAlertView*)alertView;
  NSMutableDictionary* resultDictionary = [[NSMutableDictionary alloc] initWithCapacity:1];
  [resultDictionary setValue:[NSString stringWithFormat:@"%d",buttonIndex] forKey:@"index"];
  NEHResult* result = [[NEHResult alloc] initWithSuccessData:resultDictionary];
  [self successWithCallbackId:nehAlertView.callbackId result:result];
}

@end
@implementation NEHUIAlertView
@synthesize callbackId=_callbackId;
@end