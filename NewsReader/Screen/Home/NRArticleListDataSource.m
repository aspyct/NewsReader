//
//  NRArticleListDataSource.m
//  NewsReader
//
//  Created by Antoine d Otreppe on 04/07/13.
//  Copyright (c) 2013 Aspyct. All rights reserved.
//

#import "NRArticleListDataSource.h"

#import "AFNetworking.h"

#import "NRArticleSummaryCell.h"

@interface NRArticleListDataSource ()

@property NSMutableArray *articles;

@end

@implementation NRArticleListDataSource

- (NRArticle *)articleAtIndexPath:(NSIndexPath *)indexPath {
    return self.articles[indexPath.row];
}

- (void)reloadData:(void (^)())success failure:(void (^)())failure {
    NSURL *listUrl = [NSURL URLWithString:SERVER_URL(/article/list)];
    NSURLRequest *request = [NSURLRequest requestWithURL:listUrl];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSArray *rawList = JSON;
        self.articles = [NSMutableArray arrayWithCapacity:rawList.count];
        
        for (NSDictionary *articleDict in rawList) {
            [self.articles addObject:[NRArticle articleFromDict:articleDict]];
        }
        
        success();
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        NSLog(@"%@", error);
        failure();
    }];
    
    [operation start];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.articles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NRArticleSummaryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    NRArticle *article = [self articleAtIndexPath:indexPath];
    [cell updateWithArticle:article];
    
    return cell;
}

@end
