//
//  LoadViewController.m
//  GitPopJava
//
//  Created by Pedro Brandão on 29/09/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "LoadViewController.h"
#import "Controller.h"

@interface LoadViewController ()

@property (nonatomic,retain) Controller *controller;

@end

@implementation LoadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _controller = [Controller sharedController];
    [_atividade startAnimating];
    [_controller loadRepositoriosNaPagina:1 comView:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
