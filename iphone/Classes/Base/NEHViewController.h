//
//  NEHViewController.h
//  iphone
//
//  Created by hxl on 13-3-26.
//  Copyright (c) 2013年 hxl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NEHHostManager.h"
#import "NEHURLProtocol.h"

@interface NEHViewController : UIViewController <UIWebViewDelegate>{

}
- (void)loadRequest:(NSURLRequest*)request;
- (NSString*)stringByEvaluatingJavaScriptFromString:(NSString*)code;
- (void)stopLoading;
- (void)goBack;
- (void)goForward;
- (BOOL)isLoading;
- (BOOL)canGoBack;
- (BOOL)canGoForward;
- (void)reload;
- (void)willRotateToInterfaceOrientation: (UIInterfaceOrientation)toInterfaceOrientation duration: (NSTimeInterval)duration;
@end


