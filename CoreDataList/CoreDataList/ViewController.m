//
//  ViewController.m
//  CoreDataList
//
//  Created by Pedro Brandão on 06/01/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (retain, nonatomic) UsuarioController *usuarioController;
@property (retain, nonatomic) UsuariosTableViewController *usuariosTableViewController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.usuariosTableViewController = [UsuariosTableViewController sharedInstance];
    
    self.usuariosTableView.dataSource = self.usuariosTableViewController;
    self.usuariosTableView.delegate = self.usuariosTableViewController;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)doAction:(UIButton *)sender {
}
@end
