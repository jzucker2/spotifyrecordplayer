//
//  JSZSpotifyAPI.m
//  SpotifyRecordPlayer
//
//  Created by Jordan Zucker on 3/29/15.
//  Copyright (c) 2015 Jordan Zucker. All rights reserved.
//

#import <Spotify/Spotify.h>
#import "Constants.h"
#import "JSZSpotifyAPI.h"

@interface JSZSpotifyAPI ()
@property (nonatomic, readwrite) SPTAudioStreamingController *player;
@end

@implementation JSZSpotifyAPI

+ (instancetype)sharedInstance {
    static JSZSpotifyAPI *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        // Set up shared authentication information
        SPTAuth *auth = [SPTAuth defaultInstance];
//        auth.clientID = @kClientId;
        auth.clientID = kSpotifyClientID;
        auth.requestedScopes = @[SPTAuthStreamingScope];
//        auth.redirectURL = [NSURL URLWithString:@kCallbackURL];
        auth.redirectURL = [NSURL URLWithString:kSpotifyCallbackURL];
#ifdef kTokenSwapServiceURL
        auth.tokenSwapURL = [NSURL URLWithString:@kTokenSwapServiceURL];
#endif
#ifdef kTokenRefreshServiceURL
        auth.tokenRefreshURL = [NSURL URLWithString:@kTokenRefreshServiceURL];
#endif
        auth.sessionUserDefaultsKey = @kSessionUserDefaultsKey;
    }
    return self;
}

- (void)dealloc {
    
}

#pragma mark - Callbacks

- (BOOL)handleAuthCallbackURL:(NSURL *)callbackURL {
    SPTAuth *auth = [SPTAuth defaultInstance];
    
    SPTAuthCallback authCallback = ^(NSError *error, SPTSession *session) {
        // This is the callback that'll be triggered when auth is completed (or fails).
        
        if (error != nil) {
            NSLog(@"*** Auth error: %@", error);
            return;
        }
        
        auth.session = session;
        [[NSNotificationCenter defaultCenter] postNotificationName:kSpotifySessionUpdated object:self];
    };
    
    /*
     Handle the callback from the authentication service. -[SPAuth -canHandleURL:]
     helps us filter out URLs that aren't authentication URLs (i.e., URLs you use elsewhere in your application).
     */
    
    if ([auth canHandleURL:callbackURL]) {
        [auth handleAuthCallbackWithTriggeredAuthURL:callbackURL callback:authCallback];
        return YES;
    }
    return NO;
}

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
