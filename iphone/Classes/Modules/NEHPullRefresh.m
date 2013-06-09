//
//  NEHPullRefresh.m
//  iphone
//
//  Created by hxl on 13-6-8.
//  Copyright (c) 2013年 hxl. All rights reserved.
//

#import "NEHPullRefresh.h"

@implementation NEHPullRefresh
- (void)finishedLoading:(NEHArgument*)nehArgument{
  [self.host.viewController doneLoadingTableViewData];
}
@end
