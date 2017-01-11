//
//  Usuario.h
//  CoreDataList
//
//  Created by Pedro Brandão on 06/01/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Usuario : NSObject

@property (nonatomic,assign)NSInteger ID;
@property (nonatomic,retain)NSString *nome;
@property (nonatomic,retain)NSString *senha;

+(Usuario *)NewUsuarioWithNome:(NSString *)nome andSenha:(NSString *)senha;

@end