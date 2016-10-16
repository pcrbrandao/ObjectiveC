//
//  DetailViewController.h
//  GitPopJava
//
//  Created by Pedro Brandão on 26/09/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Autor.h"
#import "Repositorio.h"

@interface DetailViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>


@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *atividade;

@property (retain, nonatomic) Autor *autor;
@property (retain, nonatomic) Repositorio *repo;

@end

