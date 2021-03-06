//
//  NRMasterViewController.m
//  NewsReader
//
//  Created by Antoine d Otreppe on 04/07/13.
//  Copyright (c) 2013 Aspyct. All rights reserved.
//

#import "NRMasterViewController.h"

#import "NRDetailViewController.h"
#import "NRArticleListDataSource.h"
#import "NRDetailViewController.h"

@interface NRMasterViewController ()

@property IBOutlet NRArticleListDataSource *dataSource;
@property UIRefreshControl *refreshControl;

@end

@implementation NRMasterViewController

#pragma mark - ViewController lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(reloadData) forControlEvents:UIControlEventValueChanged];
    [self setRefreshControl:self.refreshControl];
    
    [self reloadData];
}

#pragma mark - Data loading

- (void)reloadData {
    [self.dataSource reloadData:^() {
        [self.tableView reloadData];
        [self.refreshControl endRefreshing];
    } failure:^() {
        [self.refreshControl endRefreshing];
    }];
}

#pragma mark - Table View

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        NRDetailViewController *target = segue.destinationViewController;
        target.article = [self.dataSource articleAtIndexPath:indexPath];
    }
}

@end
