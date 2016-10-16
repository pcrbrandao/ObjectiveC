//
//  GameViewController.h
//  SceneKitObjC-Shooter
//

//  Copyright (c) 2016 Pedro Brandão. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SceneKit/SceneKit.h>
#import "GameController.h"

@interface GameViewController : UIViewController

@property (strong, nonatomic) IBOutlet SCNView *scnView;
@property (retain, nonatomic) GameController *gameController;

@end
