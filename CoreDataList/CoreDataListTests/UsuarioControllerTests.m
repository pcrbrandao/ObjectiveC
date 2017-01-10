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

- (void)testDeveAdicionarUmUsuario {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    Usuario *joao = [Usuario NewUsuarioWithNome:@"João" andSenha:@"1234"];
    [joao setID:[self.controller usuariosCount]];
    
    NSError *err = [self.controller addUsuario:joao];
    
    if (err) {
        XCTAssert(NO);
    }
    
    Usuario *retorno = [self.controller.usuarios firstObject];
    NSLog(@"\n....Retorno %@", [retorno nome]);
    [self.controller removeUsuarioComID:joao.ID];
    
    XCTAssert([retorno.nome isEqualToString:joao.nome]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
