//
//  GitPopJavaTest.m
//  GitPopJava
//
//  Created by Pedro Brandão on 26/09/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OctoKit/OctoKit.h>

@interface GitPopJavaTest : XCTestCase

@end

@implementation GitPopJavaTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    OCTUser *user = [OCTUser userWithRawLogin:@"pcrbrandao" server:OCTServer.dotComServer];
    OCTClient *client = [OCTClient unauthenticatedClientWithUser:user];
    RACSignal *request = [client fetchUserRepositories];
    
    [request subscribeNext:^(OCTRepository *x) {
        NSLog(@"Repositorio..... %@", x.name);
        XCTAssertNotNil(x.name, @"nome não pode ser nil...");
    } error:^(NSError *error) {
        NSLog(@"Error.....%@", error.localizedDescription);
    } completed:^{
        NSLog(@"Completo......");
    }];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
