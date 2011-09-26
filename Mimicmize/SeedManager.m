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
  
  dificil = [Categoria createEntity];
  [dificil add_locale_with_nome:@"Dificil" andLocale:pt_BR];
  [dificil add_locale_with_nome:@"Hard" andLocale:en_US];
  
  lugares = [Categoria createEntity];
  [lugares add_locale_with_nome:@"Lugares" andLocale:pt_BR];
  [lugares add_locale_with_nome:@"Places" andLocale:en_US];
  
  objetos = [Categoria createEntity];
  [objetos add_locale_with_nome:@"Objetos" andLocale:pt_BR];
  [objetos add_locale_with_nome:@"Objects" andLocale:en_US];
  
  pessoas = [Categoria createEntity];
  [pessoas add_locale_with_nome:@"Pessoas" andLocale:pt_BR];
  [pessoas add_locale_with_nome:@"People" andLocale:en_US];
}

- (void) load_bundles {
  
  Bundle *main_bundle = [Bundle createEntity];
  main_bundle.comprado = [NSNumber numberWithBool:YES];
  [main_bundle add_locale_with_nome:@"Cartas principais" andLocale:pt_BR];
  [main_bundle add_locale_with_nome:@"Main cards" andLocale:en_US];
}

- (void) load_cartas {
  
  NSInteger index = 0;
  NSInteger total_cartas = 320;
  Categoria *categoria;
  
  for (index=0; index < total_cartas; index++) {
    
    Carta *nova_carta = [Carta createEntity];
    nova_carta.pontos_andar = [NSNumber numberWithInt:(index % 6) + 1];
    
    if (index < 80) {
      categoria = dificil;
    }
    else if (index < 160) {
      categoria = lugares;
    }
    else if (index < 240) {
      categoria = objetos;
    }
    else if (index < 320) {
      categoria = pessoas;
    }
    
    [nova_carta addCategoriasObject: categoria ];
    nova_carta.bundle = [Bundle findFirst];
    [nova_carta add_locale_with_mimica: [NSString stringWithFormat:@"mimica_%@_%d",[categoria get_localized_attributes].nome, index] andLocale:pt_BR];
    [nova_carta add_locale_with_mimica: [NSString stringWithFormat:@"mimic_%@_%d",[categoria get_localized_attributes].nome,index] andLocale:en_US];
  }
}

@end
