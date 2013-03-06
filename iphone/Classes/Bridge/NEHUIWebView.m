//
//  NEHUIWebView.m
//  iphone
//
//  Created by hxl on 13-1-31.
//  Copyright (c) 2013年 hxl. All rights reserved.
//

#import "NEHUIWebView.h"

@interface NEHUIWebView()
@property (nonatomic) UIWebView* webView;
@end
@implementation NEHUIWebView
@synthesize webView=_webView;
- (UIWebView*)webView{
	if (_webView==nil)
	{
		_webView = [[UIWebView alloc] initWithFrame:self.bounds];
		_webView.delegate = self;
		_webView.opaque = NO;
		_webView.backgroundColor = [UIColor whiteColor];
		_webView.contentMode = UIViewContentModeRedraw;
		_webView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
		[self addSubview:_webView];
	}
	return _webView;
}
- (void)dealloc{
	if (self.webView!=nil)
	{
        //recycle host
        NSString* webViewKey = [self.webView stringByEvaluatingJavaScriptFromString:@"return window.WEBVIEW_KEY"];
        [[NEHHostManager sharedInstance] removeHostForKey:webViewKey];
		self.webView = nil;
		if (self.webView.loading)
		{
			[self.webView stopLoading];
		}
	}
	[super dealloc];
}
- (void)loadRequest:(NSURLRequest*)request{
    [self.webView loadRequest:request];
}
- (void)loadHTMLString:(NSString*)string
               baseURL:(NSURL*)baseURL{
    [self.webView loadHTMLString:string baseURL:baseURL];
};
- (void)loadData:(NSData*)data
        MIMEType:(NSString*)MIMEType
textEncodingName:(NSString*)textEncodingName
         baseURL:(NSURL*)baseURL{
    [self loadData:data MIMEType:MIMEType textEncodingName:textEncodingName baseURL:baseURL];
}
- (UIScrollView*)scrollview{
	if ([self.webView respondsToSelector:@selector(scrollView)]) {
		// as of iOS 5.0, we can return the scroll view
		return [self.webView scrollView];
	} else {
		// in earlier versions, we need to find the scroll view
		for (id subview in [self.webView subviews]) {
			if ([subview isKindOfClass:[UIScrollView class]]) {
				return (UIScrollView*)subview;
			}
		}
	}
	return nil;
}
- (CGFloat)contentHeightForWidth:(CGFloat)value{
    CGRect oldBounds = [[self webview] bounds];
    BOOL oldVal = self.webView.scalesPageToFit;
    [self.webView setScalesPageToFit:NO];
    [self.webView setBounds:CGRectMake(0, 0, 10, 1)];
    CGFloat ret = [self.webView sizeThatFits:CGSizeMake(10, 1)].height;
    [self.webView setBounds:oldBounds];
    [self.webView setScalesPageToFit:oldVal];
    return ret;
}

- (CGFloat)contentWidthForWidth:(CGFloat)value{
    CGRect oldBounds = [[self webview] bounds];
    BOOL oldVal = self.webView.scalesPageToFit;
    [self.webView setScalesPageToFit:NO];
    [self.webView setBounds:CGRectMake(0, 0, 10, 1)];
    CGFloat ret = [self.webView sizeThatFits:CGSizeMake(10, 1)].width;
    [self.webView setBounds:oldBounds];
    [self.webView setScalesPageToFit:oldVal];
    return ret;
}
- (id)url{
	NSString *result =[[[self.webView request] URL] absoluteString];
	if (result!=nil)
	{
		return result;
	}
	return self.url;
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

#pragma mark WebView Delegate

- (BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType{
    if ([[[request URL] absoluteString] isEqualToString:@"neh://ready"]) {
        [NSURLProtocol registerClass:[NEHURLProtocol class]];
        NSString* webViewKey = [NSString stringWithFormat:@"%d",rand()/(double)(RAND_MAX)];
        [webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"neh.setWebViewKey('%@')",webViewKey]];
        [[NEHHostManager sharedInstance] addHost:[[NEHHost alloc] initWithWebView:webView]  forKey:webViewKey];
        return NO;
    }
	return YES;
}
- (void)webViewDidFinishLoad:(UIWebView*)webView{
    [webView setNeedsDisplay];
}


@end
