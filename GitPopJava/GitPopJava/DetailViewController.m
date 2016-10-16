//
//  DetailViewController.m
//  GitPopJava
//
//  Created by Pedro Brandão on 26/09/16.
//  Copyright © 2016 Pedro Brandão. All rights reserved.
//

#import "DetailViewController.h"
#import "HeaderCell.h"
#import "PullCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "Controller.h"
#import "FooterPageCell.h"

@interface DetailViewController ()

@property (nonatomic,retain)Controller *controller;

@property (assign,nonatomic)NSInteger lastRow;

@end

@implementation DetailViewController

static NSString *pullCellHeaderId = @"pullCellHeader";
static NSString *pullCellId = @"pullCell";
static NSString *pullCellFooterId = @"pullCellFooter";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _controller = [Controller sharedController];
    self.lastRow = 0;
    [self.tableView setHidden:YES];
    [self.atividade setHidden:NO];
    [self.atividade startAnimating];
    if (_autor && _repo) {
        [_controller loadPullsWithOwner:self.autor.login andRepoName:self.repo.name naView:self];
    }
    //dispatch_async(dispatch_get_main_queue(), ^{
    //    [self.controller loadPullsFrom:self.autor.login andRepoName:self.repo.name naTableView:self.tableView];
    //});
    
    self.navigationItem.title = self.repo.name;
    self.navigationItem.leftBarButtonItem = [self.splitViewController displayModeButtonItem];
    self.navigationItem.leftItemsSupplementBackButton = YES;
}

- (void)viewWillAppear:(BOOL)animated {
    if (self.navigationItem.title.length == 0) {
        self.navigationItem.title = @"Selecione um repositório";
        [self.atividade stopAnimating];
        [self.atividade setHidden:YES];
    }
    [super viewWillAppear:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma TableView

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.controller.pullRequests.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PullCell *cell = (PullCell *)[tableView dequeueReusableCellWithIdentifier:pullCellId];
    PullRequest *pull = [self.controller.pullRequests objectAtIndex:indexPath.row];
    
    cell.titulo.text = pull.title;
    cell.body.text = pull.body;
    cell.username.text = pull.user.login;
    cell.nomeCompleto.text = pull.user.name;
    
    [cell.foto sd_setImageWithURL:[pull.user avatarURL] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    HeaderCell *headerCell = [tableView dequeueReusableCellWithIdentifier:pullCellHeaderId];
    
    headerCell.openLabel.text = [NSString stringWithFormat:@"%d opened/", self.controller.pullOpened];
    headerCell.closedLabel.text = [NSString stringWithFormat:@"%d closed", self.controller.pullClosed];
    
    return headerCell;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    FooterPageCell *footerCell = [tableView dequeueReusableCellWithIdentifier:pullCellFooterId];
    
    footerCell.pagina.text = [NSString stringWithFormat:@"pág.%d/", self.controller.pullRequestsPag];
    footerCell.total.text = [NSString stringWithFormat:@"%d", self.controller.lastPullRequestsPag];
    
    return footerCell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(nonnull UITableViewCell *)cell forRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    if (indexPath.row > self.lastRow) {
        self.lastRow = indexPath.row;
    }
    
    if ((indexPath.row % 20) == 0 && indexPath.row == self.lastRow && indexPath.row > 0) {
        if (self.controller.pullRequestsPag < self.controller.lastPullRequestsPag) {
            self.controller.pullRequestsPag++;
            NSLog(@"incrementando página.... %d", self.controller.pullRequestsPag);
            [self.controller loadPullsFrom:self.autor.login andRepoName:self.repo.name naTableView:self.tableView];
        }
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PullRequest *pull = [self.controller.pullRequests objectAtIndex:indexPath.row];
    [[UIApplication sharedApplication] openURL:pull.HTMLURL];
}

@end
