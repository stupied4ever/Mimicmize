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
  [Configuration shared_instance].is_sound_on = YES;
}

- (void) load_categorias {
  
  dificil = [Categoria createEntity];
  [dificil add_locale_with_nome:@"Mímicas difíceis" andLocale:pt_BR];
  [dificil add_locale_with_nome:@"Hard mimics" andLocale:en_US];
  
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
  main_bundle.inapp_id = @"main_bundle";
  [main_bundle add_locale_with_nome:@"Cartas principais" andLocale:pt_BR];
  [main_bundle add_locale_with_nome:@"Main cards" andLocale:en_US];
  
  Bundle *pessoas_bundle = [Bundle createEntity];
  pessoas_bundle.comprado = [NSNumber numberWithBool:NO];
  pessoas_bundle.inapp_id = @"ruppy_mimicmize_pessoas01";
  [pessoas_bundle add_locale_with_nome:@"Pessoas Famosas" andLocale:pt_BR];
  [pessoas_bundle add_locale_with_nome:@"Famous People" andLocale:en_US];
  
  Bundle *tv_bundle = [Bundle createEntity];
  tv_bundle.comprado = [NSNumber numberWithBool:NO];
  tv_bundle.inapp_id = @"ruppy_mimicmize_tv01";
  [tv_bundle add_locale_with_nome:@"TV" andLocale:pt_BR];
  [tv_bundle add_locale_with_nome:@"TV" andLocale:en_US];
}

- (void) load_cartas {
  
  /*NSInteger index = 0;
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
  }*/
  
  [SeedManager addNewCardWithPoints: 1 andMimic:[NSArray arrayWithObjects:@"adega",@"cellar", nil] forCategory:lugares];
  [SeedManager addNewCardWithPoints: 1 andMimic:[NSArray arrayWithObjects:@"mina",@"mine", nil] forCategory:lugares];
  [SeedManager addNewCardWithPoints: 1 andMimic:[NSArray arrayWithObjects:@"oficina",@"workshop", nil] forCategory:lugares];
  [SeedManager addNewCardWithPoints: 1 andMimic:[NSArray arrayWithObjects:@"perto",@"close", nil] forCategory:lugares];
  [SeedManager addNewCardWithPoints: 1 andMimic:[NSArray arrayWithObjects:@"África do Sul",@"South Africa", nil] forCategory:lugares];
  [SeedManager addNewCardWithPoints: 1 andMimic:[NSArray arrayWithObjects:@"iceberg",@"iceberg", nil] forCategory:lugares];
  [SeedManager addNewCardWithPoints: 1 andMimic:[NSArray arrayWithObjects:@"mercado",@"market", nil] forCategory:lugares];
  [SeedManager addNewCardWithPoints: 1 andMimic:[NSArray arrayWithObjects:@"inferno",@"hell", nil] forCategory:lugares];
  [SeedManager addNewCardWithPoints: 1 andMimic:[NSArray arrayWithObjects:@"Chile",@"Chile", nil] forCategory:lugares];
  [SeedManager addNewCardWithPoints: 1 andMimic:[NSArray arrayWithObjects:@"Himalaia",@"Himalaia", nil] forCategory:lugares];
  
  [SeedManager addNewCardWithPoints: 1 andMimic:[NSArray arrayWithObjects:@"fivela",@"buckle", nil] forCategory:objetos];
  [SeedManager addNewCardWithPoints: 1 andMimic:[NSArray arrayWithObjects:@"sirene",@"buzzer", nil] forCategory:objetos];
  [SeedManager addNewCardWithPoints: 1 andMimic:[NSArray arrayWithObjects:@"bomba de gasolina",@"fuel pump", nil] forCategory:objetos];
  [SeedManager addNewCardWithPoints: 1 andMimic:[NSArray arrayWithObjects:@"condicionador de ar",@"air conditioner", nil] forCategory:objetos];
  [SeedManager addNewCardWithPoints: 1 andMimic:[NSArray arrayWithObjects:@"botão de rosa",@"rosebud", nil] forCategory:objetos];
  [SeedManager addNewCardWithPoints: 1 andMimic:[NSArray arrayWithObjects:@"bobina",@"coil", nil] forCategory:objetos];
  [SeedManager addNewCardWithPoints: 1 andMimic:[NSArray arrayWithObjects:@"cortador de unha",@"nail clipper", nil] forCategory:objetos];
  [SeedManager addNewCardWithPoints: 1 andMimic:[NSArray arrayWithObjects:@"porta-jóias",@"jewelery", nil] forCategory:objetos];
  [SeedManager addNewCardWithPoints: 1 andMimic:[NSArray arrayWithObjects:@"sarcófago",@"sarcophagus", nil] forCategory:objetos];
  [SeedManager addNewCardWithPoints: 1 andMimic:[NSArray arrayWithObjects:@"volante",@"steering wheel", nil] forCategory:objetos];
  
  [SeedManager addNewCardWithPoints: 1 andMimic:[NSArray arrayWithObjects:@"Sigmund Freud",@"Sigmund Freud", nil] forCategory:pessoas];
  [SeedManager addNewCardWithPoints: 1 andMimic:[NSArray arrayWithObjects:@"Ray Charles",@"Ray Charles", nil] forCategory:pessoas];
  [SeedManager addNewCardWithPoints: 1 andMimic:[NSArray arrayWithObjects:@"miserável",@"miserable", nil] forCategory:pessoas];
  [SeedManager addNewCardWithPoints: 1 andMimic:[NSArray arrayWithObjects:@"testemunha",@"witness", nil] forCategory:pessoas];
  [SeedManager addNewCardWithPoints: 1 andMimic:[NSArray arrayWithObjects:@"cigana",@"gypsy", nil] forCategory:pessoas];
  [SeedManager addNewCardWithPoints: 1 andMimic:[NSArray arrayWithObjects:@"mulher",@"woman", nil] forCategory:pessoas];
  [SeedManager addNewCardWithPoints: 1 andMimic:[NSArray arrayWithObjects:@"coitado",@"poor", nil] forCategory:pessoas];
  [SeedManager addNewCardWithPoints: 1 andMimic:[NSArray arrayWithObjects:@"samurai",@"samurai", nil] forCategory:pessoas];
  [SeedManager addNewCardWithPoints: 1 andMimic:[NSArray arrayWithObjects:@"mão",@"hand", nil] forCategory:pessoas];
  [SeedManager addNewCardWithPoints: 1 andMimic:[NSArray arrayWithObjects:@"cérebro",@"brain", nil] forCategory:pessoas];
  
  [SeedManager addNewCardWithPoints: 2 andMimic:[NSArray arrayWithObjects:@"civilização",@"civilization", nil] forCategory:dificil];
  [SeedManager addNewCardWithPoints: 2 andMimic:[NSArray arrayWithObjects:@"insígnia",@"badge", nil] forCategory:dificil];
  [SeedManager addNewCardWithPoints: 2 andMimic:[NSArray arrayWithObjects:@"atmosfera",@"atmosphere", nil] forCategory:dificil];
  [SeedManager addNewCardWithPoints: 2 andMimic:[NSArray arrayWithObjects:@"genocídio",@"genocide", nil] forCategory:dificil];
  [SeedManager addNewCardWithPoints: 2 andMimic:[NSArray arrayWithObjects:@"hipocondríaco",@"hypochondriac", nil] forCategory:dificil];
  [SeedManager addNewCardWithPoints: 2 andMimic:[NSArray arrayWithObjects:@"tribuna",@"tribune", nil] forCategory:dificil];
  [SeedManager addNewCardWithPoints: 2 andMimic:[NSArray arrayWithObjects:@"debutante",@"debut", nil] forCategory:dificil];
  [SeedManager addNewCardWithPoints: 2 andMimic:[NSArray arrayWithObjects:@"lampião",@"gas lamp", nil] forCategory:dificil];
  [SeedManager addNewCardWithPoints: 2 andMimic:[NSArray arrayWithObjects:@"jornada",@"journey", nil] forCategory:dificil];
  [SeedManager addNewCardWithPoints: 2 andMimic:[NSArray arrayWithObjects:@"cambalhota",@"somersault (roll)", nil] forCategory:dificil];
}

+(void) addNewCardWithPoints:(NSInteger)points andMimic:(NSArray *)mimics forCategory:(Categoria *)category{
  
  
  [SeedManager addNewCardWithPoints:points andMimic:mimics forCategory:category andBundle:[Bundle findBundleByName:@"Cartas principais"]];
}

+(void) addNewCardWithPoints:(NSInteger)points andMimic:(NSArray *)mimics forCategory:(Categoria *)category andBundle:(Bundle *) bundle{
  Carta *nova_carta = [Carta createEntity];
  nova_carta.bundle = bundle;
  nova_carta.pontos_andar = [NSNumber numberWithInt:points];
  [nova_carta add_locale_with_mimica:[mimics objectAtIndex:0]  andLocale:pt_BR];
  [nova_carta add_locale_with_mimica:[mimics objectAtIndex:1] andLocale:en_US];
  [nova_carta addCategoriasObject:category];
}

+ (void) print_all_fonts {
  
  NSArray *fonts = [UIFont familyNames];
  for (NSString *font in fonts) {
    NSLog(@"%@",font);
  }
}

@end
