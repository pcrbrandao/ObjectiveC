//
//  Acelerometro.m
//  14Bis
//
//  Created by Pedro Brandão on 24/07/16.
//  Copyright © 2016 Apportable. All rights reserved.
//

#import "Acelerometro.h"

#define kCALIBRATIONCOUNT 30

@implementation Acelerometro

static Acelerometro *sharedAcelerometro = nil;

+(Acelerometro *)sharedAcelerometro {
    if (!sharedAcelerometro) {
        sharedAcelerometro = [[Acelerometro alloc] init];
    }
    return sharedAcelerometro;
}

-(CMMotionManager *)motionManager {
    if (!_motionManager) {
        _motionManager = [[CMMotionManager alloc] init];
        _motionManager.accelerometerUpdateInterval = 0.01;
    }
    return _motionManager;
}

-(void)startAcelerometroUpdates {
    if ([self.motionManager isAccelerometerAvailable]) {
        self.currentAccelerationX = 0.0;
        self.currentAccelarationY = 0.0;
        
        self.calibrated = 0;
        self.calibratedAccelerationX = 0.0;
        self.calibratedAccelerationY = 0.0;
        
        [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
            
            if (self.calibrated < kCALIBRATIONCOUNT) {
                self.calibratedAccelerationX += accelerometerData.acceleration.x;
                self.calibratedAccelerationY += accelerometerData.acceleration.y;
                self.calibrated++;
            }
            if (self.calibrated == kCALIBRATIONCOUNT) {
                self.calibratedAccelerationX /= kCALIBRATIONCOUNT;
                self.calibratedAccelerationY /= kCALIBRATIONCOUNT;
                self.calibrated++;
            } else {
                self.currentAccelerationX = accelerometerData.acceleration.x - self.calibratedAccelerationX;
                self.currentAccelarationY = accelerometerData.acceleration.y - self.calibratedAccelerationY;
            }
        }];
    }
}

-(void)stopAcelerometroUpdates {
    if ([self.motionManager isAccelerometerActive]) {
        [self.motionManager stopAccelerometerUpdates];
    }
}

@end
