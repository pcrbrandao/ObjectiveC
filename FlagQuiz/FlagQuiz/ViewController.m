//
//  ViewController.m
//  FlagQuiz
//
//  Created by Pedro Brandão on 23/08/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import "ViewController.h"
#import <pop/POP.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)tap:(id)sender {
    
    POPSpringAnimation *shake = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerRotation];
    
    shake.fromValue = @(M_PI / 10);
    shake.toValue = @(0);
    shake.springBounciness = 20;
    shake.velocity = @(10);
    
    [self.bandeira.layer pop_addAnimation:shake forKey:@"shake"];
}
@end
