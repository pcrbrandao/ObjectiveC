//
//  FQButton.m
//  FlagQuiz
//
//  Created by Pedro Brandão on 25/08/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import "FQButton.h"
#import "UIColor+HexString.h"

@implementation FQButton

-(void)awakeFromNib {
    [super awakeFromNib];
    
    NSString *colorsPath = [[NSBundle mainBundle] pathForResource:@"colors" ofType:@"plist"];
    NSDictionary *colors = [NSDictionary dictionaryWithContentsOfFile:colorsPath];
    
    self.layer.cornerRadius = 4;
    self.backgroundColor = [UIColor colorWithHexString:[colors valueForKey:@"colorPrimary"]];
}

@end
