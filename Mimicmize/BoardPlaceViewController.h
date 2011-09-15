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
#import "SoundHelper.h"

@interface BoardPlaceViewController : UIViewController<CardsChoiceDelegate>

@property (nonatomic, strong) IBOutlet UIButton *carta_01;
@property (nonatomic, strong) IBOutlet UIButton *carta_02;
@property (nonatomic, strong) IBOutlet UIButton *carta_03;
@property (nonatomic, strong) IBOutlet UIButton *carta_04;
@property (nonatomic, strong) CardsChoiceViewController *cards_choice_controller;

@property (nonatomic, strong) IBOutlet UIImageView *img_3;
@property (nonatomic, strong) IBOutlet UIImageView *img_2;
@property (nonatomic, strong) IBOutlet UIImageView *img_1;
@property (nonatomic, strong) IBOutlet UIImageView *img_go;

-(IBAction)select_card:(id)sender;


@end
