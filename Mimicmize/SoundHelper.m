//
//  SoundHelper.m
//  Mimicmize
//
//  Created by Vitor Navarro on 9/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SoundHelper.h"

@implementation SoundHelper

+(AVAudioPlayer *)play_single_wrong_buzz_with_delegate:(id<AVAudioPlayerDelegate>)delegate{
  AVAudioPlayer *sound_player = nil;

  NSString* resourcePath = [[NSBundle mainBundle] resourcePath];
  resourcePath = [resourcePath stringByAppendingString:@"filepath/filename.extension"];
  NSLog(@"Path to play: %@", resourcePath);
  NSError* err;

  sound_player = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:resourcePath] error:&err];

  if( !err ){
    sound_player.delegate = delegate;
    [sound_player play];
  }
  else
    NSLog(@"Failed with reason: %@", [err localizedDescription]);
  
  return sound_player;
}

+(AVAudioPlayer *)play_single_wrong_buzz{
 return [SoundHelper play_single_wrong_buzz_with_delegate:nil];
}

+(AVAudioPlayer *)play_sound_from_path:(NSString *)path with_delegate:(id<AVAudioPlayerDelegate>)delegate{
  AVAudioPlayer *sound_player = nil;
  
  NSString* resourcePath = [[NSBundle mainBundle] resourcePath];
  resourcePath = [resourcePath stringByAppendingString:path];
  NSLog(@"Path to play: %@", resourcePath);
  NSError* err;
  
  sound_player = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:resourcePath] error:&err];
  
  if( !err ){
    sound_player.delegate = delegate;
    [sound_player play];
  }
  else
    NSLog(@"Failed with reason: %@", [err localizedDescription]);
  
  return sound_player;
}

+(AVAudioPlayer *)play_sound_from_path:(NSString *)path{
  return [SoundHelper play_sound_from_path:path with_delegate:nil];
}

@end
