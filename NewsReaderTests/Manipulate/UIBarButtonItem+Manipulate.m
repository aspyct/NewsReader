//
//  UIBarButtonItem+Manipulate.m
//  NewsReader
//
//  Created by Antoine d Otreppe on 05/07/13.
//  Copyright (c) 2013 Aspyct. All rights reserved.
//

#import "UIBarButtonItem+Manipulate.h"

@implementation UIBarButtonItem (Manipulate)

- (void)tapBarButtonItem {
    [self.target performSelector:self.action withObject:self];
}

@end
