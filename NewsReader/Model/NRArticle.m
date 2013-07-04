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
    self.articleId = [self valueOrNil:dict forKey:@"articleId"];
    self.title = [self valueOrNil:dict forKey:@"title"];
    self.publishDate = [self valueOrNil:dict forKey:@"publishDate"];
    self.excerpt = [self valueOrNil:dict forKey:@"excerpt"];
    self.body = [self valueOrNil:dict forKey:@"body"];
}

- (id)valueOrNil:(NSDictionary *)dict forKey:(NSString *)key {
    id value = dict[key];
    
    if (value == [NSNull null]) {
        return nil;
    }
    else {
        return value;
    }
}

+ (NRArticle *)articleFromDict:(NSDictionary *)dict {
    NRArticle *article = [[NRArticle alloc] init];
    
    [article fillWithDict:dict];
    
    return article;
}

@end
