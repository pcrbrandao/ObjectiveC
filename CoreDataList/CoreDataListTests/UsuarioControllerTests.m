//
//  UsuarioControllerTests.m
//  CoreDataList
//
//  Created by Pedro Brandão on 09/01/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UsuarioController.h"
#import "Usuario.h"

@interface UsuarioControllerTests : XCTestCase

@property (nonatomic,retain)UsuarioController *controller;

@end

@implementation UsuarioControllerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.controller = [UsuarioController sharedInstance];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

/**
 * @brief Acrescenta um usuário. Se houver erro, falhou. Busca o usuário na lista. 
 * Se retornar compara o nome.
 */
- (void)testDeveAdicionarUmUsuario {
    NSError *err = [self addUsuarioJoao];
    
    if (err) {
        XCTAssert(NO);
    }
    NSInteger userID = [self.controller usuariosCount] - 1;
    Usuario *retorno = [self.controller usuarioID:userID];
    NSLog(@"\n....Retorno %@", [retorno nome]);
    [self.controller removeUsuarioID:userID];
    
    XCTAssert([retorno.nome isEqualToString:@"João"]);
}

/**
 * @brief Acrescenta um usuário e busca por ele.
 */
- (void)testDeveEncontrarOUsuarioJoao {
    
    NSError *err = [self addUsuarioJoao];
    if (err) {
        XCTAssert(NO);
    }
    
    Usuario *usuario = [self.controller usuarioNome:@"João"];
    if (usuario == nil) {
        XCTAssert(NO);
    }
    [self.controller removeUsuarioID:usuario.ID];
    XCTAssert(YES);
}

/**
 * @brief Acrescenta, atualiza, deleta e testa
 */
-(void)testDeveAtualizarUsuarioParaPedro {
    
    NSError *err = [self addUsuarioJoao];
    if (err) {
        XCTAssert(NO);
    }
    
    Usuario *usuarioAserAtualizado = [self.controller usuarioNome:@"João"];
    [usuarioAserAtualizado setNome:@"Pedro"];
    [self.controller updateUsuario:usuarioAserAtualizado];
    
    Usuario *usuarioAtualizado = [self.controller usuarioID:usuarioAserAtualizado.ID];
    XCTAssert([usuarioAtualizado.nome isEqualToString:@"Pedro"]);
}

/**
 * @brief Acrescentar usuário duplicado deve dar erro
 */
-(void)testUsuarioDuplicadoDeveDarErro {
    
    NSError *err = [self addUsuarioJoao];
    
    if (err) {
        XCTAssert(NO);
        return;
    }
    
    err = [self addUsuarioJoao];
    if (!err) {
        XCTAssert(NO);
        return;
    }
    
    XCTAssert(YES);
}

/**
 * @brief Acrescentar nome ou senha em branco deve dar erro
 */
-(void)testNomeOuSenhaEmBrancoDeveDarErro {
    
    NSError *err = [self.controller addUsuarioComNome:@"" eSenha:@""];
    
    if (!err) {
        XCTAssert(NO);
        return;
    }
    
    XCTAssert(YES);
}

-(void)testNomeOuSenhaMaiorQue16DeveDarErro {
    NSError *err = [self.controller addUsuarioComNome:@"12345678901234567" eSenha:@"1234"];
    err = [self.controller addUsuarioComNome:@"nome" eSenha:@"12345678901234567"];
    
    if (!err) {
        XCTAssert(NO);
        return;
    }
    
    XCTAssert(YES);
}


/**
 * @brief Um método auxiliar para acrescentar um usuário.
 */
- (NSError *)addUsuarioJoao {
    Usuario *joao = [Usuario NewUsuarioWithNome:@"João" andSenha:@"1234"];
    [joao setID:[self.controller usuariosCount]];
    
    NSError *err = [self.controller addUsuario:joao];
    if (err) {
        NSLog(@"Erro tentando adicionar.... %@", err.localizedDescription);
        return err;
    }
    return nil;
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
