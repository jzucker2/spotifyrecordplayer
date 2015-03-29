//
//  JSZSpotifyAPI.h
//  SpotifyRecordPlayer
//
//  Created by Jordan Zucker on 3/29/15.
//  Copyright (c) 2015 Jordan Zucker. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SPTAudioStreamingController;

@interface JSZSpotifyAPI : NSObject

+ (instancetype)sharedInstance;

- (BOOL)handleAuthCallbackURL:(NSURL *)callbackURL;

- (void)renewToken;

//@property (nonatomic, readonly) SPTAudioStreamingController *player;

@end
