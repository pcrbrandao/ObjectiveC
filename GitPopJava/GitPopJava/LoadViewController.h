//
//  LoadViewController.h
//  GitPopJava
//
//  Created by Pedro Brandão on 29/09/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *atividade;
@property (weak, nonatomic) IBOutlet UILabel *carregandoLabel;

@end
