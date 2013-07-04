//
//  NRArticle.h
//  NewsReader
//
//  Created by Antoine d Otreppe on 04/07/13.
//  Copyright (c) 2013 Aspyct. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NRArticle : NSObject

@property NSString *title;
@property NSString *excerpt;
@property NSString *publishDate; // TODO not nice to have a string for a date
@property NSString *body;

+ (NRArticle *)articleFromDict:(NSDictionary *)dict;

@end
