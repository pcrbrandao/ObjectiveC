//
//  AFNetManager.m
//  Usuarios
//
//  Created by Pedro Brandão on 24/03/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "AFNetManager.h"

@implementation AFNetManager

-(id)init {
    if ((self = [super init])) {
        
        _manager = [AFHTTPSessionManager manager];
        _manager.responseSerializer = [AFJSONResponseSerializer serializer];
        _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    return self;
}

-(id)initComResponseSerializer:(AFHTTPResponseSerializer *)response {
    if ((self = [super init])) {
        _manager = [AFHTTPSessionManager manager];
        _manager.responseSerializer = response;
    }
    return self;
}

-(id)initComResponse:(AFHTTPResponseSerializer *)response eRequest:(AFHTTPRequestSerializer *)request {
    
    if ((self = [super init])) {
        _manager = [AFHTTPSessionManager manager];
        _manager.requestSerializer = request;
        _manager.responseSerializer = response;
    }
    return self;
}

@end


