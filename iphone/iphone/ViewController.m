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
@synthesize webViewController = _webViewController;
- (void)viewDidLoad{
  [super viewDidLoad];
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidEnterBackground) name:@"ApplicationEnterBackground" object:nil];
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillEnterForeground) name:@"ApplicationEnterForeground" object:nil];
    [self initWebViewController];
}

- (void)initWebViewController{
  self.webViewController = [[NEHViewController alloc] initWithParentController:self];
  NSString *startPage = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"/www/index.html"];
  NSURL *appURL = [NSURL fileURLWithPath:startPage];
  NSURLRequest* appReq = [NSURLRequest requestWithURL:appURL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
  [self.webViewController loadRequest:appReq];
}

- (void)applicationDidEnterBackground{
  [self.webViewController applicationEnterBackground];
};

- (void)applicationWillEnterForeground{
  [self.webViewController applicationEnterForeground];
};

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [super dealloc];
}
- (void)viewDidUnload {
  [self setWebView:nil];
  [super viewDidUnload];
}
@end
