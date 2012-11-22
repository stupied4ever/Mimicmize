//
//  MainMenuViewController.m
//  Mimicmize
//
//  Created by Leonardo Baptista on 7/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MainMenuViewController.h"

@implementation MainMenuViewController

@synthesize btn_new_game = _btn_new_game;
@synthesize btn_options = _btn_options;
@synthesize img_mimicmize = _img_mimicmize;
@synthesize img_bonecos = _img_bonecos;

@synthesize board_place_controller = _board_place_controller;

#pragma mark - Events

-(IBAction)new_game:(id)sender {
  
  GameSetupViewController *setup_controller = [[GameSetupViewController alloc] initWithNibName:@"GameSetupView" bundle:nil];
  
  [UIView animateWithDuration:.3 animations:^{
    self.btn_new_game.alpha = 0;
    self.img_bonecos.alpha = 0.0;
  }];
  
  [UIView animateWithDuration:.4 delay:0 options:UIViewAnimationCurveEaseIn animations:^{
    CGRect frame = self.img_mimicmize.frame;
    frame.origin.x+=320;
    self.img_mimicmize.frame = frame;
  } completion:^(BOOL finished) {
    
    //[self presentModalViewController:setup_controller animated: NO];
    [self presentViewController:setup_controller animated:NO completion:nil];
  }];
  
  //BoardMoveViewController *next_viewcontroller = [[BoardMoveViewController alloc] initWithNibName:@"BoardMoveView" bundle:nil];
  //[self presentModalViewController:next_viewcontroller animated:NO];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.board_place_controller = [[BoardPlaceViewController alloc] initWithNibName:@"BoardPlaceView" bundle:nil];
}

- (void) viewDidAppear:(BOOL)animated {
  
  NSArray *array_grupos = [Grupo findAll];
  bool comecar_partida = [array_grupos count] >= 2;
  for (Grupo *grupo in array_grupos) {
    
    comecar_partida = comecar_partida && [grupo.casa_tabuleiro intValue] == 0;
  }
  
  if (comecar_partida) {
    //[self presentModalViewController:self.board_place_controller animated:NO];
    [self presentViewController:self.board_place_controller animated:NO completion:nil];
    [self.board_place_controller present_groups];
  }
  
}

- (void)viewDidUnload
{
  [super viewDidUnload];
  self.btn_new_game = nil;
  self.btn_options = nil;
  self.img_mimicmize = nil;
  self.img_bonecos = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
