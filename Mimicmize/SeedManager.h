//
//  SeedManager.h
//  Mimicmize
//
//  Created by Leonardo Baptista on 7/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CartaModel.h"
#import "CategoriaModel.h"
#import "BundleModel.h"
#import "Carta_Localize.h"
#import "LocalizeHelper.h"

@interface SeedManager : NSObject {
  
  Categoria *dificil;
  Categoria *lugares;
  Categoria *objetos;
  Categoria *pessoas;
}

- (void) load_all_fixtures;
- (void) load_categorias;
- (void) load_bundles;
- (void) load_cartas;

+ (void) print_all_fonts;

@end
