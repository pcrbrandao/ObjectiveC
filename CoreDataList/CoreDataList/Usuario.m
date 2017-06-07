//
//  Usuario.m
//  CoreDataList
//
//  Created by Pedro Brandão on 06/01/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import "Usuario.h"

@implementation Usuario

@synthesize ID;
@synthesize nome;
@synthesize senha;

+(Usuario *)NewUsuarioWithNome:(NSString *)nome andSenha:(NSString *)senha inManagedContext:(NSManagedObjectContext *)context {
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Usuario" inManagedObjectContext:context];
    Usuario *usuario = (Usuario *)[[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:context];
    
    [usuario setNome:nome];
    [usuario setSenha:senha];
    
    return usuario;
}

@end
