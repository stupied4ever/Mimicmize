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

@interface Categoria (CategoriaModel)

-(void) add_locale_with_nome: (NSString *) nome andLocale : (NSString *) locale;

@end
