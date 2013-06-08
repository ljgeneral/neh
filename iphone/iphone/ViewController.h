//
//  ViewController.h
//  iphone
//
//  Created by hxl on 13-1-31.
//  Copyright (c) 2013年 hxl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NEHViewController.h"

@interface ViewController : UIViewController{}
@property (retain, nonatomic)NEHViewController  *webViewController;

- (void)applicationDidEnterBackground;
- (void)applicationWillEnterForeground;
@end
