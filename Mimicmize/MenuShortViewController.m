//
//  MenuShortViewController.m
//  Mimicmize
//
//  Created by Leonardo Baptista on 10/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MenuShortViewController.h"

@implementation MenuShortViewController

@synthesize btn_sound = _btn_sound;

#pragma mark - Events

-(void) fix_sound_label_text {
  
  self.btn_sound.selected = [Configuration shared_instance].is_sound_on;
  /*if ([Configuration shared_instance].is_sound_on) {
    self.btn_sound.titleLabel.text = @"Turn sound OFF";
  }
  else {
    self.btn_sound.titleLabel.text = @"Turn sound ON";
  }*/
}

-(void) show {
  
  [self fix_sound_label_text];
  CGRect frame = self.view.frame;
  frame.origin.y = 20;
  
  [UIView animateWithDuration:.3 animations:^{
    self.view.frame = frame;
  }];
  
}

-(void) hide{
  
  CGRect frame = self.view.frame;
  frame.origin.y = -frame.size.height;
  
  [UIView animateWithDuration:.3 animations:^{
    self.view.frame = frame;
  }];
}

-(void) continue_to_play{
  
  [self hide];
  [[HUDHelper shared_instance].delegate resume];
}

-(void) new_game{
  
  [self hide];
  GameSetupViewController *setup_controller = [[GameSetupViewController alloc] initWithNibName:@"GameSetupView" bundle:nil];
  //[[HUDHelper shared_instance].delegate presentModalViewController:setup_controller animated: YES];
  [[HUDHelper shared_instance].delegate presentViewController:setup_controller animated:YES completion:nil];
}

-(void) restart_game{
  
  Jogo *new_game = [Jogo findFirst];
  new_game.indice_grupo = [NSNumber numberWithInt:-1];
  
  NSArray *array_grupos = [Grupo findAll];
  for (Grupo *grupo in array_grupos) {
    grupo.casa_tabuleiro = [NSNumber numberWithInt:0];
  }
  
  [self hide];
  [[HUDHelper shared_instance].main_game_controller dismiss_controllers];
  [[HUDHelper shared_instance].main_game_controller present_groups];
  
}

-(void) toogle_sound_on_off{
  
  [Configuration shared_instance].is_sound_on = ![Configuration shared_instance].is_sound_on;
  [self fix_sound_label_text];
}

#pragma mark - Lifecycle

- (void)viewDidLoad
{
  [super viewDidLoad];
}

- (void)viewDidUnload
{
  [super viewDidUnload];
  self.btn_sound = nil;
}

@end
