//
//  Jogo.h
//  Mimicmize
//
//  Created by Leonardo Baptista on 9/2/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Categoria, Grupo;

@interface Jogo : NSManagedObject

@property (nonatomic, retain) NSNumber * segundos_rodada;
@property (nonatomic, retain) NSNumber * indice_grupo;
@property (nonatomic, retain) Grupo *grupo_atual;
@property (nonatomic, retain) NSSet *categorias_escolhidas;
@end

@interface Jogo (CoreDataGeneratedAccessors)

- (void)addCategorias_escolhidasObject:(Categoria *)value;
- (void)removeCategorias_escolhidasObject:(Categoria *)value;
- (void)addCategorias_escolhidas:(NSSet *)values;
- (void)removeCategorias_escolhidas:(NSSet *)values;
@end
