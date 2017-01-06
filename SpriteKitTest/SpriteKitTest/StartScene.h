//
//  StartScene.h
//  SpriteKitTest
//
//  Created by Pedro Brandão on 07/08/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Background.h"
#import "GameLabel.h"
#import "GameController.h"

@interface StartScene : SKScene<GameControllerProtocol>

@property (nonatomic,retain) Background *background;
@property (nonatomic,retain) GameLabel *startLabel;
@property (nonatomic,retain) GameController *gameController;

@end
