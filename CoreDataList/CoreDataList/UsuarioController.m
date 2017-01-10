//
//  UsuarioController.m
//  CoreDataList
//
//  Created by Pedro Brandão on 07/01/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import "UsuarioController.h"
<<<<<<< HEAD
#import "Textos.h"

#pragma mark Privates

@interface UsuarioController()
/**
 * @brief Provisioramente os dados serão armazenados nesse array.
 */
@property (nonatomic,retain) NSMutableArray<Usuario *> *usuarios;
@end
=======
>>>>>>> 29b2eca9e61cbae0af14f3473fa8dceb14329c64

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
<<<<<<< HEAD
        sharedInstance.usuarios = [[NSMutableArray alloc] init];
=======
>>>>>>> 29b2eca9e61cbae0af14f3473fa8dceb14329c64
    }
    return sharedInstance;
}

<<<<<<< HEAD
/**
 * @brief Retorna um erro caso o usuário não seja válido ou nil se estiver ok
 */
-(NSError *)addUsuario:(Usuario *)usuario {
    
    // O detalhe do erro
    NSDictionary *details = @{NSLocalizedDescriptionKey:mINVALID_USER};
    NSError *err = [NSError errorWithDomain:kUSUARIO_CONTROLLER code:-1 userInfo:details];
    
    if (!usuario) {
        return err;
    }
    
    [self.usuarios addObject:usuario];
    NSLog(@"\nUsuário acrescentado com sucesso! %@", [usuario nome]);
    NSLog(@"\nUsuarios na lista: %d", [self.usuarios count]);
    
    return nil;
}

/**
 * @brief A quantidade de usuarios é a de usuários em memória
 * e não a de usuários cadastrados, que podem não ser carregados
 * todos por motivo de limites de memória
 */
-(NSInteger)usuariosCount {
    return self.usuarios.count;
}

/**
 * @brief Antes de excluir o método verifica se o ID é válido
 * e retorna o erro, caso não seja, ou nil se tudo der certo
 */
-(NSError *)removeUsuarioComID:(NSInteger)ID {
    
    // O detalhe do erro
    NSDictionary *details = @{NSLocalizedDescriptionKey:mINVALID_ID};
    NSError *err = [NSError errorWithDomain:kUSUARIO_CONTROLLER code:-1 userInfo:details];
    
    if (self.usuarios.count == 0) {
        details = @{NSLocalizedDescriptionKey:mLISTA_VAZIA};
        return err;
    }
    
    if (![self isValidID:ID]) {
        return err;
    }
    
    [self.usuarios removeObjectAtIndex:ID];
    
    return nil;
}

-(Usuario *)usuarioComID:(NSInteger)ID {
    if (![self isValidID:ID]) {
        return nil;
    }
    return self.usuarios[ID];
}

-(BOOL)isValidID:(NSInteger)ID {
    
    if (ID < 0 || ID > self.usuarios.count - 1) {
        return NO;
    }
    
    return YES;
}

=======
-(NSError *)addUsuario:(Usuario *)usuario {
    
    return nil;
}

>>>>>>> 29b2eca9e61cbae0af14f3473fa8dceb14329c64
@end
