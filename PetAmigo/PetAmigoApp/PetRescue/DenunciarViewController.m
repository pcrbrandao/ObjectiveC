//
//  DenunciarViewController.m
//  PetRescue
//
//  Created by Pedro Brandão on 02/03/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import "DenunciarViewController.h"

@interface DenunciarViewController ()

@end

@implementation DenunciarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
    self.navigationItem.leftItemsSupplementBackButton = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)goBack:(UIBarButtonItem *)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
