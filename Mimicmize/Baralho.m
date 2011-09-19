//
//  Baralho.m
//  Mimicmize
//
//  Created by Leonardo Baptista on 9/4/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Baralho.h"

@implementation Baralho

@synthesize array_cards = _array_cards;
@synthesize array_categorias = _array_categorias;

static Baralho *baralho_singletone;

-(void) shuffle_cards {
  
  //TOOD: carregar somente cartas das categorias selecionadas
  NSArray *array_de_cartas = [Carta findAll];
  
  self.array_cards = [NSMutableArray arrayWithArray: array_de_cartas];
  [self.array_cards shuffle];
}

+(void) set_categorias : (NSArray *) array_categorias {
  
  Baralho *baralho = [Baralho get_instance];
  baralho.array_categorias = array_categorias;
}

+(Baralho *) get_instance{
  
  if (baralho_singletone == nil) {
    baralho_singletone = [[Baralho alloc] init];
    baralho_singletone.array_cards = [NSMutableArray array];
  }
  return baralho_singletone;
}

+(Carta *) pick_card {
  
  Baralho *baralho = [Baralho get_instance];
  return [baralho pick_card];
}

-(Carta *) pick_card {
  
  if ([self.array_cards count] == 0) {
    [self shuffle_cards];
  } 
  
  Carta *primeira_carta = [self.array_cards objectAtIndex:0];
  [self.array_cards removeObjectAtIndex:0];
  
  return primeira_carta;
}

@end
