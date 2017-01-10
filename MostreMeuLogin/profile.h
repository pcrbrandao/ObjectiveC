//
//  profile.h
//  MostreMeuLogin
//
//  Created by Pedro Brandão on 06/10/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>

/**
 * @discussion É um SBSDKProfile com email que deve ser configurado com o FBSDKGraphRequest
 */
@interface Profile : NSObject

@property (nonatomic,retain)FBSDKProfile *profile;
@property (nonatomic,retain)NSString *email;

-(instancetype)initWithProfile:(FBSDKProfile *)profile;

@end
