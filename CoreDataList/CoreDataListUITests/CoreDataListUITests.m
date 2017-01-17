//
//  CoreDataListUITests.m
//  CoreDataListUITests
//
//  Created by Pedro Brandão on 06/01/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface CoreDataListUITests : XCTestCase

@end

@implementation CoreDataListUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDeveAdicionarUmRegistroNaTabela {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSString *nome = @"Pedro";
    NSString *senha = @"1234";
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    
    [app.textFields[@"nomeField"] typeText:nome];
    [app.textFields[@"senhaField"] tap];
    [app.textFields[@"senhaField"] typeText:senha];
    [app.buttons[@"actionButton"] tap];
    [app.textFields[@"nomeField"] tap];
    
    XCUIElement *cell = app.tables.cells.staticTexts[nome];
    NSString *nomeObtido = cell.label;
    
    XCTAssert([nomeObtido isEqualToString:nome]);
}

- (void)testDeveInserirTresRegistros {
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    
    NSArray *usuarios = @[
  @{ @"nome": @"user1", @"senha": @"1234" },
  @{ @"nome": @"user2", @"senha": @"2234" },
  @{ @"nome": @"user3", @"senha": @"3234" } ];
    
    for( NSDictionary *user in usuarios) {
        [app.textFields[@"nomeField"] tap];
        [app.textFields[@"nomeField"] typeText:user[@"nome"]];
        [app.textFields[@"senhaField"] tap];
        [app.textFields[@"senhaField"] typeText:user[@"senha"]];
        [app.buttons[@"actionButton"] tap];
    }
    
    NSInteger cellsCount = [app.tables.cells count];
    NSLog(@"\n\nQuantas linhas na tabela ? %d\n\n", cellsCount);

    XCTAssert(cellsCount == 3);
}

@end
