//
//  UsuarioController.m
//  CoreDataList
//
//  Created by Pedro Brandão on 07/01/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import "UsuarioController.h"
#import "Textos.h"

#pragma mark Private Properties

@interface UsuarioController()
/**
 * @brief Provisioramente os dados serão armazenados nesse array.
 */
@property (nonatomic,retain) NSMutableArray<Usuario *> *usuarios;
@end

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
        sharedInstance.usuarios = [[NSMutableArray alloc] init];
    }
    return sharedInstance;
}

#pragma mark Public Methods
/**
 * @brief Retorna um erro caso o usuário não seja válido ou nil se estiver ok.
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
 * @brief Antes de excluir o método verifica se o ID é válido
 * e retorna o erro, caso não seja, ou nil se tudo der certo
 */
-(NSError *)removeUsuarioID:(NSInteger)ID {
    
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

/**
 * @brief Atualiza um usuário, se existir.
 */
-(NSError *)updateUsuario:(Usuario *)usuario {
    // Detalhe do erro
    NSDictionary *details = @{NSLocalizedDescriptionKey:mINVALID_ID};
    NSError *err = [NSError errorWithDomain:kUSUARIO_CONTROLLER code:-1 userInfo:details];
    
    if (self.usuarios.count == 0) {
        details = @{NSLocalizedDescriptionKey:mLISTA_VAZIA};
        return err;
    }
    
    if (!usuario) {
        return err;
    }
    
    if (![self isValidID:usuario.ID]) {
        return err;
    }
    
    self.usuarios[usuario.ID] = usuario;
    
    return nil;
}

/**
 * @brief Se o ID existe retorna o usuário correspondente
 */
-(Usuario *)usuarioID:(NSInteger)ID {
    if (![self isValidID:ID]) {
        return nil;
    }
    return self.usuarios[ID];
}

/**
 * @brief Aqui eu uso o NSPredicate para encontrar o nome no array. Se existe retorna, se não retorna nil.
 */
-(Usuario *)usuarioNome:(NSString *)nome {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"nome == %@", nome];
    NSArray *usuarioArray = [self.usuarios filteredArrayUsingPredicate:predicate];
    if (usuarioArray.count > 0) {
        return [usuarioArray firstObject];
    }
    return nil;
}

/**
 * @brief Obtém a lista de usuários.
 */
-(NSArray<Usuario *> *)usuarioList {
    return (NSArray<Usuario *> *)self.usuarios;
}

/**
 * @brief A quantidade de usuarios é a de usuários em memória
 * e não a de usuários cadastrados, que podem não ser carregados
 * todos por motivo de limites de memória
 */
-(NSInteger)usuariosCount {
    return self.usuarios.count;
}

#pragma mark Private Methods

/**
 * @brief Testa se o ID é válido
 */
-(BOOL)isValidID:(NSInteger)ID {
    
    if (ID < 0 || ID > self.usuarios.count - 1) {
        return NO;
    }
    
    return YES;
}

@end
