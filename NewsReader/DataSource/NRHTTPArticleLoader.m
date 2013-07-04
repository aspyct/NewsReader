//
//  NRArticleLoader.m
//  NewsReader
//
//  Created by Antoine d Otreppe on 04/07/13.
//  Copyright (c) 2013 Aspyct. All rights reserved.
//

#import "NRHTTPArticleLoader.h"

#import "AFNetworking.h"

@implementation NRHTTPArticleLoader

- (void)fillArticle:(NRArticle *)article success:(void (^)())success failure:(void (^)())failure {
    NSString *urlString = [NSString stringWithFormat:SERVER_URL(/article/details/%@), article.articleId];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        [article fillWithDict:JSON];
        
        if (success) {
            success();
        }
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        if (failure) {
            failure();
        }
    }];
    
    [operation start];
}

@end
