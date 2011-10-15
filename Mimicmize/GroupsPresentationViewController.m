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
  frame.origin.x = -200;
  img_view.frame = frame;
}

- (void) prepare_animations {
  
  self.lbl_group_name.alpha = 0;
  self.index_group_show = 0;
  self.index_animation = 0;
  
  self.img_boneco01.hidden = NO;
  self.img_boneco02.hidden = NO;
  self.img_boneco03.hidden = self.total_grupos > 2;
  self.img_boneco04.hidden = self.total_grupos > 3;
  
  [self set_animation_xy_for_imgview:self.img_boneco01];
  [self set_animation_xy_for_imgview:self.img_boneco02];
  [self set_animation_xy_for_imgview:self.img_boneco03];
  [self set_animation_xy_for_imgview:self.img_boneco04];
  
  self.lbl_group_name.font = [UIFont fontWithName:@"Helsinki" size:24];
}

-(void) change_text_lbl {
  
  self.lbl_group_name.text = [(Grupo *)[self.array_grupos objectAtIndex: self.index_group_show++] nome];
}

-(void) hide_lbl {
  
  self.index_animation+=3;
  [UIView animateWithDuration:1 delay:0 options: UIViewAnimationOptionAllowUserInteraction animations:^{
    self.lbl_group_name.alpha = 0;
  } completion:^(BOOL finished) {}];
}

-(void) show_lbl {
  
  self.index_animation+=1;
  [self change_text_lbl];
  [UIView animateWithDuration:1 delay:0 options: UIViewAnimationOptionAllowUserInteraction animations:^{
    self.lbl_group_name.alpha = 1;
  } completion:^(BOOL finished) {}];
}

- (void) start_animation {
  
  [self show_lbl];
  
  //if (self.index_animation < 4) {
    [self performSelector:@selector(hide_lbl) withObject:nil afterDelay:4];
  //}
  
  //if (self.index_animation < 5) {
    [self performSelector:@selector(show_lbl) withObject:nil afterDelay:5];
  //}
  
  //if (self.index_animation < 8) {
    [self performSelector:@selector(hide_lbl) withObject:nil afterDelay:8];
  //}
  
  
  [self performSelector:@selector(present_board) withObject:nil afterDelay:9];
}

-(void) present_board {
  
  [self.delegate dismiss_controllers];
  [self.delegate next_group];
}

#pragma mark - Data

-(void) get_data_from_coredata {
  
  self.array_grupos = [Grupo findAllSortedBy:@"ordem" ascending:YES];
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
  
  //[self start_animation];
}

#pragma mark - View lifecycle

- (void) viewDidAppear:(BOOL)animated {
  
  [self start_animation];
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
