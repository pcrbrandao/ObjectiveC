//
//  ReposCell.h
//  GitPopJava
//
//  Created by Pedro Brandão on 27/09/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReposCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *descricao;
@property (weak, nonatomic) IBOutlet UILabel *nome;
@property (weak, nonatomic) IBOutlet UILabel *forks;
@property (weak, nonatomic) IBOutlet UILabel *stars;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *nomeSobrenome;

@property (weak, nonatomic) IBOutlet UIImageView *foto;

@end
