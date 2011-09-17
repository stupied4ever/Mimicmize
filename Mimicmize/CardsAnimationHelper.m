//
//  CardsAnimationHelper.m
//  Mimicmize
//
//  Created by Leonardo Baptista on 9/17/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "CardsAnimationHelper.h"

@implementation CardsAnimationHelper

@synthesize card01 = _card01;
@synthesize card02 = _card02;
@synthesize card03 = _card03;
@synthesize card04 = _card04;

@synthesize img_1 = _img_1;
@synthesize img_2 = _img_2;
@synthesize img_3 = _img_3;
@synthesize img_go = _img_go;

@synthesize btn_selected = _btn_selected;

-(void) show_cards {
  
  CGRect frame_carta01 = CGRectMake(5, 340, 100, 120);
  CGRect frame_carta02 = CGRectMake(75, 320, 100, 120);
  CGRect frame_carta03 = CGRectMake(145, 320, 100, 120);
  CGRect frame_carta04 = CGRectMake(215, 340, 100, 120);
  [UIView animateWithDuration:.7 animations:^{
    
    self.card01.frame = frame_carta01;
    self.card01.transform = CGAffineTransformMakeRotation(-M_PI/8);
    self.card02.frame = frame_carta02;
    self.card02.transform = CGAffineTransformMakeRotation(-M_PI/16);
    self.card03.frame = frame_carta03;
    self.card03.transform = CGAffineTransformMakeRotation(M_PI/16);
    self.card04.frame = frame_carta04;
    self.card04.transform = CGAffineTransformMakeRotation(M_PI/8);
  }];
  
}

- (void)center_all_cards {
  CGRect center_frame = CGRectMake(110, 400, 100, 120);
  self.card01.frame = center_frame;
  self.card02.frame = center_frame;
  self.card03.frame = center_frame;
  self.card04.frame = center_frame;
  self.card01.transform = CGAffineTransformMakeRotation(0);
  self.card02.transform = CGAffineTransformMakeRotation(0);
  self.card03.transform = CGAffineTransformMakeRotation(0);
  self.card04.transform = CGAffineTransformMakeRotation(0);
}

-(void) show_selected_card : (UIButton *)btn_selected {
  
  self.btn_selected = btn_selected;
  CGRect frame_carta01 = CGRectMake(-110, 335, 100, 120);
  CGRect frame_carta02 = CGRectMake(-80, 480, 100, 120);
  CGRect frame_carta03 = CGRectMake(150, 480, 100, 120);
  CGRect frame_carta04 = CGRectMake(345, 335, 100, 120);
  
  [UIView animateWithDuration:.7 animations:^{
    
    if (self.card01 != btn_selected) {
      self.card01.frame = frame_carta01;
      self.card01.transform = CGAffineTransformMakeRotation(-M_PI/8);
    }
    
    if (self.card02 != btn_selected) {
      self.card02.frame = frame_carta02;
      self.card02.transform = CGAffineTransformMakeRotation(-M_PI/16);
    }
    
    if (self.card03 != btn_selected) {
      self.card03.frame = frame_carta03;
      self.card03.transform = CGAffineTransformMakeRotation(M_PI/16);
    }
    
    if (self.card04 != btn_selected) {
      self.card04.frame = frame_carta04;
      self.card04.transform = CGAffineTransformMakeRotation(M_PI/8);
    }
    
    btn_selected.transform = CGAffineTransformMakeRotation(0);
    CGRect frame = self.card01.frame;
    frame.origin.x = 50;
    frame.origin.y = 248;
    frame.size.width = 220;
    frame.size.height = 190;
    btn_selected.frame = frame;
    btn_selected.tag = 12345;
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:btn_selected cache:NO];
    
  }];
  
}


-(void) show_3_2_1_go : (void (^)(void))on_finish_animation {
  
  [UIView animateWithDuration:.3 animations:^{
    self.btn_selected.tag = 0;
    self.btn_selected.alpha = 0;
    self.img_3.alpha = 1;
  }completion:^(BOOL finished) {
    [UIView animateWithDuration:1 animations:^{
      self.img_2.alpha = 1;
      self.img_3.alpha = 0;
    }completion:^(BOOL finished) {
      [UIView animateWithDuration:1 animations:^{
        self.img_1.alpha = 1;
        self.img_2.alpha = 0;
      }completion:^(BOOL finished) {
        [UIView animateWithDuration:1 animations:^{
          self.img_go.alpha = 1;
          self.img_1.alpha = 0;
        }completion:^(BOOL finished) {
          self.img_go.alpha = 0;
          on_finish_animation();
          
        }];
      }];
    }];
  }];
  
}

@end
