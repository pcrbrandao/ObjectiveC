//
//  SegueProtocol.h
//  Usuarios
//
//  Created by Pedro Brandão on 03/04/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol SegueViewProtocol<NSObject>

-(void)executar:(UIStoryboardSegue *)segue sender:(id)sender viewController:(UIViewController *)view;

@end

@interface SegueView : NSObject

@end
