//
//  NRArticleListDataSource.h
//  NewsReader
//
//  Created by Antoine d Otreppe on 04/07/13.
//  Copyright (c) 2013 Aspyct. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NRArticle.h"

@interface NRArticleListDataSource : NSObject<UITableViewDataSource>

- (NRArticle *)articleAtIndexPath:(NSIndexPath *)indexPath;
- (void)reloadData:(void (^)())success failure:(void (^)())failure;

@end
