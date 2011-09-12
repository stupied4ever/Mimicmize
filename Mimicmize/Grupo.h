//
//  Grupo.h
//  Mimicmize
//
//  Created by Leonardo Baptista on 7/21/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Grupo : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * nome;
@property (nonatomic, retain) NSNumber * casa_tabuleiro;
@property (nonatomic, retain) NSNumber * ordem;
@property (nonatomic, retain) NSManagedObject *jogo;

@end
