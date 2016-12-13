//
//  Controller.m
//  MostreMeuLogin
//
//  Created by Pedro Brandão on 04/11/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "Controller.h"

@implementation Controller

/**
 * @brief Inicializa uma instância de Controller
 * @param profile É um FBSDKProfile
 * @return Uma instância do tipo Controller
 */
-(instancetype)initWithProfile:(FBSDKProfile *)profile andViewController:(UIViewController<UIUpdateProtocol> *)viewController {
    
    self = [super init];
    if (self) {
        _userProfile = [[Profile alloc] initWithProfile:profile];
        _currentViewController = viewController;
        [self loadProfileEmail];
        // O NotificaitonCenter deve ser configurado para que os objetos na view sejam
        // atualizados se ocorrerem muranças
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(currentProfileChanged:)
                                                     name:FBSDKProfileDidChangeNotification
                                                   object:nil];
    }
    return self;
}

/// Verifica se userProfile é nulo e cria uma instância se verdadeiro
-(Profile *)userProfile {
    if (!_userProfile) {
        _userProfile = [[Profile alloc] init];
    }
    return _userProfile;
}

/// @brief Necessário para o singleton
static Controller *sharedController = nil;

+(Controller *)sharedControllerWithProfile:(FBSDKProfile *)profile andViewController:(UIViewController<UIUpdateProtocol> *)viewController {
    
    if (!sharedController) {
        sharedController = [[Controller alloc] initWithProfile:profile andViewController:viewController];
    }
    return sharedController;
}

/**
 * @brief Será executado quando o NSNotificationCenter for comunicado de alguma alteração
 * @param notification Contém informações do método que fez a notificação
 */
- (void)currentProfileChanged: (NSNotification *)notification {
    NSLog(@"O notification center disparou a notificação.......: %@", notification);
    
    [FBSDKProfile loadCurrentProfileWithCompletion:^(FBSDKProfile *profile, NSError *error) {
        [self.userProfile setProfile:profile];
        [self loadProfileEmail];
    }];
}

-(void)loadProfileEmail {
    
    NSDictionary *profileParam = @{@"fields": @"id,name,email"};
    
    if ([FBSDKAccessToken currentAccessToken]) {
        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:profileParam]
         startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
             if (!error) {
                 NSLog(@"fetched user:%@", result);
                 self.userProfile.email = [(NSDictionary *)result valueForKey:@"email"];
                 [self.currentViewController updateUI];
             }
         }];
    }
}

@end
