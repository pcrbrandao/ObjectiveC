//
//  Cell.m
//  TimeTable-ObjC
//
//  Created by Pedro Brandão on 09/09/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "Cell.h"
#import "CellBackground.h"

@implementation Cell

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        CellBackground *background = [[CellBackground alloc] initWithFrame:CGRectZero];
        self.selectedBackgroundView = background;
    }
    return self;
}

@end
