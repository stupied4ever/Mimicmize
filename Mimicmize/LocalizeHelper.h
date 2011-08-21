//
//  LocalizeHelper.h
//  Mimicmize
//
//  Created by Leonardo Baptista on 8/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#define pt_BR @"pt_BR"
#define en_US @"en_US"

@interface LocalizeHelper : NSObject

+(NSString *) get_local_language;

@end
