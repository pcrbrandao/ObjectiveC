//
//  GameOverScene.h
//  SpriteKitTest
//
//  Created by Pedro Brandão on 05/08/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "GameLabel.h"
#import "GameController.h"

@interface GameOverScene : SKScene<GameControllerProtocol>

@property (nonatomic,retain) Background *background;
@property (nonatomic,retain) GameLabel *gameOverLabel;
@property (nonatomic,retain) GameLabel *scoreLabel;
@property (nonatomic,retain) GameLabel *highScoreLabel;
@property (nonatomic,retain) GameLabel *restartLabel;
@property (nonatomic,retain) GameController *gameController;

@end
