//
//  Constants.h
//  SpotifyRecordPlayer
//
//  Created by Jordan Zucker on 3/29/15.
//  Copyright (c) 2015 Jordan Zucker. All rights reserved.
//

#ifndef SpotifyRecordPlayer_Constants_h
#define SpotifyRecordPlayer_Constants_h

// Your client ID
//#define kClientId "67afda041ac24f599e8381b962a4ad7b"
static NSString * const kSpotifyClientID = @"67afda041ac24f599e8381b962a4ad7b";

// Your applications callback URL
//#define kCallbackURL "spotifyiossdkexample://"
static NSString * const kSpotifyCallbackURL = @"spotifyiossdkexample://";

// The URL to your token swap endpoint
// If you don't provide a token swap service url the login will use implicit grant tokens, which means that your user will need to sign in again every time the token expires.

// #define kTokenSwapServiceURL "http://localhost:1234/swap"

// The URL to your token refresh endpoint
// If you don't provide a token refresh service url, the user will need to sign in again every time their token expires.

// #define kTokenRefreshServiceURL "http://localhost:1234/refresh"


#define kSessionUserDefaultsKey "SpotifySession"

static NSString * const kSpotifySessionUpdated = @"JSZSpotifySessionUpdated";

#endif
