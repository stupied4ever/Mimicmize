//
//  Configuration.h
//  Mimicmize
//
//  Created by Leonardo Baptista on 10/13/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define IS_SOUND_ON @"is_sound_on"

@interface Configuration : NSObject

@property (nonatomic, assign) BOOL is_sound_on;

+(Configuration *) shared_instance;

@end
