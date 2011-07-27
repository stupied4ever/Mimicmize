//
//  Carta.h
//  Mimicmize
//
//  Created by Leonardo Baptista on 7/24/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Bundle, Carta_Localize, Categoria;

@interface Carta : NSManagedObject {
@private
}
@property (nonatomic, retain) NSNumber * pontos_andar;
@property (nonatomic, retain) Bundle *bundle;
@property (nonatomic, retain) NSSet *categorias;
@property (nonatomic, retain) NSSet *localized_attributes;
@end

@interface Carta (CoreDataGeneratedAccessors)
- (void)addCategoriasObject:(Categoria *)value;
- (void)removeCategoriasObject:(Categoria *)value;
- (void)addCategorias:(NSSet *)value;
- (void)removeCategorias:(NSSet *)value;
- (void)addLocalized_attributesObject:(Carta_Localize *)value;
- (void)removeLocalized_attributesObject:(Carta_Localize *)value;
- (void)addLocalized_attributes:(NSSet *)value;
- (void)removeLocalized_attributes:(NSSet *)value;

@end
