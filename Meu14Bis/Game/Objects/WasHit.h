//
//  WasHit.h
//  14Bis
//
//  Created by Pedro Brandão on 22/07/16.
//  Copyright 2016 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@protocol WasHitProtocol <NSObject>

-(void)explode:(id)sender;

@end

@interface WasHit : CCSprite {
    
}

@end
