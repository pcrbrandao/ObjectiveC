//
//  ViewController.h
//  MostreMeuLogin
//
//  Created by Pedro Brandão on 02/10/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import "Profile.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet FBSDKLoginButton *loginButton;
@property (weak, nonatomic) IBOutlet UILabel *nome;
@property (strong, nonatomic) IBOutlet FBSDKProfilePictureView *foto;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UITabBarItem *tabBarItem;

@property (nonatomic,retain)NSDictionary *profileParam;
@property (nonatomic,retain)Profile *profile;

@end

