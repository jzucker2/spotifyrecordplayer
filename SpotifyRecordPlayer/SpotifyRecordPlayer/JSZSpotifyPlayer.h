//
//  JSZSpotifyPlayer.h
//  SpotifyRecordPlayer
//
//  Created by Jordan Zucker on 3/29/15.
//  Copyright (c) 2015 Jordan Zucker. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SPTAudioStreamingController;

//@protocol JSZSpotifyPlayerDelegate;

@interface JSZSpotifyPlayer : NSObject

@property (nonatomic, readonly) SPTAudioStreamingController *player;

@end

//@protocol JSZSpotifyPlayerDelegate <NSObject>
//
//
//
//@end
