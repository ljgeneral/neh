//
//  ViewController.m
//  iphone
//
//  Created by hxl on 13-1-31.
//  Copyright (c) 2013年 hxl. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    webView1 = [[NEHUIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 240)];
    webView2 = [[NEHUIWebView alloc] initWithFrame:CGRectMake(0, 240, 320, 240)];
    [[self view] addSubview:webView1];
    [[self view] addSubview:webView2];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *startPage = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"/www/index.html"];
    NSURL *appURL = [NSURL fileURLWithPath:startPage];
    NSURLRequest* appReq = [NSURLRequest requestWithURL:appURL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
    [webView1 loadRequest:appReq];
    [webView2 loadRequest:appReq];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [super dealloc];
}
@end
