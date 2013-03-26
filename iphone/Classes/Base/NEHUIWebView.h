//
//  NEHUIWebView.h
//  iphone
//
//  Created by hxl on 13-1-31.
//  Copyright (c) 2013年 NetEase FD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NEHHostManager.h"
#import "NEHURLProtocol.h"

//webview extend
@interface NEHUIWebView : UIView<UIWebViewDelegate>
@property(nonatomic,readonly) id url;
@property(nonatomic,readonly,strong) NSURLRequest* request;
@property(nonatomic,readonly,strong) UIScrollView* scrollView NS_AVAILABLE_IOS(5_0);

- (void)loadRequest:(NSURLRequest*)request;
- (NSString*)stringByEvaluatingJavaScriptFromString:(NSString*)code;
- (void)stopLoading;
- (void)goBack;
- (void)goForward;
- (BOOL)isLoading;
- (BOOL)canGoBack;
- (BOOL)canGoForward;
- (void)reload;
@end
