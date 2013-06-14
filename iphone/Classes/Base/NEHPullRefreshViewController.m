//
//  NEHPullRefreshViewController.m
//  iphone
//
//  Created by hxl on 13-6-7.
//  Copyright (c) 2013年 hxl. All rights reserved.
//

#import "NEHPullRefreshViewController.h"
#import "NEHViewController.h"

@interface NEHPullRefreshViewController ()

@end

@implementation NEHPullRefreshViewController

- (void)viewDidLoad {
  [super viewDidLoad];
	
	if (_refreshHeaderView == nil) {
		EGORefreshTableHeaderView *view = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f - self.webView.bounds.size.height, self.view.frame.size.width, self.webView.bounds.size.height)];
		view.delegate = self;
		[self.webView.scrollView addSubview:view];
		_refreshHeaderView = view;
		[view release];
    self.webView.scrollView.delegate = self;
	}
	
	//  update the last update date
	[_refreshHeaderView refreshLastUpdatedDate];
  
	
}

#pragma mark -
#pragma mark Data Source Loading / Reloading Methods

- (void)reloadTableViewDataSource{
	
	//  should be calling your tableviews data source model to reload
	//  put here just for demo
	_reloading = YES;
  [self.webView stringByEvaluatingJavaScriptFromString:@"native.pullrefresh.reloadList()"];
	
}

- (void)doneLoadingTableViewData{
	
	//  model should call this when its done loading
	_reloading = NO;
	[_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:self.webView.scrollView];
	
}


#pragma mark -
#pragma mark UIScrollViewDelegate Methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
	
	[_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
  
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
	
	[_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
	
}


#pragma mark -
#pragma mark EGORefreshTableHeaderDelegate Methods

- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view{
	
	[self reloadTableViewDataSource];
	//[self performSelector:@selector(doneLoadingTableViewData) withObject:nil afterDelay:3.0];
	
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view{
	
	return _reloading; // should return if data source model is reloading
	
}

- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view{
	
	return [NSDate date]; // should return date data source was last changed
	
}


#pragma mark -
#pragma mark Memory Management

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
	_refreshHeaderView=nil;
}

- (void)dealloc {
	
	_refreshHeaderView = nil;
  [super dealloc];
}


@end
