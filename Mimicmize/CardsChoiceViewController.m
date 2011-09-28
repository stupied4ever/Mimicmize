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

-(IBAction)select_carta:(id)sender {
  
  Carta *selected_card;
  UIButton *btn = (UIButton *)sender;
  if (btn.tag == 1) {
    selected_card = self.carta_01;
  }
  else if (btn.tag == 2) {
    selected_card = self.carta_02;
  }
  else {
    selected_card = self.carta_03;
  }
  
  [self.delegate card_selected:selected_card];
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

- (void)viewDidLoad
{
    [super viewDidLoad];
  
  [self set_carta:[Baralho pick_card] na_posicao:1];
  [self set_carta:[Baralho pick_card] na_posicao:2];
  [self set_carta:[Baralho pick_card] na_posicao:3];
  
  self.btn_carta_01.tag = 1;
  self.btn_carta_02.tag = 2;
  self.btn_carta_03.tag = 3;
  
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
