//
//  MainController.h
//  TimeTable-ObjC
//
//  Created by Pedro Brandão on 23/09/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainController : NSObject

@property (nonatomic,retain) NSMutableArray *diasDeAula;
@property (nonatomic,retain) NSMutableArray *materias;

+(MainController *)sharedController;

@end
