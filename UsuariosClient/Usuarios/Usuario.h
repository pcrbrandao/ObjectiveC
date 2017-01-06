//
//  Usuario.h
//  Usuarios
//
//  Created by Pedro Brandão on 19/03/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface Usuario : JSONModel

@property (nonatomic, assign) long ID;
@property (nonatomic, retain) NSString *nome;
@property (nonatomic, retain) NSString *senha;
@property (nonatomic, retain) NSDate *dataAtualizacao;

-(id)initComNome:(NSString *)n senha:(NSString *)s;
-(id)initComId:(long)i nome:(NSString *)n senha:(NSString *)senha;

@end
