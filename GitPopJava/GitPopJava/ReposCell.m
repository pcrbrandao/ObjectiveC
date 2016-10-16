//
//  ReposCell.m
//  GitPopJava
//
//  Created by Pedro Brandão on 27/09/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "ReposCell.h"

@implementation ReposCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    // configura foto redonda
    // CGFloat radius = self.foto.frame.size.height / 2;
    // [self.foto.layer setCornerRadius:radius];
    // [self.foto setClipsToBounds:YES];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
