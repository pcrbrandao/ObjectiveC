//
//  Controller.h
//  Usuarios
//
//  Created by Pedro Brandão on 21/04/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Usuario.h"
#import "BlocoNetManager.h"
#import "AFNetManager.h"


@protocol ControllerProtocol <NSObject>

-(void) comandoComUsuario:(Usuario *)usuario comBloco:(BlocoNetManager *)bloco comSender:(id)sender naView:(UIViewController *)view;

@end

@interface Controller : NSObject<ControllerProtocol>

@property (nonatomic, retain)NSString *urlServico;

#pragma - Complementos

-(void)postNoLocal:(NSString *)local comParam:(NSDictionary *)param comView:(UIViewController *)view comBloco:(BlocoNetManager *)bloco eSender:(id)sender;

-(void)getNolocal:(NSString *)local comParam:(NSDictionary *)param comView:(UIViewController *)view comBloco:(BlocoNetManager *)bloco eSender:(id)sender;


-(void)deleteNoLocal:(NSString *)local comParam:(NSDictionary *)param comView:(UIViewController *)view comBloco:(BlocoNetManager *)bloco eSender:(id)sender;

-(void)putNolocal:(NSString *)local comParam:(NSDictionary *)param comView:(UIViewController *)view comBloco:(BlocoNetManager *)bloco eSender:(id)sender;

+(void)setUsuario:(Usuario *)usuario comDicionario:(NSDictionary *)dicionario;

-(NSString *)dataHoje;

@end
