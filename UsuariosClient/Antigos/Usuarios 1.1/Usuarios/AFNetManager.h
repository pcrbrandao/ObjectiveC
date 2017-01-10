//
//  AFNetManager.h
//  Usuarios
//
//  Created by Pedro Brandão on 24/03/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface AFNetManager : NSObject

//@property (retain, nonatomic)AFHTTPResponseSerializer *resp;
//@property (retain, nonatomic)AFHTTPRequestSerializer *req;
@property (retain, nonatomic)AFHTTPSessionManager *manager;

-(id)initComResponseSerializer:(AFHTTPResponseSerializer *)response;
-(id)initComResponse:(AFHTTPResponseSerializer *)response eRequest:(AFHTTPRequestSerializer *)request;

@end

