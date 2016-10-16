//
//  Controller.h
//  GitPopJava
//
//  Created by Pedro Brandão on 26/09/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Repositorio.h"
#import "PullRequest.h"
#import "Autor.h"
#import <OctoKit/OctoKit.h>

@interface Controller : NSObject

@property (nonatomic,retain)NSMutableArray<Repositorio *> *repositorios;
@property (nonatomic,retain)NSMutableArray<PullRequest *> *pullRequests;
@property (nonatomic,retain)NSMutableArray<Autor *> *autores;

@property (assign, nonatomic)int lastPullRequestsPag;
@property (assign, nonatomic)int pullOpened;
@property (assign, nonatomic)int pullClosed;

@property (assign, nonatomic)int repositoriosPag;
@property (assign, nonatomic)int pullRequestsPag;

-(void)loadRepositoriosNaPagina:(int)pagina comView:(UIViewController *)view;
-(void)loadRepositoriosNaPagina:(int)pagina naTableView:(UITableView *)tableView;

-(void)loadPullsFrom:(NSString *)ownerLogin andRepoName:(NSString *)repoName naTableView:(UITableView *)tableView;
-(void)loadPullsWithOwner:(NSString *)ownerLogin andRepoName:(NSString *)repoName naView:(UIViewController *)view;

+(Controller *)sharedController;

@end
