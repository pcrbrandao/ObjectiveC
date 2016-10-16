//
//  MasterViewController.h
//  GitPopJava
//
//  Created by Pedro Brandão on 26/09/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Controller.h"

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;
@property (retain, nonatomic) Controller *controller;

@end

