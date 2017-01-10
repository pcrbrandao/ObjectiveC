//
//  UsuarioTableViewController.m
//  Usuarios
//
//  Created by Pedro Brandão on 26/04/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "UsuarioTableViewController.h"
#import "SegueView.h"
#import "ExcluirUsuarioController.h"
#import "ExcluirUsuarioBloco.h"

@interface UsuarioTableViewController ()

@end

@implementation UsuarioTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    _usuarioController = [[UsuarioController alloc] init];
    self.detalheViewController = (DetalheViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
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
    return _usuarios.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CelulaUsuarioCacheId = @"CelulaUsuarioCacheId";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CelulaUsuarioCacheId];
    
    // Configure the cell...
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CelulaUsuarioCacheId];
    }
    
    _usuario = [_usuarios objectAtIndex:indexPath.row];
    cell.textLabel.text = _usuario.nome;
    
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
        [usuarioSelecionado setNome:[_usuarios[indexPath.row] nome]];
        [usuarioSelecionado setID:[_usuarios[indexPath.row] iD]];
        
        [_usuarioController controller:[[ExcluirUsuarioController alloc] init]
                            comUsuario:usuarioSelecionado
                              comBloco:[[ExcluirUsuarioBloco alloc] init]
                             comSender:indexPath
                                naView:self];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [self performSegueWithIdentifier:@"segueDetalhe" sender:tableView];
//}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

-(void)prepareForSegue:(UIStoryboardSegue<SegueViewProtocol> *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"segueDetalhe"]) {
        [segue executar:segue sender:sender viewController:self];
    }
}

@end
