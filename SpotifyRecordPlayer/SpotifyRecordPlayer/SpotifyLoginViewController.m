//
//  SpotifyLoginViewController.m
//  SpotifyRecordPlayer
//
//  Created by Jordan Zucker on 3/29/15.
//  Copyright (c) 2015 Jordan Zucker. All rights reserved.
//

#import <CocoaLumberjack/CocoaLumberjack.h>
#import <Spotify/Spotify.h>
#import "SpotifyLoginViewController.h"
#import "JSZSpotifyAPI.h"

@interface SpotifyLoginViewController () <
                                            SPTAuthViewDelegate
                                        >
@property (nonatomic) SPTConnectButton *spotifyConnectButton;
@end

@implementation SpotifyLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.spotifyConnectButton = [[SPTConnectButton alloc] init];
    [self.spotifyConnectButton addTarget:self action:@selector(spotifyButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.spotifyConnectButton];
    
    [self.view setNeedsLayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.spotifyConnectButton.frame = CGRectMake(50, 50, 150, 50);
}

#pragma mark - Actions

- (void)spotifyButtonTapped:(id)sender {
    SPTAuthViewController *authViewController = [[JSZSpotifyAPI sharedInstance] authViewController];
    authViewController.delegate = self;
    [self presentViewController:authViewController animated:YES completion:nil];
}

#pragma mark - SPTAuthViewDelegate

- (void) authenticationViewController:(SPTAuthViewController *)authenticationViewController didLoginWithSession:(SPTSession *)session {
    DDLogVerbose(@"authenticationViewController: %@ didLoginWithSession: %@", authenticationViewController, session);
}

- (void) authenticationViewController:(SPTAuthViewController *)authenticationViewController didFailToLogin:(NSError *)error {
    DDLogError(@"authenticationViewController: %@ didFailToLogin: %@", authenticationViewController, error);
}

- (void) authenticationViewControllerDidCancelLogin:(SPTAuthViewController *)authenticationViewController {
    DDLogWarn(@"authenticationViewControllerDidCancelLogin: %@", authenticationViewController);
}

@end
