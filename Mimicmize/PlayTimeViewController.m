//
//  PlayTimeViewController.m
//  Mimicmize
//
//  Created by Vitor Navarro on 9/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PlayTimeViewController.h"
#import "FinishGameViewController.h"

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
  self.current_game.grupo_atual.acertou = [NSNumber numberWithBool:YES];
  
  //[self.navigationController pushViewController:self.next_viewcontroller animated:YES];
  //ou
  //precisamos remover a view de play time, melhor forma?
  self.next_viewcontroller = [[FinishGameViewController alloc]initWithNibName:@"FinishGameView" bundle:nil];//só um teste
  [self presentModalViewController:self.next_viewcontroller animated:YES];
}

-(void)time_out{
  //[SoundHelper play_single_wrong_buzz]; quando tiver o som precisamos testar
  
  //[self.navigationController popViewControllerAnimated:YES];
  //ou
  //precisamos voltar pra view inicial do jogo, melhor forma? previous view?
  [self dismissModalViewControllerAnimated:YES];
}

-(void)decrease_player_time{
  if ([self.current_game.grupo_atual.acertou boolValue]) return;
  
  if(play_time_seconds > 0){
    play_time_seconds = play_time_seconds-1;  
    [self show_player_time_in_minutes:play_time_seconds];
  }
  else
    [self time_out];
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

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
  [super viewDidLoad];
  [self.btn_correct setTitle:NSLocalizedString(@"Correct", @"correct message") forState:UIControlStateNormal];
}

-(void)viewDidAppear:(BOOL)animated{
  [self load_with_data];
  
  [self performSelector:@selector(decrease_player_time) 
             withObject:nil 
             afterDelay:1];
}

- (void)viewDidUnload
{
    [self setLbl_group:nil];
    [self setLbl_seconds:nil];
    [self setBtn_correct:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning
{
  // Releases the view if it doesn't have a superview.
  [super didReceiveMemoryWarning];
  
  // Release any cached data, images, etc that aren't in use.
}

@end
