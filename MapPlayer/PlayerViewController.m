//
//  PlayerViewController.m
//  MapPlayer
//
//  Created by Saulo Arruda Coelho on 7/28/12.
//  Copyright (c) 2012 Jera. All rights reserved.
//

#import "PlayerViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface PlayerViewController ()
{
    AVPlayer* _player;
}

@property (weak, nonatomic) IBOutlet UIBarButtonItem *playButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *pauseButton;
- (IBAction)buttonTapped:(id)sender;


@end

@implementation PlayerViewController
@synthesize playButton;
@synthesize pauseButton;

- (void)viewDidLoad
{
    _player = [AVPlayer playerWithURL:[NSURL URLWithString:@"http://pri.kts-af.net/redir/index.pls?esid=9ec9c1f8af846efbe1da27440c13eb24&url_no=1&client_id=7&uid=68efed4d03ec7e45fd3978262c107180&clicksrc=xml"]];
}

- (void)viewDidUnload {
    [self setPlayButton:nil];
    [self setPauseButton:nil];
    [super viewDidUnload];
}

- (IBAction)buttonTapped:(id)sender {
    if (sender == self.playButton) {
        [_player play];
        [self.playButton setEnabled:NO];
        [self.pauseButton setEnabled:YES];
    } else {
        [_player pause];
        [self.playButton setEnabled:YES];
        [self.pauseButton setEnabled:NO];        
    }
}
@end
