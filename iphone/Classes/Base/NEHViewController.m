//
//  NEHViewController.m
//  iphone
//
//  Created by hxl on 13-3-26.
//  Copyright (c) 2013年 hxl. All rights reserved.
//

#import "NEHViewController.h"

@interface NEHViewController ()
@property (nonatomic) UIWebView* webView;
@property (nonatomic) NSString* webViewKey;
@end

@implementation NEHViewController
@synthesize webView=_webView;
- (UIWebView *)webView{
	if (_webView==nil)
	{
		_webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
		_webView.delegate = self;
		_webView.opaque = NO;
		_webView.backgroundColor = [UIColor whiteColor];
		_webView.contentMode = UIViewContentModeRedraw;
		_webView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
		[self.view addSubview:_webView];
	}
	return _webView;
}

- (id)initWithParentController:(UIViewController *)parentController{
  self.view.frame = parentController.view.bounds;
  [parentController addChildViewController:self];
  [parentController.view addSubview:self.view];
  return self;
}

- (void)dealloc{
	if (self.webView!=nil)
	{
    [[NEHHostManager sharedInstance] removeHostForKey:self.webViewKey];
		if (self.webView.loading){
			[self.webView stopLoading];
		}
    self.webView = nil;
	}
	[super dealloc];
}

- (void)loadRequest:(NSURLRequest*)request{
  [self.webView loadRequest:request];
}

- (NSString*)stringByEvaluatingJavaScriptFromString:(NSString *)code{
  return [[self webView] stringByEvaluatingJavaScriptFromString:code];
}

- (void)reload{
	[self.webView reload];
}

- (void)stopLoading{
	[self.webView stopLoading];
}

- (void)goBack{
	[self.webView goBack];
}

- (void)goForward{
	[self.webView goForward];
}

- (BOOL)isLoading{
	return [self.webView isLoading];
}

- (BOOL)canGoBack{
	return [self.webView canGoBack];
}

- (BOOL)canGoForward{
	return [self.webView canGoForward];
}

- (void)willRotateToInterfaceOrientation: (UIInterfaceOrientation)toInterfaceOrientation duration: (NSTimeInterval)duration {
	double i = 0;
	switch (toInterfaceOrientation){
		case UIInterfaceOrientationPortrait:
			i = 0;
			break;
		case UIInterfaceOrientationPortraitUpsideDown:
			i = 180;
			break;
		case UIInterfaceOrientationLandscapeLeft:
			i = 90;
			break;
		case UIInterfaceOrientationLandscapeRight:
			i = -90;
			break;
	}
	[self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"window.onnativeorientationchange(%f);", i]];
}

- (void)didReceiveMemoryWarning
{
  NSLog(@"memory warning received by controller");
  [self.webView stringByEvaluatingJavaScriptFromString:@"window.onmemorywarning();"];
}

#pragma mark WebView Delegate

- (BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType{
  if ([[[request URL] absoluteString] isEqualToString:@"neh://ready"]) {
    [NEHURLProtocol enable];//处理自定义URL
    srand((unsigned)time(0));
    self.webViewKey = [NSString stringWithFormat:@"%d",rand()/(double)(RAND_MAX)];
    [[NEHHostManager sharedInstance] addHost:[[NEHHost alloc] initWithController:self]  forKey:self.webViewKey];
    [webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"neh.setWebViewKey('%@')",self.webViewKey]];
    return NO;
  }
	return YES;
}

- (void)webViewDidFinishLoad:(UIWebView*)webView{
  [webView setNeedsDisplay];
}

@end
