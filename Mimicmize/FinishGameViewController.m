//
//  FinishGameViewController.m
//  Mimicmize
//
//  Created by Vitor Navarro on 9/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FinishGameViewController.h"

@implementation FinishGameViewController
@synthesize img_view_background;
@synthesize lbl_winner_group;
@synthesize lbl_won;
@synthesize btn_play_again;
@synthesize btn_menu;
@synthesize btn_twitter;
@synthesize btn_facebook;

-(void) resetGame {  
  
  Jogo *new_game = [Jogo findFirst];
  new_game.indice_grupo = [NSNumber numberWithInt:-1];
  
  NSArray *array_grupos = [Grupo findAll];
  for (Grupo *grupo in array_grupos) {
    grupo.casa_tabuleiro = [NSNumber numberWithInt:0];
  }
  
  [[HUDHelper shared_instance].main_game_controller dismiss_controllers];
  [[HUDHelper shared_instance].main_game_controller present_groups];
}

#pragma mark - IBActions

- (IBAction)onPlayAgainTouched:(id)sender {
  [self resetGame];
}

- (IBAction)onMenuTouched:(id)sender {
  
  [self dismissViewControllerAnimated:NO completion:nil];
  GameSetupViewController *setup_controller = [[GameSetupViewController alloc] initWithNibName:@"GameSetupView" bundle:nil];
  [[HUDHelper shared_instance].delegate presentViewController:setup_controller animated:YES completion:nil];
}


- (IBAction)onFacebookTouched:(id)sender {
  
  NSString *tweet;
  if ([[LocalizeHelper get_local_language] isEqualToString:pt_BR]) {
    
    tweet = [NSString stringWithFormat:@"Meu grupo %@ ganhou uma partida de Mimicmize",
             current_game.grupo_atual.nome];
  }
  else {
    
    tweet = [NSString stringWithFormat:@"My group %@ just won a Mimicmize match",
             current_game.grupo_atual.nome];
  }
  
  SLComposeViewController *mySLComposerSheet = [[SLComposeViewController alloc] init];
  mySLComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
  [mySLComposerSheet setInitialText:tweet];
  //[mySLComposerSheet addImage:yourimage];
  [self presentViewController:mySLComposerSheet animated:YES completion:nil];
  
}

- (IBAction)onTwitterTouched:(id)sender {
  
  NSString *tweet;
  if ([[LocalizeHelper get_local_language] isEqualToString:pt_BR]) {
    
    tweet = [NSString stringWithFormat:@"Meu grupo %@ ganhou uma partida de #Mimicmize",
                       current_game.grupo_atual.nome];
  }
  else {
    
    tweet = [NSString stringWithFormat:@"My group %@ just won a #Mimicmize match",
             current_game.grupo_atual.nome];
  }
  
  TWTweetComposeViewController *twitter = [[TWTweetComposeViewController alloc] init];
  [twitter setInitialText:tweet];
  [self presentViewController:twitter animated:YES completion:nil];
}

#pragma mark - Pausable Protocol

-(void) pause {
  
}

-(void) resume {
  
}

#pragma mark - View lifecycle

-(void) viewDidAppear:(BOOL)animated {
  
  [HUDHelper set_delegate:self];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  self.lbl_winner_group.font = [UIFont fontWithName:@"Helsinki" size:24];
  self.lbl_won.font = [UIFont fontWithName:@"Helsinki" size:16];
  
  current_game = [Jogo findFirst];
  [self.lbl_winner_group setText:current_game.grupo_atual.nome];
  
  if (NSClassFromString(@"SLComposeViewController") == nil) {
    
    self.btn_facebook.hidden = YES;
  }
  else {
    
    self.btn_facebook.hidden = [SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook] == NO;
  }
  
  if ([[LocalizeHelper get_local_language] isEqualToString:pt_BR]) {
    
    self.lbl_won.text = @"Parabéns! Você ganhou essa, que tal uma nova partida?";
  }
  else {
    self.lbl_won.text = @"Congratulations! You have won this one, what about a new challenge?";
  }
}

- (void)viewDidUnload
{
    [self setImg_view_background:nil];
    [self setLbl_winner_group:nil];
    [self setLbl_won:nil];
    [self setBtn_play_again:nil];
    [self setBtn_menu:nil];
    [self setBtn_twitter:nil];
    [self setBtn_facebook:nil];
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
