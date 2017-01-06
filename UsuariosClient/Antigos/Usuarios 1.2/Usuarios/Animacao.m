//
//  Animacao.m
//  Usuarios
//
//  Created by Pedro Brandão on 26/03/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "Animacao.h"

@implementation Animacao

+(void)tremeUIControl:(UIControl *)control {
    
    control.transform = CGAffineTransformMakeTranslation(20, 0);
    [UIView animateWithDuration:0.4
                          delay:0.0
         usingSpringWithDamping:0.2
          initialSpringVelocity:1.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         control.transform = CGAffineTransformIdentity;
                     }
                     completion:nil ];
}

+(void)transformaUILabel:(UILabel *)label {
    
    [label setAlpha:0];
    
    label.transform = CGAffineTransformMakeScale(1.5, 1.5);
    [UIView animateWithDuration:0.4
                          delay:0.0
         usingSpringWithDamping:0.2
          initialSpringVelocity:1.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^(void) {
                         [label setHidden:NO];
                         [label setAlpha:1];
                         [label setTransform:CGAffineTransformIdentity];
                     }
                     completion:^(BOOL finalizado) {
                         [UIView animateWithDuration:1
                                          animations:^(void) {
                                              [label setAlpha:0];
                                          }
                                          completion:^(BOOL finalizado) {
                                              [label setHidden:YES];
                                          }];
                     }];
}

+(void)apareceEsomeUILabel:(UILabel *)control {
    
    control.alpha = 0;
    
    [UIView animateWithDuration:1
                     animations:^(void) {
                         [control setHidden:NO];
                         [control setAlpha:1];
                     }
                     completion:^(BOOL finalizado) {
                         [UIView animateWithDuration:1
                                          animations:^(void) {
                                              [control setAlpha:0];
                                          }
                                          completion:^(BOOL finalizado) {
                                              [control setHidden:YES];
                                          }];
                     }];
}

@end
