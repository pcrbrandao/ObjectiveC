//
//  GameViewController.m
//  Testes SceneKit
//
//  Created by Pedro Brandão on 28/07/16.
//  Copyright (c) 2016 Pedro Brandão. All rights reserved.
//

#import "GameViewController.h"
#import "ShapeEntity.h"

@implementation GameViewController

#pragma mark Sobrescritos

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _jogo = [[Jogo alloc] init];
    
    _scnView = (SCNView *)self.view;
    _scnView.scene = _jogo.scene;
    _scnView.delegate = _jogo;
    
    [_scnView setShowsStatistics:YES];
    [_scnView setAllowsCameraControl:NO];
    [_scnView setAutoenablesDefaultLighting:YES];
    [_scnView setPlaying:YES];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.jogo handleTouches:touches inView:self.scnView];
}

@end
