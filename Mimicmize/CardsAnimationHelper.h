//
//  CardsAnimationHelper.h
//  Mimicmize
//
//  Created by Leonardo Baptista on 9/17/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocalizeHelper.h"

@interface CardsAnimationHelper : NSObject

@property (nonatomic, strong) UIView *card01;
@property (nonatomic, strong) UIView *card02;
@property (nonatomic, strong) UIView *card03;
@property (nonatomic, strong) UIView *card04;

@property (nonatomic, strong) IBOutlet UIImageView *img_3;
@property (nonatomic, strong) IBOutlet UIImageView *img_2;
@property (nonatomic, strong) IBOutlet UIImageView *img_1;
@property (nonatomic, strong) IBOutlet UIImageView *img_go;
@property (nonatomic, weak) UILabel *lbl_vai;

@property (nonatomic, strong) UIButton *btn_selected;

- (void) show_cards;
- (void)center_all_cards;
- (void) show_selected_card : (UIButton *)btn_selected;
-(void) show_3_2_1_go : (void (^)(void))on_finish_animation;

@end
