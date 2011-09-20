//
//  SoundHelper.h
//  Mimicmize
//
//  Created by Vitor Navarro on 9/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface SoundHelper : NSObject <AVAudioPlayerDelegate>

@property (nonatomic,strong) NSMutableDictionary *sound_players;

+(SoundHelper *)sharedInstance;
-(void)removePlayer:(NSString *)audio_file;
-(void)removeAllPlayers;
-(void)playWrongBuzz;
-(void)playSoundWithName:(NSString *)audio_file;
-(void)stopSoundWithName:(NSString *)audio_file;
-(void)stopAll;

@end
