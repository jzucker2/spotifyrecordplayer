//
//  JSZSpotifyPlayer.m
//  SpotifyRecordPlayer
//
//  Created by Jordan Zucker on 3/29/15.
//  Copyright (c) 2015 Jordan Zucker. All rights reserved.
//

#import <Spotify/Spotify.h>

#import "JSZSpotifyPlayer.h"

@interface JSZSpotifyPlayer ()
@property (nonatomic, readwrite) SPTAudioStreamingController *player;
@end

@implementation JSZSpotifyPlayer

#pragma mark - SPTAudioStreamingController

- (SPTAudioStreamingController *)player {
    SPTAuth *auth = [SPTAuth defaultInstance];
    
    if (_player == nil) {
        _player = [[SPTAudioStreamingController alloc] initWithClientId:auth.clientID];
        //        _player.playbackDelegate = self;
        _player.diskCache = [[SPTDiskCache alloc] initWithCapacity:1024 * 1024 * 64];
    }
    return _player;
}

@end
