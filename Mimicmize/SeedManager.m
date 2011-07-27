//
//  SeedManager.m
//  Mimicmize
//
//  Created by Leonardo Baptista on 7/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SeedManager.h"

@implementation SeedManager

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (BOOL) verifica_se_precisa_carregar {
  
  return [[Carta findAll] count] == 0;
}

- (void) load_all_fixtures {
  
  if (![self verifica_se_precisa_carregar]) {
    return;
  }
  
  [self load_categorias];
  [self load_bundles];
  [self load_cartas];
}

- (void) load_categorias {
  
  Categoria *dificil = [Categoria createEntity];
  [dificil add_locale_with_nome:@"Dificil" andLocale:@"pt_BR"];
  [dificil add_locale_with_nome:@"Hard" andLocale:@"en_US"];
}

- (void) load_bundles {
  
  Bundle *main_bundle = [Bundle createEntity];
  main_bundle.comprado = [NSNumber numberWithBool:YES];
  [main_bundle add_locale_with_nome:@"Cartas principais" andLocale:@"pt_BR"];
  [main_bundle add_locale_with_nome:@"Main cards" andLocale:@"en_US"];
}

- (void) load_cartas {
  
  NSInteger index = 0;
  NSInteger total_cartas = 30;
  
  for (index=0; index < total_cartas; index++) {
    
    Carta *nova_carta = [Carta createEntity];
    nova_carta.pontos_andar = [NSNumber numberWithInt:(index % 6) + 1];
    [nova_carta addCategoriasObject:[Categoria findFirst]];
    nova_carta.bundle = [Bundle findFirst];
    [nova_carta add_locale_with_mimica: [NSString stringWithFormat:@"mimica_%d",index] andLocale:@"pt_BR"];
    [nova_carta add_locale_with_mimica: [NSString stringWithFormat:@"mimic__%d",index] andLocale:@"en_US"];
  }
}

@end
