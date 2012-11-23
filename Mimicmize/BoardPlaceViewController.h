//
//  BoardPlaceViewController.h
//  Mimicmize
//
//  Created by Leonardo Baptista on 9/2/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardsChoiceViewController.h"
#import "Baralho.h"
#import "PlayTimeViewController.h"
#import "CardsAnimationHelper.h"
#import "SoundHelper.h"
#import "FinishGameViewController.h"
#import "HUDHelper.h"
#import "GroupsPresentationViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface BoardPlaceViewController : UIViewController<CardsChoiceDelegate, PausableUI> {
  
  float img_rotation;
}

@property (nonatomic, strong) IBOutlet UIButton *carta_01;
@property (nonatomic, strong) IBOutlet UIButton *carta_02;
@property (nonatomic, strong) IBOutlet UIButton *carta_03;
@property (nonatomic, strong) IBOutlet UIButton *carta_04;
@property (nonatomic, strong) CardsChoiceViewController *cards_choice_controller;
@property (nonatomic, strong) CardsAnimationHelper *animation;

@property (nonatomic, strong) IBOutlet UIImageView *img_3;
@property (nonatomic, strong) IBOutlet UIImageView *img_2;
@property (nonatomic, strong) IBOutlet UIImageView *img_1;
@property (nonatomic, strong) IBOutlet UIImageView *img_go;

@property (nonatomic, strong) IBOutlet UIImageView *img_boneco;

@property (nonatomic, strong) UIViewController *pushed_controller;

@property (nonatomic, strong) Carta* carta_selecionada;
@property (weak, nonatomic) IBOutlet UILabel *lbl_vai;

-(IBAction)select_card:(id)sender;
-(void) correct_mimic;
-(void) wrong_mimic;
-(void) walk_group;
-(void) next_group;

-(void) dismiss_controllers;
-(void) present_groups;

@end
