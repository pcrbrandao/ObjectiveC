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
        
        CoreDataController *coreDataController = [CoreDataController sharedInstance];
        sharedInstance = [[UsuarioController alloc] init];
        sharedInstance.usuarios = [sharedInstance usuarioList];
        if (sharedInstance.usuarios == nil) {
            sharedInstance.usuarios = [[NSMutableArray alloc] init];
        }
        sharedInstance.managedObjectContext = [coreDataController managedObjectContext];
    }
    return sharedInstance;
}

#pragma mark Public Methods
/**
 * @brief Adiciona user
 */
//-(NSError *)addUser:(UserMO *)user {
    
//    return nil;
//}


/**
 * @brief Adiciona usuario com nome e senha
 */
-(NSError *)addUsuarioComNome:(NSString *)nome eSenha:(NSString *)senha {
    
    Usuario *usuario = [Usuario NewUsuarioWithNome:nome andSenha:senha inManagedContext:self.managedObjectContext];
    NSError *err = [self addUsuario:usuario];
    
    if (!err) {
        NSLog(@"\n\nTudo certo! usuário adicionado com sucesso!");
        return nil;
    }
    
    NSLog(@"\n\nOcorreu um erro.... %@", err.localizedDescription);
    return err;
}

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
    
    NSInteger nomel = [usuario.nome length];
    NSInteger senhal = [usuario.senha length];
    
    if (nomel <= 0 || senhal <= 0 ||
        nomel > 16 || senhal > 16) {
        return err;
    }
    
    Usuario *existente = [self usuarioNome:usuario.nome];
    if (existente) {
        return err;
    }
    
    if ([[self managedObjectContext] save:&err] == NO) {
        NSAssert(NO, @"Erro salvando contexto: %@\n%@", [err localizedDescription], [err userInfo]);
        return err;
    }
    
    [self.usuarios addObject:usuario];
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
-(NSMutableArray<Usuario *> *)usuarioList {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Usuario"];
    NSError *err = nil;
    
    NSArray *resultado = [self.managedObjectContext executeFetchRequest:fetchRequest error:&err];
    NSLog(@"\n\nTotal de itens em resultado....%d", [resultado count]);
    for (NSObject *item in resultado) {
        NSLog(@"\n\nitem recuperado...%@", item);
    }
    
    if (err) {
        NSLog(@"Erro tentando fetchRequest....%@", err.localizedDescription);
        return nil;
    }
    
    self.usuarios = (NSMutableArray<Usuario *> *)resultado;
    NSLog(@"\n\nTudo certo! usuários lidos do db sem problemas....%d", [self.usuarios count]);
    
    return (NSMutableArray<Usuario *> *)self.usuarios;
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
