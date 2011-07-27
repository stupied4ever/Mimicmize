//
//  CartaModel.m
//  Mimicmize
//
//  Created by Leonardo Baptista on 7/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CartaModel.h"

@implementation Carta (CartaModel)

-(void) add_locale_with_mimica: (NSString *) mimica andLocale : (NSString *) locale {
  
  Carta_Localize *localized_attributes = [Carta_Localize createEntity];
  localized_attributes.mimica = mimica;
  localized_attributes.locale = locale;
  [self addLocalized_attributesObject:localized_attributes];
}

@end
