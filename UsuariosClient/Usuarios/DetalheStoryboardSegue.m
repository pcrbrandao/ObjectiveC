//
//  DetalheSegue.m
//  Usuarios
//
//  Created by Pedro Brandão on 19/04/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "DetalheStoryboardSegue.h"
#import "DetalheViewController.h"
#import "UsuarioTableViewController.h"

@implementation DetalheStoryboardSegue

-(void)executar:(UIStoryboardSegue *)segue sender:(UITableView *)sender viewController:(UsuarioTableViewController *)view {
    
    DetalheViewController *controller = (DetalheViewController *)[[segue destinationViewController] topViewController];
    
    NSIndexPath *indexPath = [view.tableView indexPathForSelectedRow];
    Usuario *usuario = view.usuarios[indexPath.row];
    [controller setUsuario:usuario];
    
    controller.navigationItem.leftBarButtonItem = view.splitViewController.displayModeButtonItem;
    controller.navigationItem.leftItemsSupplementBackButton = YES;
}

@end
