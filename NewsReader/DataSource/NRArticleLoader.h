//
//  NRArticleLoader.h
//  NewsReader
//
//  Created by Antoine d Otreppe on 04/07/13.
//  Copyright (c) 2013 Aspyct. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NRArticleLoader <NSObject>

- (void)fillArticle:(NRArticle *)article success:(void (^)())success failure:(void (^)())failure;

@end
