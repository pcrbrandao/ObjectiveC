//
//  FeedViewController.m
//  PetRescue
//
//  Created by Pedro Brandão on 22/02/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import "PostViewController.h"
#import "SidebarViewController.h"

@interface PostViewController ()

@end

@implementation PostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
    self.navigationItem.leftItemsSupplementBackButton = YES;
    // self.backButtom = self.splitViewController.displayModeButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// - (IBAction)back:(id)sender {
//     [self.splitViewController.displayModeButtonItem action];
// }
@end
