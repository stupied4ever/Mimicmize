//
//  PlayTimeViewController.m
//  Mimicmize
//
//  Created by Vitor Navarro on 9/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PlayTimeViewController.h"

@implementation PlayTimeViewController
@synthesize lbl_group;
@synthesize lbl_seconds;
@synthesize btn_correct;
@synthesize current_game=_current_game;
@synthesize next_viewcontroller=_next_viewcontroller;


-(void)show_player_time_in_minutes:(NSInteger)seconds{
  NSInteger minutes = (seconds/60)%60;
  if(minutes > 0)    
    [self.lbl_seconds setText:[NSString stringWithFormat:@"%imins:%02d%@", minutes, seconds%60,[LocalizeHelper get_seconds_string]]];
  else
    [self.lbl_seconds setText:[NSString stringWithFormat:@"%02d%@", seconds%60,[LocalizeHelper get_seconds_string]]];
}

#pragma mark - Game logic
- (IBAction)correct_mimic:(id)sender {
  
  self.next_viewcontroller = [[BoardMoveViewController alloc] initWithNibName:@"BoardMoveView" bundle:nil];
  
  play_time_seconds = 10;
  [self presentModalViewController:self.next_viewcontroller animated:NO];
}

-(void)time_out{
  //[SoundHelper play_single_wrong_buzz]; quando tiver o som precisamos testar
  
  //[self.navigationController popViewControllerAnimated:YES];
  //ou
  //precisamos voltar pra view inicial do jogo, melhor forma? previous view?
  [self dismissModalViewControllerAnimated:NO];
}

-(void)decrease_player_time{    
  if(play_time_seconds > 0){
    play_time_seconds = play_time_seconds-1;  
    [self show_player_time_in_minutes:play_time_seconds];
  }
  else
    [self time_out];
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
  play_time_seconds = 3.0;//[self.current_game.segundos_rodada floatValue];
  NSLog(@"Play time seconds on load:%f",play_time_seconds);
  [self.lbl_seconds setText:[LocalizeHelper convert_value_to_minutes:play_time_seconds]];
  
  [self.lbl_group setText:self.current_game.grupo_atual.nome];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
  [super viewDidLoad];
  
  [self load_with_data];
  
  [NSTimer scheduledTimerWithTimeInterval:1
                                   target:self 
                                 selector:@selector(decrease_player_time)
                                 userInfo:nil 
                                  repeats:YES];
}

- (void)viewDidUnload
{
    [self setLbl_group:nil];
    [self setLbl_seconds:nil];
    [self setBtn_correct:nil];
    [super viewDidUnload];
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
