//
//  Runner.h
//  14Bis
//
//  Created by Pedro Brandão on 26/07/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Runner : NSObject

@property (nonatomic, assign, getter=isGamePaused)BOOL gamePaused;

+(Runner *)sharedRunner;

@end
