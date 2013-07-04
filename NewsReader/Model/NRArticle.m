//
//  NRArticle.m
//  NewsReader
//
//  Created by Antoine d Otreppe on 04/07/13.
//  Copyright (c) 2013 Aspyct. All rights reserved.
//

#import "NRArticle.h"

@implementation NRArticle

+ (NRArticle *)articleFromDict:(NSDictionary *)dict {
    NRArticle *article = [[NRArticle alloc] init];
    
    article.articleId = dict[@"articleId"];
    article.title = dict[@"title"];
    article.publishDate = dict[@"publishDate"];
    article.excerpt = dict[@"excerpt"];
    article.body = dict[@"body"];
    
    return article;
}

@end
