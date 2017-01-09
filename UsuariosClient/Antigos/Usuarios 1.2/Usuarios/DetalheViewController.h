//
//  DetalheViewController.h
//  Usuarios
//
//  Created by Pedro Brandão on 19/04/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Usuario.h"

@interface DetalheViewController : UIViewController

@property (strong, nonatomic) Usuario *usuario;
@property (weak, nonatomic) IBOutlet UILabel *labelDetalhe;


@end
