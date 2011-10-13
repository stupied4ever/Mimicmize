//
//  MimicmizeAppDelegate.h
//  Mimicmize
//
//  Created by Leonardo Baptista on 7/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SeedManager.h"
#import "SoundHelper.h"
#import "HUDHelper.h"

@class MainMenuViewController;

@interface MimicmizeAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) MainMenuViewController *viewController;
@property (strong, nonatomic) UIButton *btn_pause;

@end
