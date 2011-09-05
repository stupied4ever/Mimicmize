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

@synthesize board_place_controller = _board_place_controller;

#pragma mark - Events

-(IBAction)new_game:(id)sender {
  
  GameSetupViewController *setup_controller = [[GameSetupViewController alloc] initWithNibName:@"GameSetupView" bundle:nil];
  [self presentModalViewController:setup_controller animated:YES];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
  
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
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
  
  //if (comecar_partida) {
  if (true) {
    //self.view = self.board_place_controller.view;
    [self presentModalViewController:self.board_place_controller animated:NO];
  }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
  
  self.btn_new_game = nil;
  self.btn_options = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
