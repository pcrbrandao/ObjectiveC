//
//  ViewController.m
//  MostreMeuLogin
//
//  Created by Pedro Brandão on 02/10/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [FBSDKProfile enableUpdatesOnAccessTokenChange:YES];
    self.profileParam = @{@"fields": @"id,name,email"};
    
    // Facebook button
    self.loginButton = [[FBSDKLoginButton alloc] init];
    self.foto = [[FBSDKProfilePictureView alloc] initWithFrame:CGRectMake(self.view.center.x, self.view.center.y, 280, 280)];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(_currentProfileChanged:)
                                                 name:FBSDKProfileDidChangeNotification
                                               object:nil];
    
    [FBSDKProfile loadCurrentProfileWithCompletion:^(FBSDKProfile *profile, NSError *error) {
        [self _updateProfile:(Profile *)profile];
    }];
}

- (void)_currentProfileChanged: (NSNotification *)notification {
    NSLog(@"O notification center disparou a notificação.......: %@", notification);
    
    [FBSDKProfile loadCurrentProfileWithCompletion:^(FBSDKProfile *profile, NSError *error) {
        [self _updateProfile:(Profile *)profile];
    }];
}

- (void)_updateProfile: (Profile *)profile {
    
    if (profile) {
        self.nome.text = profile.name;
        self.emailLabel.text = profile.email;
    } else {
        self.nome.text = @"No active user!";
        self.emailLabel.text = @"No email";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
