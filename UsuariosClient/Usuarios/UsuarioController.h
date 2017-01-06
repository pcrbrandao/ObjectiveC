//
//  UsuarioController.h
//  Usuarios
//
//  Created by Pedro Brandão on 19/03/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Usuario.h"
#import "AFNetManager.h"
#import "Usuario.h"
#import "BlocoNetManager.h"
#import "Controller.h"

@interface UsuarioController : NSObject

@property (nonatomic, retain)Controller *controller;

-(void)setUsuariosComBloco:(BlocoNetManager *)bloco sender:(id)sender naView:(UIViewController *)view;

-(void)setUsuarioComNome:(NSString *)nome sender:(id)sender comBlocoNetManager:(BlocoNetManager *)bloco naView:(UIViewController *)view;

-(void)controller:(Controller *)comando comUsuario:(Usuario *)usuario comBloco:(BlocoNetManager *)bloco comSender:(id)sender naView:(UIViewController *)view;

@end
