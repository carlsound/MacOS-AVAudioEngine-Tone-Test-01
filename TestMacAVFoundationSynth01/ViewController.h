//
//  ViewController.h
//  TestMacAVFoundationSynth01
//
//  Created by John Carlson on 5/21/17.
//  Copyright © 2017 John Carlson. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "AudioEngineSynth.h"

@interface ViewController : NSViewController<AudioEngineSynthDelegate, AVAudioPlayerDelegate>
{
    AudioEngineSynth *audioEngineSynth;
    BOOL playEnabled;
}

@end
