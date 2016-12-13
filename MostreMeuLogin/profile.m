//
//  profile.m
//  MostreMeuLogin
//
//  Created by Pedro Brandão on 06/10/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "Profile.h"

@implementation Profile

-(instancetype)initWithProfile:(FBSDKProfile *)profile {
    self = [super init];
    if (self) {
        _profile = profile;
    }
    return self;
}

-(NSString *)email {
    if (!_email) {
        _email = @"email vazio";
    }
    return _email;
}

@end
