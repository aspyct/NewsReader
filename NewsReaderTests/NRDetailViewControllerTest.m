//
//  NRDetailViewControllerTest.m
//  NewsReader
//
//  Created by Antoine d Otreppe on 05/07/13.
//  Copyright (c) 2013 Aspyct. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NRDetailViewController.h"

@interface NRDetailViewControllerTest : XCTestCase

@property UINavigationController *navController;
@property NRDetailViewController *target;

@end

@implementation NRDetailViewControllerTest

- (void)setUp
{
    [super setUp];
    
    self.target = [[NRDetailViewController alloc] init];
    self.target.article = 
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testExample
{
    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

- (void)testRightNavButtonShouldOpenActivitySheet {
    
}

@end
