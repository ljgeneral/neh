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
  UINavigationController *navigationController = [self.host.viewController navigationController];
  if(navigationController == nil)return;
  NEHViewController *nehViewController = [[NEHViewController alloc] init];
  [navigationController setToolbarHidden:YES];
  
  [navigationController setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
  
  NSString *urlString = [nehArgument.arguments objectAtIndex:0];
  NSURL *url = [[self class] urlFromString:urlString];
  NSURLRequest *appReq = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
  [nehViewController loadRequest:appReq];

  [navigationController pushViewController:nehViewController animated:YES];
}

- (void)navigateBack:(NEHArgument*)nehArgument{
  UINavigationController *navigationController = [self.host.viewController navigationController];
  if(navigationController == nil)return;
  [navigationController popViewControllerAnimated:YES];
}

- (void)openModal:(NEHArgument*)nehArgument{
  NSString *urlString = [nehArgument.arguments objectAtIndex:0];
  NSURL *url = [[self class] urlFromString:urlString];
  NEHViewController *nehViewController = [[NEHViewController alloc] init];
  NSURLRequest *appReq = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
  [nehViewController loadRequest:appReq];
  
  [nehViewController setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
  [self.host.viewController presentViewController:nehViewController animated:YES completion:nil];
};

- (void)closeModal:(NEHArgument*)nehArgument{
  [self.host.viewController dismissViewControllerAnimated:YES completion:nil];
};

+ (NSString*) pathForResource:(NSString*)resourcepath{
  NSBundle * mainBundle = [NSBundle mainBundle];
  NSMutableArray *directoryParts = [NSMutableArray arrayWithArray:[resourcepath componentsSeparatedByString:@"/"]];
  NSString       *filename       = [directoryParts lastObject];
  [directoryParts removeLastObject];
	
  NSString *directoryStr = [NSString stringWithFormat:@"%@/%@", @"www", [directoryParts componentsJoinedByString:@"/"]];
  NSString* path = [mainBundle pathForResource:filename
                                        ofType:nil
                                   inDirectory:directoryStr];
  return path;
  
}

+ (NSURL *) urlFromString:(NSString *)urlString{
  NSMutableArray *parameterParts = [NSMutableArray arrayWithArray:[urlString componentsSeparatedByString:@"#"]];
  NSString *realStartPage =  [parameterParts objectAtIndex:0];
  NSString *realParameter = nil;
  if ([parameterParts count]>1){
    realParameter = [parameterParts objectAtIndex:1];
  }
  
  NSURL *url = [NSURL URLWithString:urlString];
  
  if(![url scheme])
  {
    url = [NSURL fileURLWithPath:[NEHNavigation pathForResource:realStartPage]];
  }
  
  NSString *theAbsoluteURLString = [url absoluteString];
  NSString *absoluteURLwithQueryString = theAbsoluteURLString;
  if ([parameterParts count]>1){
    absoluteURLwithQueryString = [theAbsoluteURLString stringByAppendingFormat: @"#%@", realParameter];
  }
  
  return [NSURL URLWithString: absoluteURLwithQueryString];
}
@end
