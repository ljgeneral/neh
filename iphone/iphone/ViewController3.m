//
//  ViewController3.m
//  iphone
//
//  Created by hxl on 13-3-21.
//  Copyright (c) 2013年 hxl. All rights reserved.
//

#import "ViewController3.h"

@interface ViewController3 ()

@end

@implementation ViewController3
@synthesize webViewController1 = _webViewController1;
@synthesize webViewController2 = _webViewController2;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    CGSize viewBoundsSize = self.view.bounds.size;
    self.webViewController1 = [[NEHViewController alloc] initWithParentController:self frame:CGRectMake(0.0, 0.0, viewBoundsSize.width/2, viewBoundsSize.height/2)];
    self.webViewController2 = [[NEHViewController alloc] initWithParentController:self frame:CGRectMake(0.0, viewBoundsSize.height/2, viewBoundsSize.width, viewBoundsSize.height/2)];
    self.webViewController3 = [[NEHViewController alloc] initWithParentController:self frame:CGRectMake(viewBoundsSize.width/2, 0.0, viewBoundsSize.width/2, viewBoundsSize.height/2)];
//    self.webViewController4 = [[NEHViewController alloc] initWithParentController:self frame:CGRectMake(viewBoundsSize.width/3, viewBoundsSize.height/2, (viewBoundsSize.width*2)/3, viewBoundsSize.height/2)];
	  // Do any additional setup after loading the view.
    NSString *startPage = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"/www/index.html"];
    NSURL *appURL = [NSURL fileURLWithPath:startPage];
    NSURLRequest* appReq1 = [NSURLRequest requestWithURL:appURL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
    [self.webViewController1 loadRequest:appReq1];
    [self.webViewController2 loadRequest:appReq1];
    [self.webViewController3 loadRequest:appReq1];
    [self.webViewController4 loadRequest:appReq1];
}

- (void)didReceiveMemoryWarning{
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
