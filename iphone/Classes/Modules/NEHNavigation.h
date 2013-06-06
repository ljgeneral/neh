//
//  NEHNavigation.h
//  WebShareNEH
//
//  Created by hxl on 13-6-4.
//  Copyright (c) 2013年 hxl. All rights reserved.
//

#import "NEHModule.h"

@interface NEHNavigation : NEHModule
- (void)navigateTo:(NEHArgument*)nehArgument;
- (void)navigateBack:(NEHArgument*)nehArgument;
- (void)openModal:(NEHArgument*)nehArgument;
- (void)closeModal:(NEHArgument*)nehArgument;
@end
