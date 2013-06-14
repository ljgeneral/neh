//
//  NEHPullRefreshViewController.h
//  iphone
//
//  Created by hxl on 13-6-7.
//  Copyright (c) 2013年 hxl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NEHViewController.h"
#import "EGORefreshTableHeaderView.h"

@interface NEHPullRefreshViewController :NEHViewController <UIScrollViewDelegate,EGORefreshTableHeaderDelegate>{
  EGORefreshTableHeaderView* _refreshHeaderView;
	BOOL _reloading;
}

- (void)reloadTableViewDataSource;
- (void)doneLoadingTableViewData;
@end
