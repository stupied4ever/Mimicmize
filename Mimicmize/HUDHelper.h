//
//  HUDHelper.h
//  Mimicmize
//
//  Created by Leonardo Baptista on 10/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PausableUI <NSObject>

-(void) pause;
-(void) resume;

@end

@class MenuShortViewController,BoardPlaceViewController;
@interface HUDHelper : NSObject

@property (nonatomic, strong) UIButton *btn_pause;
@property (nonatomic, assign) UIWindow *main_window;
@property (nonatomic, assign) UIViewController<PausableUI> *delegate;
@property (nonatomic, assign) BoardPlaceViewController *main_game_controller;
@property (nonatomic, strong) MenuShortViewController *menu;

+(HUDHelper *) shared_instance;
+(void) hide;
+(void) show;
+(void) set_up_in_window : (UIWindow *) window;
+(void) set_delegate : (UIViewController<PausableUI> *) delegate;

-(void) btn_pause_click : (id) sender;

@end
