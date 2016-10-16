//
//  ViewController.m
//  TimeTable-ObjC
//
//  Created by Pedro Brandão on 09/09/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "DiaViewController.h"
#import "DiaTableViewController.h"
#import "DataCell.h"

@interface DiaViewController ()

@property (strong, nonatomic)DiaTableViewController *diaController;

@end

@implementation DiaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _diaController = [[DiaTableViewController alloc] init];
    
    self.tableView.delegate = self.diaController;
    self.tableView.dataSource = self.diaController;
    [self.diaController refreshControl];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
