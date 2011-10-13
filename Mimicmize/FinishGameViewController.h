//
//  FinishGameViewController.h
//  Mimicmize
//
//  Created by Vitor Navarro on 9/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHKTwitter.h"
#import "SHKFacebook.h"
#import "JogoModel.h"
#import "MainMenuViewController.h"
#import "BoardPlaceViewController.h"
#import "HUDHelper.h"

@interface FinishGameViewController : UIViewController<PausableUI> {
  UIImageView *img_view_background;
  UILabel *lbl_winner_group;
  UILabel *lbl_won;
  UIButton *btn_play_again;
  UIButton *btn_menu;
  UIButton *btn_twitter;
  UIButton *btn_facebook;
  Jogo *current_game;
}
//IBOutlets
@property (nonatomic, strong) IBOutlet UIImageView *img_view_background;
@property (nonatomic, strong) IBOutlet UILabel *lbl_winner_group;
@property (nonatomic, strong) IBOutlet UILabel *lbl_won;
@property (nonatomic, strong) IBOutlet UIButton *btn_play_again;
@property (nonatomic, strong) IBOutlet UIButton *btn_menu;
@property (nonatomic, strong) IBOutlet UIButton *btn_twitter;
@property (nonatomic, strong) IBOutlet UIButton *btn_facebook;
//Properties

//IBActions
- (IBAction)onPlayAgainTouched:(id)sender;
- (IBAction)onMenuTouched:(id)sender;
- (IBAction)onTwitterTouched:(id)sender;
- (IBAction)onFacebookTouched:(id)sender;
@end
