//
//  Usuario.m
//  Usuarios
//
//  Created by Pedro Brandão on 19/03/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "Usuario.h"

@implementation Usuario

-(id)initComNome:(NSString *)n senha:(NSString *)s {
    
    if ((self = [super init])) {
        _senha = s;
        _nome = n;
    }
    
    return self;
}

-(id)initComId:(long)i nome:(NSString *)n senha:(NSString *)s {
    
    if ((self = [super init])) {
        _iD = i;
        _nome = n;
        _senha = s;
    }
    return self;
}

@end
