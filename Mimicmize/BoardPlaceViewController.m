//
//  BoardPlaceViewController.m
//  Mimicmize
//
//  Created by Leonardo Baptista on 9/2/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "BoardPlaceViewController.h"

@implementation BoardPlaceViewController

@synthesize carta_01 = _carta_01;
@synthesize carta_02 = _carta_02;
@synthesize carta_03 = _carta_03;
@synthesize carta_04 = _carta_04;
@synthesize cards_choice_controller = _cards_choice_controller;
@synthesize animation = _animation;

@synthesize img_1 = _img_1;
@synthesize img_2 = _img_2;
@synthesize img_3 = _img_3;
@synthesize img_go = _img_go;

@synthesize carta_selecionada = _carta_selecionada;
@synthesize pushed_controller = _pushed_controller;

-(void) prepare_layout_for_animation {
  
  self.img_1.backgroundColor = [UIColor redColor];
  self.img_2.backgroundColor = [UIColor greenColor];
  self.img_3.backgroundColor = [UIColor blueColor];
  self.img_go.backgroundColor = [UIColor yellowColor];
}

-(void) card_selected : (Carta *) card {
  
  self.carta_selecionada = card;
  [self prepare_layout_for_animation];
  [self.animation show_3_2_1_go:^ {
    PlayTimeViewController *play_controller = [[PlayTimeViewController alloc] initWithNibName:@"PlayTimeView" bundle:nil];
    [play_controller set_delegate:self];
    self.pushed_controller = play_controller;
    [self presentModalViewController:play_controller animated:NO];
  }];
}

- (UIView *) get_view_opcoes {
  
  self.cards_choice_controller = [[CardsChoiceViewController alloc] initWithNibName:@"CardChoiceView" bundle:nil];
  self.cards_choice_controller.delegate = self;
  return self.cards_choice_controller.view;
}

#pragma mark - Events

-(IBAction)select_card:(id)sender {
  
  UIButton *btn_selected = (UIButton *)sender;
  [btn_selected addSubview:[self get_view_opcoes]];
  [self.animation show_selected_card:btn_selected];
}

-(void) correct_mimic {
  
  BoardMoveViewController *board_move_controller = [[BoardMoveViewController alloc] initWithNibName:@"BoardMoveView" bundle:nil];
  [board_move_controller set_delegate:self];
  self.pushed_controller = board_move_controller;
  [self presentModalViewController:board_move_controller animated:NO];
}

- (void)rearrange_view {
  
  [self.animation center_all_cards];
  [self.cards_choice_controller.view removeFromSuperview];
  self.cards_choice_controller = nil;
  self.carta_01.alpha = 1;
  self.carta_02.alpha = 1;
  self.carta_03.alpha = 1;
  self.carta_04.alpha = 1;
}

-(void) next_group {
  
  Jogo *jogo_atual = [Jogo findFirst];
  if ([jogo_atual.grupo_atual.casa_tabuleiro intValue] > 3) {
    FinishGameViewController *finish_controller = [[FinishGameViewController alloc] initWithNibName:@"FinishGameView" bundle:nil];
    self.pushed_controller = finish_controller;
    [self presentModalViewController:finish_controller animated:NO];
    return;
  }
  
  [self rearrange_view];
  [self.animation show_cards];
  [[SoundHelper sharedInstance]playSoundWithName:@"shufflecards1"];
  [jogo_atual next_grupo];
}

-(void) walk_group {
  
  Jogo *jogo_atual = [Jogo findFirst];
  
  NSInteger total_casas_andar = [self.carta_selecionada.pontos_andar intValue];
  NSInteger casa_atual = [jogo_atual.grupo_atual.casa_tabuleiro intValue];
  jogo_atual.grupo_atual.casa_tabuleiro = [NSNumber numberWithInt: total_casas_andar + casa_atual];
}

-(void) dismiss_controllers {
  
  [self.pushed_controller dismissModalViewControllerAnimated:NO];
}

#pragma mark - Pause Delegate

-(void) pause {
  
  
}

-(void) resume {
  
  
}

#pragma mark - View lifecycle

-(void) viewDidAppear:(BOOL)animated {
  
  self.pushed_controller = nil;
  [HUDHelper set_delegate:self];
  [HUDHelper show];
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  self.animation = [[CardsAnimationHelper alloc] init];
  self.animation.card01 = self.carta_01;
  self.animation.card02 = self.carta_02;
  self.animation.card03 = self.carta_03;
  self.animation.card04 = self.carta_04;
  
  self.animation.img_1 = self.img_1;
  self.animation.img_2 = self.img_2;
  self.animation.img_3 = self.img_3;
  self.animation.img_go = self.img_go;
}

- (void)viewDidUnload
{
  [super viewDidUnload];
  self.carta_01 = nil;
  self.carta_02 = nil;
  self.carta_03 = nil;
  self.carta_04 = nil;
  self.cards_choice_controller = nil;
  self.animation = nil;
  
  self.img_1 = nil;
  self.img_2 = nil;
  self.img_3 = nil;
  self.img_go = nil;
  
  self.carta_selecionada = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
