//
//  GroupsPresentationViewController.m
//  Mimicmize
//
//  Created by Leonardo Baptista on 10/15/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "GroupsPresentationViewController.h"
#import "BoardPlaceViewController.h"

@implementation GroupsPresentationViewController

@synthesize img_boneco01 = _img_boneco01;
@synthesize img_boneco02 = _img_boneco02;
@synthesize img_boneco03 = _img_boneco03;
@synthesize img_boneco04 = _img_boneco04;
@synthesize lbl_group_name = _lbl_group_name;

@synthesize array_grupos = _array_grupos;
@synthesize total_grupos = _total_grupos;
@synthesize index_group_show = _index_group_show;
@synthesize index_animation = _index_animation;

@synthesize delegate = _delegate;

#pragma mark - Events

- (void) set_animation_xy_for_imgview : (UIImageView *)img_view {
  
  CGRect frame = img_view.frame;
  frame.origin.x = -142;
  frame.origin.y = 52;
  img_view.frame = frame;
}

- (void) prepare_animations {
  
  self.lbl_group_name.alpha = 0;
  self.index_group_show = 0;
  self.index_animation = 0;
  
  self.img_boneco01.hidden = NO;
  self.img_boneco02.hidden = NO;
  self.img_boneco03.hidden = !self.total_grupos > 2;
  self.img_boneco04.hidden = !self.total_grupos > 3;
  
  [self set_animation_xy_for_imgview:self.img_boneco01];
  [self set_animation_xy_for_imgview:self.img_boneco02];
  [self set_animation_xy_for_imgview:self.img_boneco03];
  [self set_animation_xy_for_imgview:self.img_boneco04];
  
  self.lbl_group_name.font = [UIFont fontWithName:@"Helsinki" size:24];
}

-(UIImageView *) get_img_view_grupo_atual {
  
  if (self.index_group_show == 1) {
    return self.img_boneco02;
  }
  else {
    return self.img_boneco01;
  }
  
}

-(void) change_text_lbl {
  
  Grupo * grupo_atual = (Grupo *)[self.array_grupos objectAtIndex: self.index_group_show];
  self.lbl_group_name.text = grupo_atual.nome;
  self.index_group_show++;
}

-(void) step_animation {
  
  [UIView animateWithDuration:.5 animations:^{
    
    if (self.index_group_show == 1) {
      self.img_boneco01.frame = CGRectMake(89, 91, 142, 286);
      self.img_boneco01.alpha = 1;
    }
    else if (self.index_group_show == 2) {
      self.img_boneco01.frame = CGRectMake(158, 44, 142, 286);
      self.img_boneco02.frame = CGRectMake(89, 85, 142, 286);
      self.img_boneco01.alpha = 0.6;
      self.img_boneco02.alpha = 1.0;
      [self.view bringSubviewToFront:self.img_boneco01];
      [self.view bringSubviewToFront:self.img_boneco02];
    }
    else if (self.index_group_show == 3) {
      self.img_boneco01.frame = CGRectMake(89, 20, 142, 286);
      self.img_boneco02.frame = CGRectMake(158, 44, 142, 286);
      self.img_boneco03.frame = CGRectMake(89, 85, 142, 286);
      self.img_boneco01.alpha = 0.6;
      self.img_boneco02.alpha = 0.6;
      self.img_boneco03.alpha = 1.0;
      [self.view bringSubviewToFront:self.img_boneco01];
      [self.view bringSubviewToFront:self.img_boneco02];
      [self.view bringSubviewToFront:self.img_boneco03];
    }
    else if (self.index_group_show == 4) {
      self.img_boneco01.frame = CGRectMake(20, 52, 142, 286);
      self.img_boneco02.frame = CGRectMake(89, 20, 142, 286);
      self.img_boneco03.frame = CGRectMake(158, 44, 142, 286);
      self.img_boneco04.frame = CGRectMake(89, 85, 142, 286);
      self.img_boneco01.alpha = 0.6;
      self.img_boneco02.alpha = 0.6;
      self.img_boneco03.alpha = 0.6;
      self.img_boneco04.alpha = 1.0;
      [self.view bringSubviewToFront:self.img_boneco02];
      [self.view bringSubviewToFront:self.img_boneco01];
      [self.view bringSubviewToFront:self.img_boneco03];
      [self.view bringSubviewToFront:self.img_boneco04];
    }
    
  }];

}

-(void) hide_group {
  
  self.index_animation+=3;
  [UIView animateWithDuration:1 delay:0 options: UIViewAnimationOptionAllowUserInteraction animations:^{
    self.lbl_group_name.alpha = 0;
  } completion:^(BOOL finished) {}];
}

-(void) show_next_group {
  
  self.index_animation+=1;
  [self change_text_lbl];
  [self step_animation];
  
  UIImageView *img_grupo = [self get_img_view_grupo_atual];
  [UIView animateWithDuration:1 delay:0 options: UIViewAnimationOptionAllowUserInteraction animations:^{
    self.lbl_group_name.alpha = 1;
    
    CGRect frame = img_grupo.frame;
    frame.origin.x = 10;
    frame.origin.y = 10;
    
  } completion:^(BOOL finished) {}];
}

- (void) start_animation {
  
  if (self.index_animation < 1) {
    [self show_next_group];
  }
  
  if (self.index_animation < 3) {
    [self performSelector:@selector(hide_group) withObject:nil afterDelay:3-self.index_animation];
  }
  
  if (self.index_animation < 4) {
    [self performSelector:@selector(show_next_group) withObject:nil afterDelay:4-self.index_animation];
  }
  
  if (self.index_animation < 6) {
    [self performSelector:@selector(hide_group) withObject:nil afterDelay:6-self.index_animation];
  }
  
  if (self.total_grupos < 3) {
    if (self.index_animation < 7) {
      [self performSelector:@selector(present_board) withObject:nil afterDelay:7-self.index_animation];
    }
    return;
  }
  
  
  if (self.index_animation < 7) {
    [self performSelector:@selector(show_next_group) withObject:nil afterDelay:7-self.index_animation];
  }
  if (self.index_animation < 9) {
    [self performSelector:@selector(hide_group) withObject:nil afterDelay:9-self.index_animation];
  }
  
  if (self.total_grupos < 4) {
    if (self.index_animation < 10) {
      [self performSelector:@selector(present_board) withObject:nil afterDelay:10-self.index_animation];
    }
    return;
  }
  
  if (self.index_animation < 10) {
    [self performSelector:@selector(show_next_group) withObject:nil afterDelay:10-self.index_animation];
  }
  if (self.index_animation < 12) {
    [self performSelector:@selector(hide_group) withObject:nil afterDelay:12-self.index_animation];
  }
  if (self.index_animation < 13) {
    [self performSelector:@selector(present_board) withObject:nil afterDelay:13-self.index_animation];
  }
  
  
}

-(void) present_board {
  
  [UIView animateWithDuration:.5 animations:^{
    
    self.img_boneco01.alpha = 0;
    if (self.total_grupos > 2) {
      self.img_boneco02.alpha = 0;
    }
    if (self.total_grupos > 3) {
      self.img_boneco03.alpha = 0;
    }
  } completion:^(BOOL finished) {
    [self.delegate dismiss_controllers];
    [self.delegate next_group];
  }];
  
  
}

#pragma mark - Data

-(void) get_data_from_coredata {
  
  self.array_grupos = [Grupo findAllSortedBy:@"ordem" ascending:NO];
  
  NSArray *array_img_view = [NSArray arrayWithObjects:self.img_boneco01,
                             self.img_boneco02,
                             self.img_boneco03,
                             self.img_boneco04,nil];
  NSInteger index=0;
  for (Grupo *grupo in self.array_grupos) {
    
    UIImageView *img_view = [array_img_view objectAtIndex:index];
    img_view.image = [UIImage imageNamed:grupo.imagem];
    index++;
  }
  
  self.total_grupos = [self.array_grupos count];
}

#pragma mark - PausableUI

-(void) pause {
  
  [NSRunLoop cancelPreviousPerformRequestsWithTarget:self];
  [UIView animateWithDuration:.1 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
    
  } completion:^(BOOL finished) {
    
  }];
}

-(void) resume {
  
  [self start_animation];
}

#pragma mark - View lifecycle

- (void) viewDidAppear:(BOOL)animated {
  
  [HUDHelper set_delegate:self];
  [HUDHelper show];
}

- (void) viewDidLoad {
  
  [super viewDidLoad];
  [self get_data_from_coredata];
  [self prepare_animations];
}

- (void) viewDidUnload {
  
  [super viewDidUnload];
  
  self.img_boneco01 = nil;
  self.img_boneco02 = nil;
  self.img_boneco03 = nil;
  self.img_boneco04 = nil;
  self.lbl_group_name = nil;
  
  self.array_grupos = nil;
}

#pragma mark - Orientations

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
