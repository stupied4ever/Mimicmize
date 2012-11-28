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

-(Bundle_Localize *) get_localized_attributes {
  
  NSString *locale = [LocalizeHelper get_local_language];
  NSPredicate *predicate = [NSPredicate predicateWithFormat:@"bundle = %@ && locale = %@",self, locale];
  return [Bundle_Localize findFirstWithPredicate:predicate ];
}

+(Bundle *) findBundleByName : (NSString *) name {
  
  Bundle_Localize *localized = [Bundle_Localize findFirstByAttribute:@"nome" withValue:name];
  return localized.bundle;
}

@end
