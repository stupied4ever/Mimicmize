//
//  BundleModel.m
//  Mimicmize
//
//  Created by Leonardo Baptista on 7/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BundleModel.h"

@implementation Bundle (BundleModel)

-(void) add_locale_with_nome: (NSString *) nome andLocale : (NSString *) locale {
  
  Bundle_Localize *localized_attributes = [Bundle_Localize createEntity];
  localized_attributes.nome = nome;
  localized_attributes.locale = locale;
  [self addLocalized_attributesObject:localized_attributes];
}

@end
