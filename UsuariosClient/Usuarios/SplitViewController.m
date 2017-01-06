//
//  SplitViewController.m
//  Usuarios
//
//  Created by Pedro Brandão on 27/04/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "SplitViewController.h"
#import "DetalheViewController.h"

@interface SplitViewController () <UISplitViewControllerDelegate>

@end

@implementation SplitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UINavigationController *navigationController = [self.viewControllers lastObject];
    navigationController.topViewController.navigationItem.leftBarButtonItem = self.displayModeButtonItem;
    
    self.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view

- (BOOL)splitViewController:(UISplitViewController *)splitViewController collapseSecondaryViewController:(UIViewController *)secondaryViewController ontoPrimaryViewController:(UIViewController *)primaryViewController {
    
    if ([secondaryViewController isKindOfClass:[UINavigationController class]] && [[(UINavigationController *)secondaryViewController topViewController] isKindOfClass:[DetalheViewController class]] && ([(DetalheViewController *)[(UINavigationController *)secondaryViewController topViewController] usuario] == nil)) {
        // Return YES to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
        return YES;
    } else {
        return NO;
    }
}

@end
