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
  if(minutes > 0)    
    [self.lbl_seconds setText:[NSString stringWithFormat:@"%imins:%02d%@", minutes, seconds%60,[LocalizeHelper get_seconds_string]]];
  else
    [self.lbl_seconds setText:[NSString stringWithFormat:@"%02d%@", seconds%60,[LocalizeHelper get_seconds_string]]];
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
  
  self.current_game.grupo_atual.acertou = [NSNumber numberWithBool:YES];
  [self dismissModalViewControllerAnimated:NO];
  [self.delegate correct_mimic];
}

-(void)time_out{
  //[[SoundHelper sharedInstance]playWrongBuzz];
  [self dismissModalViewControllerAnimated:NO];
  [self.delegate next_group];
}

-(void)decrease_player_time{
  if ([self.current_game.grupo_atual.acertou boolValue]) return;
  
  if(play_time_seconds > 0){
    play_time_seconds = play_time_seconds-1;  
    [self show_player_time_in_minutes:play_time_seconds];
  }
  else {
    [self time_out];
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
  play_time_seconds = 3.0;//[self.current_game.segundos_rodada floatValue];
  [self.lbl_seconds setText:[LocalizeHelper convert_value_to_minutes:play_time_seconds]];
  
  [self.lbl_group setText:self.current_game.grupo_atual.nome];
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self load_with_data];
  
  [self performSelector:@selector(decrease_player_time) 
             withObject:nil 
             afterDelay:1];
}

-(void)viewDidAppear:(BOOL)animated{
  
 [HUDHelper set_delegate:self]; 
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
