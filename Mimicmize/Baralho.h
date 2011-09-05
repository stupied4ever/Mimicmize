//
//  Baralho.h
//  Mimicmize
//
//  Created by Leonardo Baptista on 9/4/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Carta.h"
#import "NSMutableArray+Helper.h"

//Single tone
@interface Baralho : NSObject

@property (nonatomic, strong) NSMutableArray *array_cards;

+(Baralho *) get_instance;
+(Carta *) pick_card;
-(Carta *) pick_card;

@end
