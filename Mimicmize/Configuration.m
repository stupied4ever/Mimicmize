//
//  Configuration.m
//  Mimicmize
//
//  Created by Leonardo Baptista on 10/13/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Configuration.h"

@implementation Configuration

static Configuration *_shared = nil;
+(Configuration *) shared_instance {
  
  if (_shared == nil) {
    _shared = [[Configuration alloc] init];
  }
  
  return _shared;
}

-(BOOL) is_sound_on {
  
  return [[NSUserDefaults standardUserDefaults] boolForKey:IS_SOUND_ON];
}

-(void) setIs_sound_on:(BOOL)is_sound_on {
  
  [[NSUserDefaults standardUserDefaults] setBool:is_sound_on forKey:IS_SOUND_ON];
  [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
