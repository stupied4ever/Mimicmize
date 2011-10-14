//
//  MenuShortViewController.h
//  Mimicmize
//
//  Created by Leonardo Baptista on 10/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HUDHelper.h"
#import "GameSetupViewController.h"
#import "BoardPlaceViewController.h"
#import "Configuration.h"

@interface MenuShortViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIButton *btn_sound;

-(void) show;
-(void) hide;

-(IBAction) continue_to_play;
-(IBAction) new_game;
-(IBAction) restart_game;
-(IBAction) toogle_sound_on_off;

@end
