//
//  UsuarioController.m
//  CoreDataList
//
//  Created by Pedro Brandão on 07/01/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import "UsuarioController.h"

/**
 * @brief A variável estática é para o controle da instância.
 */
static UsuarioController *sharedInstance = nil;

@implementation UsuarioController

/**
 * @brief Retorna o singleton (instância única)
 */
+(UsuarioController *)sharedInstance {
    if (!sharedInstance) {
        sharedInstance = [[UsuarioController alloc] init];
    }
    return sharedInstance;
}

-(NSError *)addUsuario:(Usuario *)usuario {
    
    return nil;
}

@end
