//
//  AudioEngineSynth.m
//  TestMacAVFoundationSynth01
//
//  Created by John Carlson on 5/21/17.
//  Copyright © 2017 John Carlson. All rights reserved.
//

#import "AudioEngineSynth.h"

@implementation AudioEngineSynth

@synthesize delegate;

- (AudioEngineSynth *) init
{
    self = [super init];
    //
    self->engine = [[AVAudioEngine alloc] init];
    //
    self->playerNode = [[AVAudioPlayerNode alloc] init];
    //self->buffer = [[AVAudioBuffer alloc] init];
    //
    //
    //
    self->audioChannelLayout = [[AVAudioChannelLayout alloc] initWithLayoutTag:kAudioChannelLayoutTag_Stereo];
    self->audioFormat = [[AVAudioFormat alloc] initWithCommonFormat:AVAudioPCMFormatFloat32
                                                         sampleRate:44100.0
                                                        interleaved:NO
                                                      channelLayout:self->audioChannelLayout];
    self->pcmBuffer = [[AVAudioPCMBuffer alloc] initWithPCMFormat: self->audioFormat frameCapacity:44100];
    self->pcmBuffer.frameLength = self->pcmBuffer.frameCapacity;
    //self->audioFrameCount = (AVAudioFrameCount*) 1;
    //
    self->audioTime = [self->audioTime initWithSampleTime:0 atRate:44100.0];
    //
    [self refillBuffer];
    //
    self->mixerNode = [[AVAudioMixerNode alloc] init];
    //
    self->delay = [[AVAudioUnitDelay alloc] init];
    self->reverb = [[AVAudioUnitReverb alloc] init];
    self->distortion = [[AVAudioUnitDistortion alloc] init];
    //
    self->outputNode = [AVAudioOutputNode alloc];
    //
    //
    [self->engine attachNode: self->playerNode];
    //
    self->mixerNode = self->engine.mainMixerNode;
    [self->engine connect: playerNode to: mixerNode format: [self->mixerNode outputFormatForBus:0]];
    //
    //
    [self->engine prepare];
    //
    //
    NSError *error;
    if(![self->engine startAndReturnError: &error])
    {
        // handle error
    }
    //
    //
    [self refillBuffer];
    //
    //
    return self;
}




-(void) refillBuffer
{
    // fill with note
    //int n = self->audioFormat.channelCount;
    for(double frame = 0; frame < self->pcmBuffer.frameLength; ++frame)
    {
        for (AVAudioChannelCount ch = 0; ch < self->audioFormat.channelCount; ++ch)
        {
            
            //float *const f = *(self->pcmBuffer.floatChannelData);
            //const AudioBufferList *list = self->pcmBuffer.audioBufferList;
            //self->pcmBuffer.floatChannelData[ch][(int)sample] = sin(440*2*M_PI*(sample/self->audioFormat.sampleRate));
            //int numBuffers = self->pcmBuffer.audioBufferList->mNumberBuffers;
            Float32 *data = self->pcmBuffer.audioBufferList->mBuffers[ch].mData;
            (data)[(int) frame] = sin(440*2*M_PI*(frame/self->audioFormat.sampleRate));
        }
    }
}




- (void) play
{
    [self->playerNode scheduleBuffer: self->pcmBuffer
        atTime: self->audioTime
        options: AVAudioPlayerNodeBufferLoops
        completionHandler: ^(void){
        //NSLog(@"completion handler");
        //[self refillBuffer];
        //NSLog(@"buffer refilled");
        //[self play];
        //[self->playerNode play];
    }];
    
    [self->playerNode prepareWithFrameCount: 1];

    [self->playerNode play];
}



- (void) stop
{
    [playerNode stop];
}

@end
