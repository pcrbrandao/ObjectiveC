//
//  UsuariosViewController.m
//  Usuarios
//
//  Created by Pedro Brandão on 13/04/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "UsuariosViewController.h"
#import "DetalheViewController.h"
#import "SegueView.h"
#import "ExcluirUsuarioController.h"
#import "ExcluirUsuarioBloco.h"

@interface UsuariosViewController ()

@end

@implementation UsuariosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.controller = [[UsuarioController alloc] init];
    self.detalheViewController = (DetalheViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    self.usuarios = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma - Tabela

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // #warning Incomplete implementation, return the number of rows
    return _usuarios.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CelulaUsuarioCacheId = @"CelulaUsuarioCacheId";
    
    UITableViewCell *cell = [self.tableViewUsuarios dequeueReusableCellWithIdentifier:CelulaUsuarioCacheId];
    
    // Configure the cell...
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CelulaUsuarioCacheId];
    }
    
    self.usuario = [_usuarios objectAtIndex:indexPath.row];
    cell.textLabel.text = self.usuario.nome;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"segueDetalhe" sender:tableView];
}

#pragma - Outros métodos

// Sobrescevendo para outra viewController
-(void)prepareForSegue:(UIStoryboardSegue<SegueViewProtocol> *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"segueDetalhe"]) {
        [segue executar:segue sender:sender viewController:self];
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Usuario *usuarioSelecionado = [[Usuario alloc] init];
        [usuarioSelecionado setNome:[_usuarios[indexPath.row] nome]];
        [usuarioSelecionado setID:[_usuarios[indexPath.row] ID]];
        
        [self.controller controller:[[ExcluirUsuarioController alloc] init]
                            comUsuario:usuarioSelecionado
                              comBloco:[[ExcluirUsuarioBloco alloc] init]
                             comSender:indexPath
                                naView:self];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

- (IBAction)irParaInicio:(id)sender {
}
@end
