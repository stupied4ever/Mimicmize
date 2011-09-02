//
//  CategoryModel.h
//  Mimicmize
//
//  Created by Leonardo Baptista on 7/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Categoria.h"
#import "Categoria_Localize.h"
#import "LocalizeHelper.h"

@interface Categoria (CategoriaModel)

-(void) add_locale_with_nome: (NSString *) nome andLocale : (NSString *) locale;
-(Categoria_Localize *) get_localized_attributes;

+(NSArray *) find_all_ordered;

@end
