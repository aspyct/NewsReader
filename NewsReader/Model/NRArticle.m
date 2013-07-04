//
//  NRArticle.m
//  NewsReader
//
//  Created by Antoine d Otreppe on 04/07/13.
//  Copyright (c) 2013 Aspyct. All rights reserved.
//

#import "NRArticle.h"

@implementation NRArticle

- (void)fillWithDict:(NSDictionary *)dict {
    self.articleId = dict[@"articleId"];
    self.title = dict[@"title"];
    self.publishDate = dict[@"publishDate"];
    self.excerpt = dict[@"excerpt"];
    self.body = dict[@"body"];
}

+ (NRArticle *)articleFromDict:(NSDictionary *)dict {
    NRArticle *article = [[NRArticle alloc] init];
    
    [article fillWithDict:dict];
    
    return article;
}

@end
