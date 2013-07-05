//
//  UIControl+Manipulate.m
//  NewsReader
//
//  Created by Antoine d Otreppe on 05/07/13.
//  Copyright (c) 2013 Aspyct. All rights reserved.
//

#import "UIControl+Manipulate.h"

@implementation UIControl (Manipulate)

- (void)tapControl {
    [self sendActionsForControlEvents:UIControlEventTouchUpInside];
}

@end
