//
//  ViewControllerTest.m
//  MostreMeuLogin
//
//  Created by Pedro Brandão on 08/10/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"
#import <UIKit/UIKit.h>

@interface ViewControllerTest : XCTestCase

@property (nonatomic,retain)UIStoryboard *sb;
@property (nonatomic,retain) ViewController *loginVc;

@end

@implementation ViewControllerTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.sb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    self.loginVc = (ViewController *)[self.sb instantiateViewControllerWithIdentifier:@"Login"];
    
    [self.loginVc loadView];
    [self.loginVc viewDidLoad];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSeNaoHouverLoginNomeDeveSerMensagem {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    if (![FBSDKProfile currentProfile]) {
        NSLog(@"O nome é.......: %@", self.loginVc.nome.text);
        XCTAssert([self.loginVc.nome.text isEqualToString:@"No active user!"]);
    } else {
        XCTAssert([[FBSDKProfile currentProfile].name isEqualToString:self.loginVc.nome.text]);
    }
}

- (void)testSeNaoHouverLoginFotoProfileIdDeveSerNulo {
    
    if (![FBSDKProfile currentProfile]) {
        XCTAssertNil(self.loginVc.foto.profileID);
    } else {
        XCTAssert([self.loginVc.foto.profileID isEqualToString:[FBSDKProfile currentProfile].userID]);
    }
}

/*
- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
} */

@end
