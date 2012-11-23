//
//  BoardMoveViewController.m
//  Mimicmize
//
//  Created by Leonardo Baptista on 9/14/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "BoardMoveViewController.h"
#import "BoardPlaceViewController.h"

@implementation BoardMoveViewController

-(void) dismiss {
  
  [self dismissViewControllerAnimated:NO completion:nil];
  [delegate next_group];
}

-(void) set_delegate : (BoardPlaceViewController *)p_delegate {
  
  delegate = p_delegate;
}

-(void) showViewAnimated: (UIView *) view {
  
  [UIView animateWithDuration:0.2 animations:^{
    view.alpha = 1;
  }];
}

-(void) hideViewAnimated: (UIView *) view {
  
  [UIView animateWithDuration:0.2 animations:^{
    view.alpha = 0;
  }];
}

-(void) start_animation {
  
  float delay = 0;
  NSInteger tag = 100;
  
  Jogo *jogo_atual = [Jogo findFirst];
  Grupo *grupo_atual = jogo_atual.grupo_atual;
  
  for (Grupo *grupo in [Grupo findAllSortedBy:@"ordem" ascending:YES]) {
    
    UILabel *lbl = (UILabel *)[self.view viewWithTag:tag];
    lbl.text  = grupo.nome;
    
    UILabel *lbl_pontos = (UILabel *)[self.view viewWithTag:tag + 900];
    
    if (grupo_atual == grupo && self.qtd_casas_andar > 0) {
      lbl_pontos.text  = [NSString stringWithFormat:@"%.2d",[grupo.casa_tabuleiro integerValue]-self.qtd_casas_andar];
    }
    else {
      lbl_pontos.text  = [NSString stringWithFormat:@"%.2d",[grupo.casa_tabuleiro integerValue]];
    }
    
    
    [self performSelector:@selector(showViewAnimated:) withObject:lbl afterDelay:delay];
    [self performSelector:@selector(showViewAnimated:) withObject:lbl_pontos afterDelay:delay+0.1];
    
    tag++;
    delay+= 0.3;
  }
  
  if (self.qtd_casas_andar > 0) {
    
    UILabel *lbl_pontos = (UILabel *)[self.view viewWithTag:1000 + [grupo_atual.ordem integerValue]];
    [lbl_pontos performSelector:@selector(setText:)
                     withObject:[NSString stringWithFormat:@"%.2d",[grupo_atual.casa_tabuleiro integerValue]]
                     afterDelay:delay + 1.2 ];
  }
  
  [self performSelector:@selector(end_animation) withObject:nil afterDelay:4];
}

-(void) end_animation {
  
  float delay = 0;
  NSInteger tag = 100;
  
  for (Grupo *grupo in [Grupo findAllSortedBy:@"ordem" ascending:YES]) {
    
    UILabel *lbl = (UILabel *)[self.view viewWithTag:tag];
    UILabel *lbl_pontos = (UILabel *)[self.view viewWithTag:tag + 900];
    
    [self performSelector:@selector(hideViewAnimated:) withObject:lbl afterDelay:delay];
    [self performSelector:@selector(hideViewAnimated:) withObject:lbl_pontos afterDelay:delay+0.1];
    
    tag++;
    delay+= 0.3;
  }
  [self performSelector:@selector(hideViewAnimated:) withObject:self.img_grupo afterDelay:delay+0.2];
  [self performSelector:@selector(showViewAnimated:) withObject:self.img_next_grupo afterDelay:delay+0.5];
  
  [self performSelector:@selector(dismiss) withObject:nil afterDelay:2];
}

-(void) viewDidLoad {
  
  self.img_next_grupo.alpha = 0;
  
  Jogo *jogo_atual = [Jogo findFirst];
  NSInteger total = [[Grupo findAll] count];
  NSNumber *proximo_indice = [NSNumber numberWithInt: ([jogo_atual.indice_grupo intValue]+1) % total];
  Grupo *proximo_grupo = [Grupo findFirstByAttribute:@"ordem" withValue:proximo_indice];
  self.img_next_grupo.image =[UIImage imageNamed: proximo_grupo.imagem];
  
  self.lbl_grupo1.font = [UIFont fontWithName:@"Helsinki" size:24];
  self.lbl_grupo2.font = [UIFont fontWithName:@"Helsinki" size:24];
  self.lbl_grupo3.font = [UIFont fontWithName:@"Helsinki" size:24];
  self.lbl_grupo4.font = [UIFont fontWithName:@"Helsinki" size:24];
  
  self.lbl_pontos_grupo1.font = [UIFont fontWithName:@"Helsinki" size:24];
  self.lbl_pontos_grupo2.font = [UIFont fontWithName:@"Helsinki" size:24];
  self.lbl_pontos_grupo3.font = [UIFont fontWithName:@"Helsinki" size:24];
  self.lbl_pontos_grupo4.font = [UIFont fontWithName:@"Helsinki" size:24];
  
  self.lbl_grupo1.alpha = 0;
  self.lbl_grupo2.alpha = 0;
  self.lbl_grupo3.alpha = 0;
  self.lbl_grupo4.alpha = 0;
  
  self.lbl_pontos_grupo1.alpha = 0;
  self.lbl_pontos_grupo2.alpha = 0;
  self.lbl_pontos_grupo3.alpha = 0;
  self.lbl_pontos_grupo4.alpha = 0;
  

  Grupo *grupo_atual = jogo_atual.grupo_atual;
  self.img_grupo.image = [UIImage imageNamed:grupo_atual.imagem];
}

-(void) viewDidAppear:(BOOL)animated {
  
  [HUDHelper set_delegate:self];
  [self start_animation];
}

#pragma mark - Pausable Protocol

-(void) pause {
  
}

-(void) resume {
  
}

- (void)viewDidUnload {
  [self setLbl_grupo1:nil];
  [self setLbl_grupo2:nil];
  [self setLbl_grupo3:nil];
  [self setLbl_grupo4:nil];
  [self setLbl_pontos_grupo1:nil];
  [self setLbl_pontos_grupo2:nil];
  [self setLbl_pontos_grupo3:nil];
  [self setLbl_pontos_grupo4:nil];
  [self setImg_grupo:nil];
  [self setImg_next_grupo:nil];
  [super viewDidUnload];
}
@end
