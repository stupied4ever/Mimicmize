//
//  Bundle.h
//  Mimicmize
//
//  Created by Leonardo Baptista on 7/24/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Carta, Bundle_Localize;

@interface Bundle : NSManagedObject {
@private
}
@property (nonatomic, retain) NSNumber * comprado;
@property (nonatomic, retain) NSString * inapp_id;
@property (nonatomic, retain) NSSet *cartas;
@property (nonatomic, retain) NSSet *localized_attributes;
@end

@interface Bundle (CoreDataGeneratedAccessors)
- (void)addCartasObject:(Carta *)value;
- (void)removeCartasObject:(Carta *)value;
- (void)addCartas:(NSSet *)value;
- (void)removeCartas:(NSSet *)value;
- (void)addLocalized_attributesObject:(Bundle_Localize *)value;
- (void)removeLocalized_attributesObject:(Bundle_Localize *)value;
- (void)addLocalized_attributes:(NSSet *)value;
- (void)removeLocalized_attributes:(NSSet *)value;

@end
