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
    
    // O NotificaitonCenter deve ser configurado para que os objetos na view sejam
    // atualizados se ocorrerem muranças
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(_currentProfileChanged:)
                                                 name:FBSDKProfileDidChangeNotification
                                               object:nil];
    
    // O FBSDKProfile.currentProfile deve ser carregado antes de utilizado.
    [FBSDKProfile loadCurrentProfileWithCompletion:^(FBSDKProfile *profile, NSError *error) {
        self.controller = [Controller sharedControllerWithProfile:profile];
        [self _updateUIWithProfile:profile];
    }];
}

/**
 * @brief Será executado quando o NSNotificationCenter for comunicado de alguma alteração
 * @param notification Contém informações do método que fez a notificação
 */
- (void)_currentProfileChanged: (NSNotification *)notification {
    NSLog(@"O notification center disparou a notificação.......: %@", notification);
    
    [FBSDKProfile loadCurrentProfileWithCompletion:^(FBSDKProfile *profile, NSError *error) {
        [self _updateUIWithProfile:profile];
    }];
}

/**
 * @brief Atualiza os objetos da view com um profile
 * @param profile É o objeto que contém os dados
 */
- (void)_updateUIWithProfile: (FBSDKProfile *)profile {
    
    if (profile) {
        
        self.controller.userProfile = [[Profile alloc] initWithProfile:profile];
        self.nome.text = profile.name;
        
        NSDictionary *profileParam = @{@"fields": @"id,name,email"};
        
        if ([FBSDKAccessToken currentAccessToken]) {
            [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:profileParam]
             startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
                 if (!error) {
                     NSLog(@"fetched user:%@", result);
                     self.controller.userProfile.email = [(NSDictionary *)result valueForKey:@"email"];
                 } else {
                     self.controller.userProfile.email = @"email vazio";
                 }
                 self.emailLabel.text = [self.controller.userProfile email];
             }];
        } else {
            self.emailLabel.text = @"email vazio";
        }
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
