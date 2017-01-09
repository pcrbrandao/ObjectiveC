//
//  Score.h
//  14Bis
//
//  Created by Pedro Brandão on 21/07/16.
//  Copyright 2016 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Score : CCNode { }

@property (nonatomic,assign) int score;
@property (nonatomic,retain) CCLabelBMFont *text;

-(void)increase;

@end
