//
//  CardsChoiceViewController.m
//  Mimicmize
//
//  Created by Leonardo Baptista on 9/4/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "CardsChoiceViewController.h"

@implementation CardsChoiceViewController

@synthesize carta_01 = _carta_01;
@synthesize carta_02 = _carta_02;
@synthesize carta_03 = _carta_03;

@synthesize btn_carta_01 = _btn_carta_01;
@synthesize btn_carta_02 = _btn_carta_02;
@synthesize btn_carta_03 = _btn_carta_03;

@synthesize delegate = _delegate;

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

-(IBAction)select_carta:(id)sender {
  
  [self.delegate card_selected];
}

-(void) set_carta : (Carta *) carta na_posicao: (NSInteger) posicao {
  
  if (posicao == 1) {
    self.carta_01 = carta;
    [self.btn_carta_01 setTitle:[self.carta_01 get_localized_attributes].mimica forState:UIControlStateNormal];
  }
  else if (posicao == 2) {
    self.carta_02 = carta;
    [self.btn_carta_02 setTitle:[self.carta_02 get_localized_attributes].mimica forState:UIControlStateNormal];
  }
  else {
    self.carta_03 = carta;
    [self.btn_carta_03 setTitle:[self.carta_03 get_localized_attributes].mimica forState:UIControlStateNormal];
  }
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
  
}

- (void)viewDidUnload
{
    [super viewDidUnload];
  self.carta_01 = nil;
  self.carta_02 = nil;
  self.carta_03 = nil;
  
  self.btn_carta_01 = nil;
  self.btn_carta_02 = nil;
  self.btn_carta_03 = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
