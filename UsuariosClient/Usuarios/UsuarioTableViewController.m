//
//  UsuarioTableViewController.m
//  Usuarios
//
//  Created by Pedro Brandão on 26/04/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "UsuarioTableViewController.h"
#import "UsuariosBloco.h"
#import "SegueView.h"
#import "ExcluirUsuarioController.h"
#import "ExcluirUsuarioBloco.h"

@interface UsuarioTableViewController ()

@end

@implementation UsuarioTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];    
    
    self.detalheViewController = (DetalheViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
}

- (void)viewDidAppear:(BOOL)animated {
    
    self.usuarioController = [[UsuarioController alloc] init];
    [self.usuarioController setUsuariosComBloco:[[UsuariosBloco alloc] init] sender:self naView:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.usuarios.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CelulaUsuarioCacheId = @"CelulaUsuarioCacheId";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CelulaUsuarioCacheId];
    
    // Configure the cell...
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CelulaUsuarioCacheId];
    }
    
    self.usuario = [self.usuarios objectAtIndex:indexPath.row];
    cell.textLabel.text = self.usuario.nome;
    
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Usuario *usuarioSelecionado = [[Usuario alloc] init];
        [usuarioSelecionado setNome:[self.usuarios[indexPath.row] nome]];
        [usuarioSelecionado setID:[self.usuarios[indexPath.row] ID]];
        
        [_usuarioController controller:[[ExcluirUsuarioController alloc] init]
                            comUsuario:usuarioSelecionado
                              comBloco:[[ExcluirUsuarioBloco alloc] init]
                             comSender:indexPath
                                naView:self];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

-(void)prepareForSegue:(UIStoryboardSegue<SegueViewProtocol> *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"segueDetalhe"]) {
        [segue executar:segue sender:sender viewController:self];
    }
}

@end
