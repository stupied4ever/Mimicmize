//
//  JogoModel.m
//  Mimicmize
//
//  Created by Leonardo Baptista on 7/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "JogoModel.h"

@implementation Jogo (JogoModel)

-(Grupo *) next_grupo {
  
  NSInteger total = [[Grupo findAll] count];
  NSNumber *proximo_indice = [NSNumber numberWithInt: ([self.indice_grupo intValue]+1) % total];
  Grupo *grupo_atual = [Grupo findFirstByAttribute:@"ordem" withValue:proximo_indice];
  self.indice_grupo = proximo_indice;
  self.grupo_atual = grupo_atual;
  return grupo_atual;
}

@end
