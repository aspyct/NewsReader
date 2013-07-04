//
//  NRArticleSummaryCell.m
//  NewsReader
//
//  Created by Antoine d Otreppe on 04/07/13.
//  Copyright (c) 2013 Aspyct. All rights reserved.
//

#import "NRArticleSummaryCell.h"

@implementation NRArticleSummaryCell

- (void)updateWithArticle:(NRArticle *)article {
    self.textLabel.text = article.title;
    self.detailTextLabel.text = article.excerpt;
}

@end
