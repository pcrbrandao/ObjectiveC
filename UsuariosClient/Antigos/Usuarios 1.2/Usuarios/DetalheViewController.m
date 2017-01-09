//
//  DetalheViewController.m
//  Usuarios
//
//  Created by Pedro Brandão on 19/04/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "DetalheViewController.h"

@interface DetalheViewController ()

@end

@implementation DetalheViewController

#pragma mark - Managing the detail item

- (void)setUsuario:(Usuario *)novoUsuario {
    if (_usuario != novoUsuario) {
        _usuario = novoUsuario;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.usuario) {
        self.labelDetalhe.text = [self.usuario nome];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
