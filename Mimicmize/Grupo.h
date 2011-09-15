//
//  Grupo.h
//  Mimicmize
//
//  Created by Vitor Navarro on 9/14/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Jogo;

@interface Grupo : NSManagedObject {
@private
}
@property (nonatomic, retain) NSNumber * casa_tabuleiro;
@property (nonatomic, retain) NSString * nome;
@property (nonatomic, retain) NSNumber * ordem;
@property (nonatomic, retain) NSNumber * acertou;
@property (nonatomic, retain) Jogo *jogo;

@end
