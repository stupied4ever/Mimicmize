//
//  Categoria.h
//  Mimicmize
//
//  Created by Leonardo Baptista on 9/2/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Carta, Jogo;

@interface Categoria : NSManagedObject

@property (nonatomic, retain) NSSet *cartas;
@property (nonatomic, retain) NSSet *localized_attributes;
@property (nonatomic, retain) Jogo *jogo_atual;
@end

@interface Categoria (CoreDataGeneratedAccessors)

- (void)addCartasObject:(Carta *)value;
- (void)removeCartasObject:(Carta *)value;
- (void)addCartas:(NSSet *)values;
- (void)removeCartas:(NSSet *)values;
- (void)addLocalized_attributesObject:(NSManagedObject *)value;
- (void)removeLocalized_attributesObject:(NSManagedObject *)value;
- (void)addLocalized_attributes:(NSSet *)values;
- (void)removeLocalized_attributes:(NSSet *)values;
@end
