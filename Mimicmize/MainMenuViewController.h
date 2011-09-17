//
//  MainMenuViewController.h
//  Mimicmize
//
//  Created by Leonardo Baptista on 7/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameSetupViewController.h"
#import "BoardPlaceViewController.h"
#import "BoardMoveViewController.h"

@interface MainMenuViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIButton *btn_new_game;
@property (nonatomic, strong) IBOutlet UIButton *btn_options;

@property (nonatomic, strong) BoardPlaceViewController *board_place_controller;

-(IBAction)new_game:(id)sender;

@end
