//
//  GameViewController.m
//  SpriteKitTest
//
//  Created by Pedro Brandão on 29/07/16.
//  Copyright (c) 2016 Pedro Brandão. All rights reserved.
//

#import "GameViewController.h"
#import "GameScene.h"
#import "StartScene.h"

@implementation GameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // GameScene *scene = [GameScene sceneWithSize:CGSizeMake(1536, 2048)];

    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    /* Sprite Kit applies additional optimizations to improve rendering performance */
    skView.ignoresSiblingOrder = YES;
    
    // Create and configure the scene.
    // GameScene *scene = [GameScene nodeWithFileNamed:@"GameScene"];
    StartScene *scene = [StartScene nodeWithFileNamed:@"GameScene"];
    
    [scene setSize:CGSizeMake(1536, 2048)]; // acrescentei aqui
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [skView presentScene:scene];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
