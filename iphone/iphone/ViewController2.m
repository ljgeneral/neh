//
//  ViewController2.m
//  iphone
//
//  Created by hxl on 13-3-21.
//  Copyright (c) 2013年 hxl. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2
@synthesize pullRefreshViewController=_pullRefreshViewController;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self initWebViewController];
}

- (void)initWebViewController{
  self.pullRefreshViewController = [[NEHPullRefreshViewController alloc] initWithParentController:self];
  NSString *startPage = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"/www/list.html"];
  NSURL *appURL = [NSURL fileURLWithPath:startPage];
  NSURLRequest* appReq = [NSURLRequest requestWithURL:appURL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
  [self.pullRefreshViewController loadRequest:appReq];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
  [super dealloc];
}
- (void)viewDidUnload {
  [super viewDidUnload];
}
@end
