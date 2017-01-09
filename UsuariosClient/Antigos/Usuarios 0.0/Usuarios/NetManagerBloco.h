//
//  NetManagerBloco.h
//  Usuarios
//
//  Created by Pedro Brandão on 01/04/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol NetManagerBlocoProtocol <NSObject>

-(void)progresso:(NSProgress *)progresso comViewController:(UIViewController *)view comSender:(id)sender;
-(void)sucesso:(NSURLSessionTask *)task comResponse:(id)response comViewController:(UIViewController *)view comSender:(id)sender;
-(void)erro:(NSURLSessionTask *)task comErro:(NSError *)erro comViewController:(UIViewController *)view comSender:(id)sender;

@end

@interface NetManagerBloco : NSObject

@end
