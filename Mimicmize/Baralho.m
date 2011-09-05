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

static Baralho *baralho_singletone;

-(void) shuffle_cards {
  
  self.array_cards = [NSMutableArray arrayWithArray:[Carta findAll]];
  [self.array_cards shuffle];
}

+(Baralho *) get_instance{
  
  if (baralho_singletone == nil) {
    baralho_singletone = [[Baralho alloc] init];
    [baralho_singletone shuffle_cards];
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
