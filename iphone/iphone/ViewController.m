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
    webView = [[NEHUIWebView alloc] initWithFrame:CGRectMake(0, 0, 10, 1)];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *startPage = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"/www/index.html"];
    NSURL *appURL = [NSURL fileURLWithPath:startPage];
    NSURLRequest* appReq = [NSURLRequest requestWithURL:appURL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
    [webView loadRequest:appReq];
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
