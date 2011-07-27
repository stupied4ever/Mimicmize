//
//  Carta_Localize.h
//  Mimicmize
//
//  Created by Leonardo Baptista on 7/24/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Carta;

@interface Carta_Localize : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * locale;
@property (nonatomic, retain) NSString * mimica;
@property (nonatomic, retain) Carta *carta;

@end
