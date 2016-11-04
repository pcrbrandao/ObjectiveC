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
-(instancetype)initWithProfile:(FBSDKProfile *)profile {
    self = [super init];
    if (self) {
        _userProfile = [[Profile alloc] initWithProfile:profile];
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

+(Controller *)sharedControllerWithProfile:(FBSDKProfile *)profile {
    
    if (!sharedController) {
        sharedController = [[Controller alloc] initWithProfile:profile];
    }
    return sharedController;
}

@end
