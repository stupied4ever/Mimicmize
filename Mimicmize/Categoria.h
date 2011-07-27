//
//  Categoria.h
//  Mimicmize
//
//  Created by Leonardo Baptista on 7/24/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Carta;

@interface Categoria : NSManagedObject {
@private
}
@property (nonatomic, retain) NSSet *cartas;
@property (nonatomic, retain) NSSet *localized_attributes;
@end

@interface Categoria (CoreDataGeneratedAccessors)
- (void)addCartasObject:(Carta *)value;
- (void)removeCartasObject:(Carta *)value;
- (void)addCartas:(NSSet *)value;
- (void)removeCartas:(NSSet *)value;
- (void)addLocalized_attributesObject:(NSManagedObject *)value;
- (void)removeLocalized_attributesObject:(NSManagedObject *)value;
- (void)addLocalized_attributes:(NSSet *)value;
- (void)removeLocalized_attributes:(NSSet *)value;

@end
