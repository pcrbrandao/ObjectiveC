//
//  Acelerometro.h
//  14Bis
//
//  Created by Pedro Brandão on 24/07/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreMotion/CoreMotion.h>

@interface Acelerometro : NSObject

@property (nonatomic,retain) CMMotionManager *motionManager;

-(void)startAcelerometroUpdates;
-(void)stopAcelerometroUpdates;

@property (nonatomic, assign)float currentAccelerationX;
@property (nonatomic, assign)float currentAccelarationY;

@property (nonatomic, assign)int calibrated;
@property (nonatomic, assign)float calibratedAccelerationX;
@property (nonatomic, assign)float calibratedAccelerationY;

+(Acelerometro *)sharedAcelerometro;

@end
