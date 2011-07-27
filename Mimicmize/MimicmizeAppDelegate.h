//
//  MimicmizeAppDelegate.h
//  Mimicmize
//
//  Created by Leonardo Baptista on 7/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SeedManager.h"

@class MimicmizeViewController;

@interface MimicmizeAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) MimicmizeViewController *viewController;

@end
