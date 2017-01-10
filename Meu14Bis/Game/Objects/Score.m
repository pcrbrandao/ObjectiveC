//
//  Score.m
//  14Bis
//
//  Created by Pedro Brandão on 21/07/16.
//  Copyright 2016 Apportable. All rights reserved.
//

#import "Score.h"


@implementation Score

-(id)init {
    self = [super init];
    if (self) {
        _position = self.position;
        [self addChild:self.text];
    }
    return self;
}

-(int)score {
    if (!_score) {
        _score = 0;
    }
    return _score;
}

-(CGPoint)position {
    if (!_position.x && !_position.y) {
        _position = ccp(SCREEN_WIDTH-50, SCREEN_HEIGHT-50);
    }
    return _position;
}

-(CCLabelBMFont *)text {
    if (!_text) {
        _text = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"%d", self.score]
                                       fntFile:@"UniSansSemiBold_Numbers_240.fnt"];
        _text.scale = (float)(240.0/240.0);
    }
    return _text;
}

-(void)increase {
    self.score++;
    self.text.string = [NSString stringWithFormat:@"%d", self.score];
}

@end
