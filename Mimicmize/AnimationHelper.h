//
//  AnimationHelper.h
//  Mimicmize
//
//  Created by Leonardo Baptista on 8/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AnimationHelper : NSObject

+(void) make_bounce_effect_with_view : ( UIView *) view offset:(NSInteger)offset;
+(void) make_inverted_bounce_effect_with_view:(UIView *)view offset:(NSInteger)offset;

+(void) make_bounce_effect_with_view :(UIView *) view bouncing_away:(UIView *) away_view offset:(NSInteger)offset;
+(void) make_inverted_bounce_effect_with_view :(UIView *) view bouncing_away:(UIView *) away_view offset:(NSInteger)offset;

@end
