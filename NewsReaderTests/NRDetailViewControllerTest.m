//
//  NRDetailViewControllerTest.m
//  NewsReader
//
//  Created by Antoine d Otreppe on 05/07/13.
//  Copyright (c) 2013 Aspyct. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "UIControl+Manipulate.h"
#import "UIBarButtonItem+Manipulate.h"

#import "NRArticle.h"
#import "NRDetailViewController.h"


@interface NRDetailViewControllerTest : XCTestCase

@property UINavigationController *navController;
@property NRDetailViewController *target;
@property NRArticle *article;

@end

@implementation NRDetailViewControllerTest

- (void)setUp
{
    [super setUp];
    self.target = [[NRDetailViewController alloc] init];
    
    self.article = [OCMockObject mockForClass:[NRArticle class]];
    self.target.article = self.article;
    
    id articleMock = self.article;
    [articleMock stub] addObserver:self.target forKeyPath:@"title" options:<#(NSKeyValueObservingOptions)#> context:<#(void *)#>
    
    
    self.navController = [[UINavigationController alloc] initWithRootViewController:self.target];
}

- (void)testExample
{
    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

- (void)testRightNavButtonShouldOpenActivitySheet {
    UIBarButtonItem *rightButton = self.target.navigationItem.rightBarButtonItem;
    
    [rightButton tapBarButtonItem];
    XCTAssertEquals(nil, nil, @"Hello there");
}

@end
