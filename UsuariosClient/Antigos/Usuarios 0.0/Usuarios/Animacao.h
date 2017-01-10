//
//  Animacao.h
//  Usuarios
//
//  Created by Pedro Brandão on 26/03/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Animacao : NSObject

+(void)tremeUIControl:(UIControl *)control;
+(void)transformaUILabel:(UILabel *)label;
+(void)apareceEsomeUILabel:(UILabel *)control;

@end
