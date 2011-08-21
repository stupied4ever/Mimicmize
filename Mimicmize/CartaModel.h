//
//  CartaModel.h
//  Mimicmize
//
//  Created by Leonardo Baptista on 7/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Carta.h"
#import "Carta_Localize.h"
#import "LocalizeHelper.h"

@interface Carta (CartaModel)

-(void) add_locale_with_mimica: (NSString *) mimica andLocale : (NSString *) locale;
-(Carta_Localize *) get_localized_attributes;

@end
