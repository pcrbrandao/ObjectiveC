//
//  MasterViewController.m
//  GitPopJava
//
//  Created by Pedro Brandão on 26/09/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "Repositorio.h"
#import "ReposCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface MasterViewController ()

@property (assign,nonatomic)NSInteger lastRow;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _controller = [Controller sharedController];
    self.lastRow = 0;
    
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
}

- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        
        NSIndexPath *indexPath = (NSIndexPath *)sender;
        UINavigationController *nav = segue.destinationViewController;
        
        DetailViewController *detailViewController = (DetailViewController *)[[nav viewControllers] firstObject];
        Autor *autor = [self.controller.autores objectAtIndex:indexPath.row];
        Repositorio *repo = [self.controller.repositorios objectAtIndex:indexPath.row];
        
        // [self.controller loadAllPullsFrom:autor.login andRepoName:repo.name];
        
        self.controller.pullRequests = [NSMutableArray array];
        self.controller.pullOpened = 0;
        self.controller.pullClosed = 0;
        self.controller.pullRequestsPag = 1;
        self.controller.lastPullRequestsPag = 1;
        
        detailViewController.autor = autor;
        detailViewController.repo = repo;
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.controller.repositorios.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ReposCell *cell = (ReposCell *)[tableView dequeueReusableCellWithIdentifier:@"ReposCell"];

    Repositorio *repositorio = self.controller.repositorios[indexPath.row];
    Autor *autor = self.controller.autores[indexPath.row];
    
    cell.nome.text = [repositorio name];
    cell.descricao.text = [repositorio repoDescription];
    cell.forks.text = [NSString stringWithFormat:@"Y %d", repositorio.forks];
    cell.stars.text = [NSString stringWithFormat:@"* %d", repositorio.stars];
    
    cell.userName.text = [repositorio ownerLogin];
    cell.nomeSobrenome.text = [repositorio fullName];
    
    [cell.foto sd_setImageWithURL:[autor avatarURL] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self performSegueWithIdentifier:@"showDetail" sender:indexPath];
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(nonnull UITableViewCell *)cell forRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    
    if (indexPath.row > self.lastRow) {
        self.lastRow = indexPath.row;
    }
    
    if ((indexPath.row % 20) == 0 && indexPath.row == self.lastRow && indexPath.row > 0) {
        self.controller.repositoriosPag++;
        NSLog(@"incrementando página.... %d", self.controller.repositoriosPag);
        [self.controller loadRepositoriosNaPagina:self.controller.repositoriosPag naTableView:tableView];
    }
}

@end
