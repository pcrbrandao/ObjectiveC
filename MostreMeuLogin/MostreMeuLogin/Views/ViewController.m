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
    
    // Esse parâmetro aciona o NSNotificationCenter quando ocorrer alguma mudança
    [FBSDKProfile enableUpdatesOnAccessTokenChange:YES];
    
    // iniciando objetos FBSDK
    self.loginButton = [[FBSDKLoginButton alloc] init];
    [self.loginButton setReadPermissions:@[@"email"]];
    self.foto = [[FBSDKProfilePictureView alloc] initWithFrame:CGRectMake(self.view.center.x, self.view.center.y, 280, 280)];
    
    // O FBSDKProfile.currentProfile deve ser carregado antes de utilizado.
    [FBSDKProfile loadCurrentProfileWithCompletion:^(FBSDKProfile *profile, NSError *error) {
        self.controller = [Controller sharedControllerWithProfile:profile andViewController:self];
        [self updateUI];
    }];
}

/// @brief implementa UIUpdateProtocol
- (void)updateUI {
    
    if (self.controller.userProfile) {
        self.nome.text = self.controller.userProfile.profile.name;
        self.emailLabel.text = self.controller.userProfile.email;
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
