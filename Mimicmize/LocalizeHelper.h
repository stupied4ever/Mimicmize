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
+(NSString *) get_seconds_string;
+(NSString *) convert_value_to_minutes : (float)value;
+(NSString *) get_text_to_group_box_with_index : (NSInteger) index;

@end
