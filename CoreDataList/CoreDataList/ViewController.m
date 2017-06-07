//
//  ViewController.m
//  CoreDataList
//
//  Created by Pedro Brandão on 06/01/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import "ViewController.h"
#import "Textos.h"

@interface ViewController ()

@property (retain, nonatomic) UsuarioController *usuarioController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.usuariosTableView registerClass:UITableViewCell.self forCellReuseIdentifier:@"dataCell"];
    self.usuarioController = [UsuarioController sharedInstance];
    
    [self.nomeField becomeFirstResponder];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)doAction:(UIButton *)sender {
    if ([sender.titleLabel.text isEqualToString:kADICIONA]) {
        
        NSError *err = [self.usuarioController addUsuarioComNome:self.nomeField.text
                                           eSenha:self.senhaField.text];
        [self limpaFields];
        
        if (!err) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.usuariosTableView reloadData];
            });
            return;
        }
        
        NSLog(@"\n\nHouve um erro aqui.... %@", err.localizedDescription);
    }
}

- (void)limpaFields {
    self.senhaField.text = @"";
    self.nomeField.text = @"";
    [self.nomeField becomeFirstResponder];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSInteger rows = [self.usuarioController usuariosCount];
    
    if (rows > 0) {
        return rows;
    }
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"dataCell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = @"Lista vazia...";
    
    NSInteger userCount = [self.usuarioController usuariosCount];
    
    if (userCount > 0) {
        Usuario *usuario = [self.usuarioController usuarioID:indexPath.row];
        cell.textLabel.text = usuario.nome;
    }
    
    return cell;
}
@end
