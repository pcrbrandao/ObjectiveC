//
//  profile.h
//  MostreMeuLogin
//
//  Created by Pedro Brandão on 06/10/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>

@interface Profile : FBSDKProfile

@property (nonatomic,retain)NSString *email;

@end
