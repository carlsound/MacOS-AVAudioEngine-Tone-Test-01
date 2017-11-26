//
//  ViewController.m
//  TestMacAVFoundationSynth01
//
//  Created by John Carlson on 5/21/17.
//  Copyright © 2017 John Carlson. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    
    self->audioEngineSynth = [[AudioEngineSynth alloc]init];
    self->audioEngineSynth.delegate = self;
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)playButton:(NSButton *)sender {
    if(NSOnState == sender.state)
    {
        [self->audioEngineSynth play];
        self->playEnabled = TRUE;
    }
    else
    {
        [self->audioEngineSynth stop];
        self->playEnabled = FALSE;
    }
}

@end
