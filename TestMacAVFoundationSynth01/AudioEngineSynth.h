//
//  AudioEngineSynth.h
//  TestMacAVFoundationSynth01
//
//  Created by John Carlson on 5/21/17.
//  Copyright © 2017 John Carlson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
//#import <AVFoundation/AVAudioEngine.h>
//#import <AVFoundation/AVAudioNode.h>
//#import <AVFoundation/AVAudioBuffer.h>
//#import <AVFoundation/AVAudioMix.h>
#import <AudioToolbox/AudioToolbox.h>
#import <math.h>

@protocol AudioEngineSynthDelegate<NSObject>

//- (void) play;
//- (void) stop;

@end



@interface AudioEngineSynth : NSObject
{
    @protected AVAudioEngine *engine;
    //
    @public AVAudioPlayerNode *playerNode;
    //AVAudioBuffer *buffer;
    @protected AVAudioPCMBuffer *pcmBuffer;
    @protected AVAudioChannelLayout *audioChannelLayout;
    @protected AVAudioFormat *audioFormat;
    //@protected AVAudioFrameCount *audioFrameCount;
    AVAudioTime *audioTime;
    //
    @protected AVAudioMixerNode *mixerNode;
    //
    @protected AVAudioUnitDelay *delay;
    @protected AVAudioUnitReverb *reverb;
    @protected AVAudioUnitDistortion *distortion;
    //
    @protected AVAudioOutputNode *outputNode;
}

@property (nonatomic,strong) id <AudioEngineSynthDelegate> delegate;

@property (copy) void (^completionHandle)(void);

- (AudioEngineSynth *) init;

- (void) play;

- (void) stop;

@end
