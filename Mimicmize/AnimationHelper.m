//
//  AnimationHelper.m
//  Mimicmize
//
//  Created by Leonardo Baptista on 8/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AnimationHelper.h"

@implementation AnimationHelper

+(void) animate_bobos : (UIImageView *) img_bobo {
  
  /*img_bobo.layer.anchorPoint = CGPointMake(.5, .85);
  [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
    
    img_bobo.transform = CGAffineTransformMakeRotation(M_PI/2.8 );
  } completion:^(BOOL finished) {
    
    [UIView animateWithDuration:2 animations:^{
      img_bobo.transform = CGAffineTransformMakeRotation(-M_PI/2.8);
    }];
    
  }];*/
  
}

+(void) make_bounce_effect_with_view : ( UIView *) view offset:(NSInteger)offset {
  
  [UIView animateWithDuration:.3 delay:0 options:UIViewAnimationCurveEaseIn
   animations:^{ 
     CGRect frame = view.frame;
     frame.origin.x = -40 + offset;
     view.frame = frame;
   } 
   completion:^(BOOL finished){
     
     [UIView animateWithDuration:.13 animations:^{
       CGRect frame = view.frame;
       frame.origin.x = offset;
       view.frame = frame; 
     }];
     
   }];
  
}

+(void) make_inverted_bounce_effect_with_view:(UIView *)view offset:(NSInteger)offset {
  
  [UIView animateWithDuration:.3 delay:0 options:UIViewAnimationCurveEaseIn
   animations:^{ 
     CGRect frame = view.frame;
     frame.origin.x = 40 + offset;
     view.frame = frame;
   } 
   completion:^(BOOL finished){
     
     [UIView animateWithDuration:.13 animations:^{
       CGRect frame = view.frame;
       frame.origin.x = offset;
       view.frame = frame; 
     }];
     
   }];
}

+(void) make_bounce_effect_with_view :(UIView *) view bouncing_away:(UIView *) away_view offset:(NSInteger)offset {
  
  [AnimationHelper make_bounce_effect_with_view:view offset:offset];
  [UIView animateWithDuration:.3 delay:0 options:UIViewAnimationCurveEaseIn
   animations:^{ 
     CGRect frame = away_view.frame;
     frame.origin.x = -320;
     away_view.frame = frame;
   } 
   completion:^(BOOL finished){
   }];
}

+(void) make_inverted_bounce_effect_with_view :(UIView *) view bouncing_away:(UIView *) away_view offset:(NSInteger)offset {
  
  [AnimationHelper make_inverted_bounce_effect_with_view:view offset:offset];
  [UIView animateWithDuration:.3 delay:0 options:UIViewAnimationCurveEaseIn
   animations:^{ 
     CGRect frame = away_view.frame;
     frame.origin.x = 320;
     away_view.frame = frame;
   } 
   completion:^(BOOL finished){
   }];
}

@end
