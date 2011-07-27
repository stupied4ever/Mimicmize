//
//  Jogo.h
//  Mimicmize
//
//  Created by Leonardo Baptista on 7/21/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Grupo;

@interface Jogo : NSManagedObject {
@private
}
@property (nonatomic, retain) NSNumber * segundos_rodada;
@property (nonatomic, retain) Grupo *grupo_atual;

@end
