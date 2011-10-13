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
  NSArray *array_grupos = [Grupo findAll];
  NSInteger index =0;
  for (Grupo *grupo in array_grupos) {
    grupo.casa_tabuleiro = [NSNumber numberWithInt:0];
    grupo.ordem = [NSNumber numberWithInt:index];
    index++;    
  }
  current_game.indice_grupo = [NSNumber numberWithInt:-1];
  //[[NSManagedObjectContext defaultContext] save];//problema no save
}

#pragma mark - IBActions

- (IBAction)onPlayAgainTouched:(id)sender {
  [self resetGame];
  //BoardPlaceViewController *board = [[BoardPlaceViewController alloc]initWithNibName:@"BoardPlaceView" bundle:nil];
  [self dismissModalViewControllerAnimated:YES];  //leva para a tela inicial de jogo BoardPlaceView
}

- (IBAction)onMenuTouched:(id)sender {
  //MainMenuViewController *menu = [[MainMenuViewController alloc]initWithNibName:@"MainMenuView" bundle:nil];
  //[self presentModalViewController:menu animated:YES];
  [self dismissModalViewControllerAnimated:YES];
}


- (IBAction)onFacebookTouched:(id)sender {
  NSString *comment = [NSString stringWithFormat:@"Meu grupo %@ ganhou uma partida de Mimicmize",
                     current_game.grupo_atual.nome];
  
  SHKItem *share_item = [SHKItem text:comment];
  [SHKFacebook shareItem:share_item];
}

- (IBAction)onTwitterTouched:(id)sender {  
  NSString *tweet = [NSString stringWithFormat:@"Meu grupo %@ ganhou uma partida de #Mimicmize",
                     current_game.grupo_atual.nome];
  
  SHKItem *share_item = [SHKItem text:tweet];
  [SHKTwitter shareItem:share_item];
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
  current_game = [Jogo findFirst];
  [self.lbl_winner_group setText:current_game.grupo_atual.nome];
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
