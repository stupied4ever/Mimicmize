//
//  HUDHelper.m
//  Mimicmize
//
//  Created by Leonardo Baptista on 10/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "HUDHelper.h"
#import "MenuShortViewController.h"
#import "BoardPlaceViewController.h"

@implementation HUDHelper

@synthesize btn_pause = _btn_pause;
@synthesize main_window = _main_window;
@synthesize delegate = _delegate;
@synthesize menu = _menu;
@synthesize main_game_controller = _main_game_controller;

static HUDHelper *_shared = nil;

-(void) btn_pause_click : (id) sender {
  
  [self.delegate pause];
  [self.menu show];
}

-(void) create_menu {
  
  self.menu = [[MenuShortViewController alloc] initWithNibName:@"MenuShortView" bundle:nil];
  CGRect frame = self.menu.view.frame;
  frame.origin.y = -frame.size.height;
  self.menu.view.frame = frame;
}

-(void) create_btn_pause {
  
  self.btn_pause = [[UIButton alloc] initWithFrame:CGRectMake(280, 20, 40, 40)];
  [self.btn_pause addTarget:self action:@selector(btn_pause_click:) forControlEvents:UIControlEventTouchUpInside];
  [self.btn_pause setImage: [UIImage imageNamed:@"btn_pause.png"] forState:UIControlStateNormal];
}

+(HUDHelper *) shared_instance {
  
  if (_shared == nil) {
    _shared = [[HUDHelper alloc] init];
    [_shared create_btn_pause];
    [_shared create_menu];
    [HUDHelper hide];
  }
  return _shared;
}

+(void) hide {
  
  HUDHelper *instance = [HUDHelper shared_instance];
  instance.btn_pause.alpha = 0;
}

+(void) show {
  
  HUDHelper *instance = [HUDHelper shared_instance];
  instance.btn_pause.alpha = 1;
}


+(void) set_up_in_window : (UIWindow *) window {
  
  HUDHelper *instance = [HUDHelper shared_instance];
  instance.main_window = window;
  [instance.main_window addSubview:instance.btn_pause];
  [instance.main_window addSubview:instance.menu.view];
}

+(void) set_delegate : (UIViewController<PausableUI> *) delegate {
  
  HUDHelper *instance = [HUDHelper shared_instance];
  
  if ( [delegate isKindOfClass: [BoardPlaceViewController class]] ) {
    instance.main_game_controller = (BoardPlaceViewController *)delegate;
  }
  instance.delegate = delegate;
}

@end
