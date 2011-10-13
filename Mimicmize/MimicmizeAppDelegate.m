//
//  MimicmizeAppDelegate.m
//  Mimicmize
//
//  Created by Leonardo Baptista on 7/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MimicmizeAppDelegate.h"
#import "MainMenuViewController.h"

@implementation MimicmizeAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;
@synthesize btn_pause = _btn_pause;


-(void) configure_ipad_ui {
  
}

-(void) configure_iphone_ui {
  
  self.viewController = [[MainMenuViewController alloc] initWithNibName:@"MainMenuView" bundle:nil];
}

-(void) configure_main_ui {
  
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
    
    [self configure_iphone_ui];
  } else {
    
    [self configure_ipad_ui];
  }
  self.window.rootViewController = self.viewController;
  [self.window makeKeyAndVisible];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

  [SoundHelper sharedInstance];
  [ActiveRecordHelpers setupCoreDataStackWithAutoMigratingSqliteStoreNamed:@"Mimicmize.sqlite"];
  [[[SeedManager alloc] init] load_all_fixtures];
  [self configure_main_ui];
  [HUDHelper set_up_in_window:self.window];
  return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
  /*
   Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
   Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
   */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
  /*
   Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
   If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
   */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
  /*
   Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
   */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
  /*
   Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
   */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
  /*
   Called when the application is about to terminate.
   Save data if appropriate.
   See also applicationDidEnterBackground:.
   */
}

@end
