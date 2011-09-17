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

@interface PlayTimeViewController : UIViewController {
  UILabel *lbl_group;
  UILabel *lbl_seconds;
  UIButton *btn_correct;
  
  CGFloat play_time_seconds;
}

@property (nonatomic, strong) IBOutlet UILabel *lbl_group;
@property (nonatomic, strong) IBOutlet UILabel *lbl_seconds;
@property (nonatomic, strong) IBOutlet UIButton *btn_correct;

@property (nonatomic, strong) Jogo *current_game;
@property (nonatomic, strong) UIViewController *next_viewcontroller;

- (IBAction)correct_mimic:(id)sender;
@end
