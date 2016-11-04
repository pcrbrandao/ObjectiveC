//
//  ViewController.h
//  MostreMeuLogin
//
//  Created by Pedro Brandão on 02/10/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import "Controller.h"

/**
 * @discussion Representa a vista principal, com o butão de login, nome, email
 */
@interface ViewController : UIViewController

// O FBSDKLoginButton faz o login automático, verifica se há um usuário logado e se
// configura conforme o estado. Porém não atualiza o FBSDKProfile.currentProfile
// automaticamente.
@property (strong, nonatomic) IBOutlet FBSDKLoginButton *loginButton;

// A FBSDKProfilePictureView atualiza-se automáticamente com o ID do
// FBProfile.currentProfile que é atribuído pelo FBSDKLoginButton
@property (strong, nonatomic) IBOutlet FBSDKProfilePictureView *foto;

@property (weak, nonatomic) IBOutlet UILabel *nome;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;

// Contém os dados do profile
// O método loadCurrentProfileWithCompletion do FBSDKProfile deve ser executado
// para atualizar os dados
@property (nonatomic,retain)Controller *controller;

@end

