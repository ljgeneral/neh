//
//  NEHUIWebView.m
//  iphone
//
//  Created by hxl on 13-1-31.
//  Copyright (c) 2013年 hxl. All rights reserved.
//

#import "NEHUIWebView.h"

@implementation NEHUIWebView

-(id) initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if(self){
        self.delegate = self;
    }
    return self;
}


#pragma mark WebView Delegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
	NSURL * newUrl = [request URL];
	
	//It's likely to fail, but that way we pass it on to error handling.
	return YES;
}

@end
