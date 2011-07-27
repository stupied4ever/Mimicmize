//
//  Categoria_Localize.h
//  Mimicmize
//
//  Created by Leonardo Baptista on 7/24/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Categoria;

@interface Categoria_Localize : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * nome;
@property (nonatomic, retain) NSString * locale;
@property (nonatomic, retain) Categoria *categoria;

@end
