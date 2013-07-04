//
//  NRDetailViewController.m
//  NewsReader
//
//  Created by Antoine d Otreppe on 04/07/13.
//  Copyright (c) 2013 Aspyct. All rights reserved.
//

#import "NRDetailViewController.h"
#import "NRHTTPArticleLoader.h"

@interface NRDetailViewController ()

@property NRHTTPArticleLoader *loader;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextView *bodyTextView;

@end

@implementation NRDetailViewController

#pragma mark - Managing the detail item

- (void)setArticle:(NRArticle *)article {
    if (_article != article) {
        [self stopObserving:_article];
        _article = article;
        [self startObserving:_article];
        
        [self updateScreen];
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

- (void)updateScreen
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
    self.bodyTextView.text = self.article.body;
}

- (void)updateArticlePublishDate {
    self.title = self.article.publishDate;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self updateScreen];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.loader = [[NRHTTPArticleLoader alloc] init];
    [self.loader fillArticle:self.article success:nil failure:^{
        NSLog(@"Could not fetch article");
    }];
}

- (void)dealloc {
    [self stopObserving:self.article];
}

@end
