//
//  Controller.h
//  MostreMeuLogin
//
//  Created by Pedro Brandão on 04/11/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import "Profile.h"
#import "UIUpdateProtocol.h"

/// @discussion Contém propriedades e métodos que obtém e fornecem informações para as view
@interface Controller : NSObject

/// @brief Pode ser que seja preciso usar em várias Views
@property (nonatomic,retain)Profile *userProfile;

/// @brief Contém os amigos cadastrados no FBSDK
@property (nonatomic,retain)NSMutableArray *amigos;

@property (nonatomic,retain)UIViewController<UIUpdateProtocol> *currentViewController;

/**
 * @brief Cria uma instância única do controller
 * @param profile Obtido via FBSDKProfile
 * @return sharedController: A instância do controller
 */
+(Controller *)sharedControllerWithProfile:(FBSDKProfile *)profile andViewController:(UIViewController<UIUpdateProtocol> *)viewController;

@end
