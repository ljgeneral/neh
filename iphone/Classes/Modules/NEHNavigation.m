//
//  NEHNavigation.m
//  WebShareNEH
//
//  Created by hxl on 13-6-4.
//  Copyright (c) 2013年 hxl. All rights reserved.
//

#import "NEHNavigation.h"

@implementation NEHNavigation
- (void)navigateTo:(NEHArgument*)nehArgument{
  UINavigationController* navigationController = [self.host.viewController navigationController];
  if(navigationController == nil)return;
  
  NSDictionary* args = [nehArgument.arguments objectAtIndex:0];
  NSString* urlString = [args objectForKey:@"url"];
  NSString* title = [args objectForKey:@"title"];

  
  NEHViewController* nehViewController = [[NEHViewController alloc] init];
  [navigationController setToolbarHidden:YES];
  if (title != nil) {
    [nehViewController setTitle:title];
  }
  
  NSURL* url = [[self class] urlFromString:urlString];
  NSURLRequest* appReq = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
  [nehViewController loadRequest:appReq];

  [navigationController pushViewController:nehViewController animated:YES];
}

- (void)navigateBack:(NEHArgument*)nehArgument{
  UINavigationController *navigationController = [self.host.viewController navigationController];
  if(navigationController == nil)return;
  [navigationController popViewControllerAnimated:YES];
}

- (void)openModal:(NEHArgument*)nehArgument{
  NSDictionary* args = [nehArgument.arguments objectAtIndex:0];
  NSString* urlString = [args objectForKey:@"url"];
  NSString* transitionStyle = [args objectForKey:@"transitionStyle"];
  NSString* presentationStyle = [args objectForKey:@"presentationStyle"];
  NSString* title = [args objectForKey:@"title"];
  NSString* hasTopBar = [args objectForKey:@"hasTopBar"];
  NSURL* url = [[self class] urlFromString:urlString];
  NEHViewController* nehViewController = [[NEHViewController alloc] init];
  NSURLRequest* appReq = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
  [nehViewController loadRequest:appReq];
  [nehViewController.navigationItem setTitle:title];
  if (hasTopBar != nil && [hasTopBar isEqual:@"true"]){
    UINavigationController *modalNavigationController = [[UINavigationController alloc] initWithRootViewController:nehViewController];
    if (transitionStyle != nil && [transitionStyle isEqual:@"flip"]) {
      [modalNavigationController setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    };
    if (presentationStyle != nil && [presentationStyle isEqual:@"window"]){
      [modalNavigationController setModalPresentationStyle:UIModalPresentationFormSheet];
    }
    [self.host.viewController presentViewController:modalNavigationController animated:YES completion:nil];
  }else{
    if (transitionStyle != nil && [transitionStyle isEqual:@"flip"]) {
      [nehViewController setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    };
    if (presentationStyle != nil && [presentationStyle isEqual:@"window"]){
      [nehViewController setModalPresentationStyle:UIModalPresentationFormSheet];
    }
    [self.host.viewController presentViewController:nehViewController animated:YES completion:nil];
  }
};

- (void)closeModal:(NEHArgument*)nehArgument{
  [self.host.viewController dismissViewControllerAnimated:YES completion:nil];
};

+ (NSString*) pathForResource:(NSString*)resourcepath{
  NSBundle* mainBundle = [NSBundle mainBundle];
  NSMutableArray* directoryParts = [NSMutableArray arrayWithArray:[resourcepath componentsSeparatedByString:@"/"]];
  NSString*       filename       = [directoryParts lastObject];
  [directoryParts removeLastObject];
	
  NSString* directoryStr = [NSString stringWithFormat:@"%@/%@", @"www", [directoryParts componentsJoinedByString:@"/"]];
  NSString* path = [mainBundle pathForResource:filename
                                        ofType:nil
                                   inDirectory:directoryStr];
  return path;
}

+ (NSURL *) urlFromString:(NSString *)urlString{
  NSMutableArray* parameterParts = [NSMutableArray arrayWithArray:[urlString componentsSeparatedByString:@"#"]];
  NSString* realStartPage =  [parameterParts objectAtIndex:0];
  NSString* realParameter = nil;
  if ([parameterParts count]>1){
    realParameter = [parameterParts objectAtIndex:1];
  }
  
  NSURL* url = [NSURL URLWithString:urlString];
  
  if(![url scheme]){
    url = [NSURL fileURLWithPath:[NEHNavigation pathForResource:realStartPage]];
  }
  
  NSString* theAbsoluteURLString = [url absoluteString];
  NSString* absoluteURLwithQueryString = theAbsoluteURLString;
  if ([parameterParts count]>1){
    absoluteURLwithQueryString = [theAbsoluteURLString stringByAppendingFormat: @"#%@", realParameter];
  }
  
  return [NSURL URLWithString: absoluteURLwithQueryString];
}
@end
