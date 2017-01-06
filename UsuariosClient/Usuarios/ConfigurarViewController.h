//
//  ConfigurarViewController.h
//  Usuarios
//
//  Created by Pedro Brandão on 15/04/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"

@interface ConfigurarViewController : RootViewController

@property (weak, nonatomic) IBOutlet UILabel *labelMensagem;
@property (weak, nonatomic) IBOutlet UITextField *textFieldEndereco;
- (IBAction)atualizarEndereco:(id)sender;

@end
