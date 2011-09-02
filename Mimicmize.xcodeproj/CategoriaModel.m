//
//  CategoryModel.m
//  Mimicmize
//
//  Created by Leonardo Baptista on 7/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CategoriaModel.h"

@implementation Categoria (CategoriaModel)

-(void) add_locale_with_nome: (NSString *) nome andLocale : (NSString *) locale {
  
  Categoria_Localize *localized_attributes = [Categoria_Localize createEntity];
  localized_attributes.nome = nome;
  localized_attributes.locale = locale;
  [self addLocalized_attributesObject:localized_attributes];
}

-(Categoria_Localize *) get_localized_attributes {
  
  NSString *locale = [LocalizeHelper get_local_language];
  NSPredicate *predicate = [NSPredicate predicateWithFormat:@"categoria = %@ && locale = %@",self, locale];
  return [Categoria_Localize findFirstWithPredicate:predicate ];
}

+(NSArray *) find_all_ordered {
  
  NSMutableArray *categorias = [NSMutableArray array];
  NSString *locale = [LocalizeHelper get_local_language];
  NSArray *categorias_localized = [Categoria_Localize findByAttribute:@"locale" withValue:locale andOrderBy:@"nome" ascending:YES];
  for (Categoria_Localize *localized_attributes in categorias_localized) {
    [categorias addObject:localized_attributes.categoria];
  }
  return categorias;
}

@end
