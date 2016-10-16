//
//  Controller.m
//  GitPopJava
//
//  Created by Pedro Brandão on 26/09/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "Controller.h"
#import "AFNetworking.h"
#import "Autor.h"
#import "LoadViewController.h"
#import "DetailViewController.h"

@interface Controller()

@end

@implementation Controller

static Controller *sharedController = nil;
static NSString *url = @"https://api.github.com/search/repositories?q=language:Java&sort=stars&page=";
static NSString *pullUrlBase = @"https://api.github.com/repos/%@/%@/pulls?page=%d&state=all&q=is:pr+sort:comments-desc";

-(instancetype)init {
    self = [super init];
    if (self) {
        _repositorios = [NSMutableArray array];
        _pullRequests = [NSMutableArray array];
        _autores = [NSMutableArray array];
        _repositoriosPag = 1;
        _pullRequestsPag = 1;
    }
    return self;
}

-(NSURLRequest *)requestNaUrl:(NSString *)url {
    NSURL *urlCompleta = [NSURL URLWithString:url];
    return [NSURLRequest requestWithURL:urlCompleta];
}

-(void)loadRepositoriosComDic:(NSDictionary *)repositoriosDic {
    
    NSArray *elementos = [repositoriosDic valueForKey:@"items"];
    if ([elementos count] > 0) {
        NSError *erro = nil;
        for (NSDictionary *item in elementos) {
            Repositorio *repo = [MTLJSONAdapter modelOfClass:Repositorio.class fromJSONDictionary:item error:&erro];
            
            NSString *fullName = [item objectForKey:@"full_name"];
            NSString *forks = [item objectForKey:@"forks_count"];
            NSString *stars = [item objectForKey:@"stargazers_count"];
            
            [repo setFullName:fullName];
            [repo setStars:[stars intValue]];
            [repo setForks:[forks intValue]];
            
            [self.repositorios addObject:repo];
            
            NSDictionary *autorDic = [item valueForKey:@"owner"];
            Autor *user = [MTLJSONAdapter modelOfClass:Autor.class fromJSONDictionary:autorDic error:&erro];
            [self.autores addObject:user];
        }
        NSLog(@"Repositórios count após parsing....%lu", (unsigned long)[self.repositorios count]);
        // [tableView reloadData];
    }
}

-(void)loadRepositoriosNaPagina:(int)pagina comView:(LoadViewController *)view {
    
    NSString *urlString = [NSString stringWithFormat:@"%@%d", url, pagina];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:[self requestNaUrl:urlString] success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        // sucesso
        [self loadRepositoriosComDic:JSON];
        [view.atividade stopAnimating];
        [view.carregandoLabel setText:@"pronto!"];
        [view.atividade setHidden:YES];
        [view performSegueWithIdentifier:@"segueMain" sender:view];
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        // erro
        NSLog(@"Erro: %@ tentando JSON em %@", error.localizedDescription, urlString);
    }];
    
    [operation start];
    
}

-(void)loadRepositoriosNaPagina:(int)pagina naTableView:(UITableView *)tableView {
    
    NSString *urlString = [NSString stringWithFormat:@"%@%d", url, pagina];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:[self requestNaUrl:urlString] success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        // sucesso
        [self loadRepositoriosComDic:JSON];
        NSLog(@"Repositórios count após parsing....%lu", (unsigned long)[self.repositorios count]);
        [tableView reloadData];
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        // erro
        NSLog(@"Erro: %@ tentando JSON em %@", error.localizedDescription, urlString);
    }];
    
    [operation start];
}

-(void)loadPullsWithArray:(NSArray *)JSON andResponse: (NSHTTPURLResponse *)response {
    if (self.lastPullRequestsPag == 1) {
        NSDictionary *headers = response.allHeaderFields;
        NSString *links = [headers objectForKey:@"Link"];
        NSString *lastPage = [self lastPageNoLink:links];
        self.lastPullRequestsPag = [self paginaNoLink:lastPage];
        NSLog(@"lastPage....:%d", self.lastPullRequestsPag);
    }
    
    NSError *erro = nil;
    
    for (NSDictionary *item in JSON) {
        PullRequest *pull = [MTLJSONAdapter modelOfClass:PullRequest.class fromJSONDictionary:item error:&erro];
        if (pull.state == OCTPullRequestStateOpen) {
            self.pullOpened++;
        } else {
            self.pullClosed++;
        }
        
        [self.pullRequests addObject:pull];
    }
    NSLog(@"Pull count após parsing...%lu", (unsigned long)[self.pullRequests count]);
}

-(void)loadPullsWithOwner:(NSString *)ownerLogin andRepoName:(NSString *)repoName naView:(DetailViewController *)view {
    
    // implementar aqui
    NSString *pullUrl = [NSString stringWithFormat:pullUrlBase, ownerLogin, repoName, self.pullRequestsPag];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:[self requestNaUrl:pullUrl] success:^(NSURLRequest *request, NSHTTPURLResponse *response, NSArray *JSON) {
        
        NSLog(@"Sucesso lendo em %@", pullUrl);
        [self loadPullsWithArray:JSON andResponse:response];
        [view.tableView setHidden:NO];
        [view.atividade stopAnimating];
        [view.atividade setHidden:YES];
        [view.tableView reloadData];
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        // erro
        NSLog(@"Erro: %@ tentando JSON em %@", error.localizedDescription, pullUrl);
    }];
    [operation start];
    
}

-(void)loadPullsFrom:(NSString *)ownerLogin andRepoName:(NSString *)repoName naTableView:(UITableView *)tableView {
    
    NSString *pullUrl = [NSString stringWithFormat:pullUrlBase, ownerLogin, repoName, self.pullRequestsPag];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:[self requestNaUrl:pullUrl] success:^(NSURLRequest *request, NSHTTPURLResponse *response, NSArray *JSON) {
        
        NSLog(@"Sucesso lendo em %@", pullUrl);
        [self loadPullsWithArray:JSON andResponse:response];
        [tableView setHidden:NO];
        [tableView reloadData];
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        // erro
        NSLog(@"Erro: %@ tentando JSON em %@", error.localizedDescription, pullUrl);
    }];
    [operation start];
}

-(NSString *)lastPageNoLink:(NSString *)link {
    NSInteger inicio;
    NSInteger fim;
    
    inicio = [link rangeOfString:@","].location + 3;
    link = [link substringFromIndex:inicio];
    fim = [link rangeOfString:@"last"].location - 8;
    link = [link substringToIndex:fim];

    return link;
}

-(int)paginaNoLink:(NSString *)link {
    NSInteger inicio;
    NSInteger fim;
    
    inicio = [link rangeOfString:@"page="].location + 5;
    link = [link substringFromIndex:inicio];
    fim = [link rangeOfString:@"&"].location;
    link = [link substringToIndex:fim];
    
    return [link intValue];
}

+(Controller *)sharedController {
    
    if (!sharedController) {
        sharedController = [[Controller alloc] init];
    }
    return sharedController;
}

@end
