//
//  Usuario.m
//  CoreDataList
//
//  Created by Pedro Brandão on 06/01/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import "Usuario.h"
#import "CoreDataController.h"

@implementation Usuario

@synthesize ID;
@synthesize nome;
@synthesize senha;

+(Usuario *)NewUsuarioWithNome:(NSString *)nome andSenha:(NSString *)senha {
    
    // Usuario *usuario = [[Usuario alloc] init];
    CoreDataController *dataController = [CoreDataController sharedInstance];
    NSManagedObjectContext *context = [dataController managedObjectContext];
    
    Usuario *usuario = (Usuario *)[NSEntityDescription insertNewObjectForEntityForName:@"Usuario" inManagedObjectContext:context];
    
    [usuario setNome:nome];
    [usuario setSenha:senha];
    
    return usuario;
}

@end
