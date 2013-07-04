//
//  NRDetailViewController.m
//  NewsReader
//
//  Created by Antoine d Otreppe on 04/07/13.
//  Copyright (c) 2013 Aspyct. All rights reserved.
//

#import "NRDetailViewController.h"

@interface NRDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation NRDetailViewController

#pragma mark - Managing the detail item

- (void)setArticle:(NRArticle *)article {
    if (_article != article) {
        [self stopObserving:_article];
        _article = article;
        [self startObserving:_article];
        
        [self updateArticle];
    }
}

- (void)startObserving:(NRArticle *)article {
    [article addObserver:self forKeyPath:@"title" options:0 context:nil];
    [article addObserver:self forKeyPath:@"body" options:0 context:nil];
    [article addObserver:self forKeyPath:@"publishDate" options:0 context:nil];
}

- (void)stopObserving:(NRArticle *)article {
    [article removeObserver:self forKeyPath:@"title"];
    [article removeObserver:self forKeyPath:@"body"];
    [article removeObserver:self forKeyPath:@"publishDate"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (object == self.article) {
        if ([keyPath isEqualToString:@"title"]) {
            [self updateArticleTitle];
        }
        else if ([keyPath isEqualToString:@"body"]) {
            [self updateArticleBody];
        }
        else if ([keyPath isEqualToString:@"publishDate"]) {
            [self updateArticlePublishDate];
        }
    }
}

- (void)updateArticle
{
    if (self.article) {
        [self updateArticleTitle];
        [self updateArticleBody];
        [self updateArticlePublishDate];
    }
}

- (void)updateArticleTitle {
    self.titleLabel.text = self.article.title;
}

- (void)updateArticleBody {
    
}

- (void)updateArticlePublishDate {
    self.title = self.article.publishDate;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self updateArticle];
}

- (void)dealloc {
    [self stopObserving:self.article];
}

@end
