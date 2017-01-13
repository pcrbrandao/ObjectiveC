//
//  ViewController.h
//  CoreDataList
//
//  Created by Pedro Brandão on 06/01/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UsuarioController.h"
#import "UsuariosTableViewController.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *idLabel;
@property (weak, nonatomic) IBOutlet UITextField *nomeField;
@property (weak, nonatomic) IBOutlet UITextField *senhaField;
@property (weak, nonatomic) IBOutlet UIButton *actionButton;

@property (weak, nonatomic) IBOutlet UITableView *usuariosTableView;

- (IBAction)doAction:(UIButton *)sender;

@end

