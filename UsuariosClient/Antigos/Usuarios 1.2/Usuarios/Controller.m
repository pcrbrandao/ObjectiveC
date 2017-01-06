//
//  Controller.m
//  Usuarios
//
//  Created by Pedro Brandão on 21/04/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "Controller.h"
#import "AFNetManager.h"

@implementation Controller

// Obtém a url a partir do arquivo services.plist
- (NSString *)urlServico {
    
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    if (!_urlServico.length ) {
        
        [def setURL:[NSURL URLWithString:@"http://localhost:8080/usuarios/services"] forKey:@"servico"];
    }
    _urlServico = [def URLForKey:@"servico"].absoluteString;
    return _urlServico;
}

-(void)comandoComUsuario:(Usuario *)usuario comBloco:(BlocoNetManager *)bloco comSender:(id)sender naView:(UIViewController *)view {
    
}

#pragma mark - Complementos
// A operação do manager retorna um dicionário que pode
// então ser atribuido a um usuário
+(void)setUsuario:(Usuario *)usuario comDicionario:(NSDictionary *)dicionario {
    
    long iD = [dicionario[@"ID"] longValue];
    NSString *nome = dicionario[@"nome"];
    NSString *senha = dicionario[@"senha"];
    
    if (usuario == nil) {
        usuario = [[Usuario alloc] initComId:iD
                                        nome:nome
                                       senha:senha];
    } else {
        [usuario setID:iD];
        [usuario setNome:nome];
        [usuario setSenha:senha];
    }
}

-(void)postNoLocal:(NSString *)local comParam:(NSDictionary *)param comView:(UIViewController *)view comBloco:(BlocoNetManager *)bloco eSender:(id)sender {
    
    AFNetManager *netManager = [[AFNetManager alloc] init];
    
    [netManager.manager POST:local parameters:param
                     progress:^(NSProgress *uploadProgress) {
                         [bloco progresso:uploadProgress
                        comViewController:view
                                comSender:sender];
                     }
                      success:^(NSURLSessionDataTask *task, id response) {
                          [bloco sucesso:task
                             comResponse:response
                       comViewController:view
                               comSender:sender];
                      }
                      failure:^(NSURLSessionDataTask *task, NSError *erro) {
                          [bloco erro:task
                              comErro:erro
                    comViewController:view
                            comSender:sender];
                      }];
}

-(void)getNolocal:(NSString *)local comParam:(NSDictionary *)param comView:(UIViewController *)view comBloco:(BlocoNetManager *)bloco eSender:(id)sender {
    
    AFNetManager *netManager = [[AFNetManager alloc] init];
    
    [netManager.manager GET:local parameters:param
                    progress:^(NSProgress *progresso) {
                        [bloco progresso:progresso comViewController:view comSender:sender];
                    }
                     success:^(NSURLSessionTask *task, id response) {
                         [bloco sucesso:task comResponse:response comViewController:view comSender:sender];
                     }
                     failure:^(NSURLSessionTask *task, NSError *erro) {
                         [bloco erro:task comErro:erro comViewController:view comSender:sender];
                     }];
}

-(void)deleteNoLocal:(NSString *)local comParam:(NSDictionary *)param comView:(UIViewController *)view comBloco:(BlocoNetManager *)bloco eSender:(id)sender {
    
    AFNetManager *netManager = [[AFNetManager alloc] init];
    NSLog(@"Deletando com parametro: %@", param);
    NSLog(@"no local: %@", local);
    [netManager.manager DELETE:local parameters:param
                       success:^(NSURLSessionDataTask *task, id response) {
                           [bloco sucesso:task comResponse:response comViewController:view comSender:sender];
                       }
                       failure:^(NSURLSessionDataTask *task, NSError *erro) {
                           [bloco erro:task comErro:erro comViewController:view comSender:sender];
                       }];
}

@end
