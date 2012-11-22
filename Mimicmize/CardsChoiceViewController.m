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
  
  UIButton *btn = (UIButton *)sender;
  btn.selected = YES;
  
  CGRect frame_btn = btn.frame;
  frame_btn.origin.y = 54;
  
  [UIView animateWithDuration:0.3 animations:^{
    
    self.btn_carta_01.alpha = 0;
    self.btn_carta_02.alpha = 0;
    self.btn_carta_03.alpha = 0;
    btn.alpha = 1;
    btn.frame = frame_btn;
    btn.titleLabel.font = [UIFont fontWithName:@"FontleroyBrown" size:32];
    self.btn_start.alpha = 1;
  }];
  
  self.btn_start.tag = btn.tag;
}

-(IBAction)start:(id)sender {
  
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
  
  UIViewController *controller = (UIViewController *)self.delegate;
  [controller performSelector:@selector(card_selected:) withObject:selected_card afterDelay:0.2];
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

-(void) set_title_for_label {
  
  Jogo *jogo_atual = [Jogo findFirst];
  self.lbl_titulo.text = [NSString stringWithFormat:@"%@ %@",self.lbl_titulo.text, jogo_atual.grupo_atual.nome];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  self.btn_start.alpha = 0;
  self.lbl_titulo.font = [UIFont fontWithName:@"Helsinki" size:12];
  [self set_title_for_label];
  
  self.btn_carta_01.titleLabel.font = [UIFont fontWithName:@"FontleroyBrown" size:32];
  self.btn_carta_02.titleLabel.font = [UIFont fontWithName:@"FontleroyBrown" size:32];
  self.btn_carta_03.titleLabel.font = [UIFont fontWithName:@"FontleroyBrown" size:32];
  
  [self set_carta:[Baralho pick_card] na_posicao:1];
  [self set_carta:[Baralho pick_card] na_posicao:2];
  [self set_carta:[Baralho pick_card] na_posicao:3];
  
  self.btn_carta_01.tag = 1;
  self.btn_carta_02.tag = 2;
  self.btn_carta_03.tag = 3;
}

- (void)viewDidUnload
{
    [self setLbl_titulo:nil];
  [self setBtn_start:nil];
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
