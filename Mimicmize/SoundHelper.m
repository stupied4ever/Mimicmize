//
//  SoundHelper.m
//  Mimicmize
//
//  Created by Vitor Navarro on 9/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SoundHelper.h"

@implementation SoundHelper

@synthesize sound_players = _sound_players;

static SoundHelper *_shared_instance;

+(SoundHelper *)sharedInstance{
  @synchronized(_shared_instance){
    if(!_shared_instance)
      _shared_instance = [[SoundHelper alloc]init];
  }
  return _shared_instance;
}


#pragma mark - AV Delegate
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
  
}

- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error{
  
}

#pragma mark - init
-(SoundHelper *)init{
  self = [super init];
  if(self){
    self.sound_players = [NSMutableDictionary dictionary];
  }
  return self;
}

#pragma mark - Player methods

-(AVAudioPlayer *)createPlayerWithAudio:(NSString *)audio_file andError:(NSError *)err{
  NSString *resourcePath = [[NSBundle mainBundle] pathForResource:audio_file ofType:@"mp3"];
  return [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:resourcePath] error:&err];
}

-(AVAudioPlayer *)retrievePlayer:(NSString *)audio_file{
  return [self.sound_players objectForKey:audio_file];
}

-(void)insertPlayer:(AVAudioPlayer *)player withAudio:(NSString *)audio_file{
  [self.sound_players setValue:player forKey:audio_file];
}

-(void)removePlayer:(NSString *)audio_file{
  [self.sound_players removeObjectForKey:audio_file];
}

-(void)removeAllPlayers{
  [self.sound_players removeAllObjects];
}

-(void)playSoundWithName:(NSString *)audio_file{
  AVAudioPlayer *sound_player = [self retrievePlayer:audio_file];
  NSError* err;
  if (!sound_player)
    sound_player = [self createPlayerWithAudio:audio_file andError:err];
  
  if( !err ){
    [self insertPlayer:sound_player withAudio:audio_file];    
    sound_player.delegate = self;
    [sound_player setVolume: 1.0];
    [sound_player play];
  }
  else
    NSLog(@"Failed with reason: %@", [err localizedDescription]);
}

-(void)playWrongBuzz{
  [self playSoundWithName:@"beep5"];
}


@end
