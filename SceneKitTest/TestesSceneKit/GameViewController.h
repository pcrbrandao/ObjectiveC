//
//  GameViewController.h
//  Testes SceneKit
//

//  Copyright (c) 2016 Pedro Brandão. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SceneKit/SceneKit.h>
#import "GameScene.h"
#import "Jogo.h"

@interface GameViewController : UIViewController

@property (nonatomic,retain) Jogo *jogo;
@property (nonatomic,retain) SCNView *scnView;

@end
