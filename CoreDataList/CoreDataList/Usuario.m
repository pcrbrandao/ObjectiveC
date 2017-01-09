//
//  Usuario.m
//  CoreDataList
//
//  Created by Pedro Brandão on 06/01/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import "Usuario.h"

@implementation Usuario

+(Usuario *)NewUsuarioWithNome:(NSString *)nome andSenha:(NSString *)senha {
    
    Usuario *usuario = [[Usuario alloc] init];
    [usuario setNome:nome];
    [usuario setSenha:senha];
    
    return usuario;
}

@end
