//
//  SoundHelper.h
//  Mimicmize
//
//  Created by Vitor Navarro on 9/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface SoundHelper : NSObject

+(AVAudioPlayer *)play_single_wrong_buzz_with_delegate:(id<AVAudioPlayerDelegate>)delegate;
+(AVAudioPlayer *)play_single_wrong_buzz;

+(AVAudioPlayer *)play_sound_named:(NSString *)file_name with_delegate:(id<AVAudioPlayerDelegate>)delegate;
+(AVAudioPlayer *)play_sound_named:(NSString *)file_name;


@end
