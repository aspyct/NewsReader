//
//  NRDetailViewController.h
//  NewsReader
//
//  Created by Antoine d Otreppe on 04/07/13.
//  Copyright (c) 2013 Aspyct. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NRArticle.h"

@interface NRDetailViewController : UIViewController

@property (strong, nonatomic) NRArticle *article;

@end
