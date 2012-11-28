//
//  BundleModel.h
//  Mimicmize
//
//  Created by Leonardo Baptista on 7/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bundle.h"
#import "Bundle_Localize.h"
#import "LocalizeHelper.h"

@interface Bundle (BundleModel)

-(void) add_locale_with_nome: (NSString *) nome andLocale : (NSString *) locale;
-(Bundle_Localize *) get_localized_attributes;
+(Bundle *) findBundleByName : (NSString *) name;

@end
