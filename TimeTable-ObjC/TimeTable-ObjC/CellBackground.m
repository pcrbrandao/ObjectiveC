//
//  CellBackground.m
//  TimeTable-ObjC
//
//  Created by Pedro Brandão on 09/09/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "CellBackground.h"

@implementation CellBackground

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */

- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef aRef = UIGraphicsGetCurrentContext();
    CGContextSaveGState(aRef);
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:2.0f];
    bezierPath.lineWidth = 5.0f;
    [[UIColor blackColor] setStroke];
    
    // UIColor *fillColor = [UIColor colorWithRed:0.529 green:0.808 blue:0.922 alpha:1];
    UIColor *fillColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1];
    [fillColor setFill];
    
    [bezierPath stroke];
    [bezierPath fill];
    CGContextRestoreGState(aRef);
}


@end
