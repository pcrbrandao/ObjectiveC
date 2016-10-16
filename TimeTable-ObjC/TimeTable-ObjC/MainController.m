//
//  MainController.m
//  TimeTable-ObjC
//
//  Created by Pedro Brandão on 23/09/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "MainController.h"

@implementation MainController

-(NSMutableArray *)diasDeAula {
    if (!_diasDeAula) {
        _diasDeAula = [NSMutableArray arrayWithArray:@[@"segunda", @"terça", @"quarta", @"quinta", @"sexta"]];
    }
    return _diasDeAula;
}

-(NSMutableArray *)materias {
    if (!_materias) {
        _materias =[NSMutableArray arrayWithArray:@[@"português", @"matemática", @"história", @"geografia"]];
    }
    return _materias;
}

static MainController *sharedController = nil;

+(MainController *)sharedController {
    if (!sharedController) {
        sharedController = [[MainController alloc] init];
    }
    return sharedController;
}

@end
