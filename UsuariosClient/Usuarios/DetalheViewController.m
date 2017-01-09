//
//  DetalheViewController.m
//  Usuarios
//
//  Created by Pedro Brandão on 19/04/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "DetalheViewController.h"
#import "AtualizarViewController.h"

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
        self.labelDetalhe.text = [_usuario nome];
        
        NSDateFormatter *dFormat = [[NSDateFormatter alloc] init];
        [dFormat setDateFormat:@"dd-MM-yyyy"];
        
        NSDate *dataUsuario = _usuario.dataAtualizacao;
        self.labelModificado.text = [dFormat stringFromDate:dataUsuario];
        [self.labelModificado setHidden:NO];
    } else {
        [self.labelModificado setHidden:YES];
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

- (IBAction)editarItem:(id)sender {
    [self performSegueWithIdentifier:@"segueEditar" sender:sender];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    AtualizarViewController *editarViewController =
    segue.destinationViewController;
    
    [editarViewController setUsuario:self.usuario];
}
@end
