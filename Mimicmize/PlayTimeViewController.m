//
//  PlayTimeViewController.m
//  Mimicmize
//
//  Created by Vitor Navarro on 9/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PlayTimeViewController.h"
#import "FinishGameViewController.h"
#import "BoardPlaceViewController.h"

@implementation PlayTimeViewController
@synthesize lbl_group = _lbl_group;
@synthesize lbl_seconds = _lbl_seconds;
@synthesize btn_correct = _btn_correct;;
@synthesize current_game= _current_game;
@synthesize next_viewcontroller= _next_viewcontroller;
@synthesize delegate = _delegate;

-(void)show_player_time_in_minutes:(NSInteger)seconds{
  NSInteger minutes = (seconds/60)%60;
  /*if(minutes > 0)
    [self.lbl_seconds setText:[NSString stringWithFormat:@"%imins:%02d%@", minutes, seconds%60,[LocalizeHelper get_seconds_string]]];
  else
    [self.lbl_seconds setText:[NSString stringWithFormat:@"%02d %@", seconds%60,[LocalizeHelper get_seconds_string]]];*/
  
  [self.lbl_seconds setText:[NSString stringWithFormat:@"%02d:%02d", minutes, seconds%60]];
}

#pragma mark - Pause Delegate

-(void) pause {
  
  [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(decrease_player_time) object:nil];
}

-(void) resume {
  
  //play_time_seconds++;
  [self performSelector:@selector(decrease_player_time) 
             withObject:nil 
             afterDelay:1];
}

#pragma mark - Game logic
- (IBAction)correct_mimic:(id)sender {
  
  if (play_time_seconds <= 0) {
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(time_out) object:nil];
    [self time_out];
    return;
  }
  
  self.current_game.grupo_atual.acertou = [NSNumber numberWithBool:YES];
  [self dismissViewControllerAnimated:NO completion:nil];
  [self.delegate correct_mimic];
}

-(void)time_out{
  
  [self dismissViewControllerAnimated:NO completion:nil];
  [self.delegate wrong_mimic];
  
  //[self.delegate next_group];
}

-(void) show_correct_mimic {
  
  if ([[LocalizeHelper get_local_language] isEqualToString:pt_BR]) {
    
    self.lbl_seconds.text = @"Seu tempo acabou";
  }
  else {
    
    self.lbl_seconds.text = @"Your time is up";
  }
}

-(void)decrease_player_time{
  if ([self.current_game.grupo_atual.acertou boolValue]) return;
  
  if(play_time_seconds == 1) {
    
    [[SoundHelper sharedInstance]playWrongBuzz];
    //[UIView animateWithDuration:0.3 animations:^{
    
    self.btn_correct.titleLabel.font = [UIFont fontWithName:@"Helsinki" size:18];
    if ([[LocalizeHelper get_local_language] isEqualToString:pt_BR]) {
      [self.btn_correct setTitle:@"Toque para continuar" forState:UIControlStateNormal];
    }
    else {
      [self.btn_correct setTitle:@"Touch to continue" forState:UIControlStateNormal];
    }
    //}];
  }
  
  if(play_time_seconds > 0){
    play_time_seconds = play_time_seconds-1;  
    [self show_player_time_in_minutes:play_time_seconds];
  }
  else {
    
    [self show_correct_mimic];
    [self performSelector:@selector(time_out) withObject:nil afterDelay:10];
    return;
  }
  [self performSelector:@selector(decrease_player_time) 
             withObject:nil 
             afterDelay:1];
}

#pragma mark - View lifecycle
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
  }
  return self;
}

-(void)load_with_data{
  self.current_game = [Jogo findFirst];

  self.current_game.grupo_atual.acertou = [NSNumber numberWithBool:NO];
  play_time_seconds = [self.current_game.segundos_rodada floatValue];
  [self show_player_time_in_minutes:play_time_seconds];
  self.lbl_group.text = self.current_game.grupo_atual.nome;
}

- (void)viewDidLoad
{
  
  self.lbl_seconds.alpha = 0;
  self.lbl_group.alpha = 0;
  self.btn_correct.alpha = 0;
  
  [super viewDidLoad];
  self.lbl_group.font = [UIFont fontWithName:@"Helsinki" size:24];
  self.lbl_seconds.font = [UIFont fontWithName:@"Helsinki" size:74];
  self.btn_correct.titleLabel.font = [UIFont fontWithName:@"Helsinki" size:24];
  [self load_with_data];
  
  [self performSelector:@selector(decrease_player_time) 
             withObject:nil 
             afterDelay:1];
}

-(void)viewDidAppear:(BOOL)animated{
  
  [HUDHelper set_delegate:self];
  
  [UIView animateWithDuration:0.3 animations:^{
    
    self.lbl_seconds.alpha = 1;
    self.lbl_group.alpha = 1;
    self.btn_correct.alpha = 1;
    
  }];
}

- (void)viewDidUnload
{
  
  [super viewDidUnload];
  self.lbl_group = nil;
  self.lbl_seconds = nil;
  self.btn_correct = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

@end
