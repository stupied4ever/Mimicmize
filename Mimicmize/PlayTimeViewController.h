//
//  PlayTimeViewController.h
//  Mimicmize
//
//  Created by Vitor Navarro on 9/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocalizeHelper.h"
#import "JogoModel.h"
#import "GrupoModel.h"
#import "SoundHelper.h"
#import "BoardMoveViewController.h"
#import "HUDHelper.h"

@class BoardPlaceViewController;
@interface PlayTimeViewController : UIViewController<PausableUI> {
  
  CGFloat play_time_seconds;
}

@property (nonatomic, strong) IBOutlet UILabel *lbl_group;
@property (nonatomic, strong) IBOutlet UILabel *lbl_seconds;
@property (nonatomic, strong) IBOutlet UIButton *btn_correct;

@property (nonatomic, strong) Jogo *current_game;
@property (nonatomic, strong) UIViewController *next_viewcontroller;

@property (nonatomic, assign) BoardPlaceViewController *delegate;

@property (nonatomic, assign) BOOL is_paused;

- (void)decrease_player_time;
- (IBAction)correct_mimic:(id)sender;

@end
