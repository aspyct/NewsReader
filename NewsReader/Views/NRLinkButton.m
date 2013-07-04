//
//  NRLinkButton.m
//  NewsReader
//
//  Created by Antoine d Otreppe on 04/07/13.
//  Copyright (c) 2013 Aspyct. All rights reserved.
//

#import "NRLinkButton.h"

@implementation NRLinkButton

- (void)awakeFromNib {
    [self addTarget:self action:@selector(openLink:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)openLink:(id)sender {
    if (sender == self) {
        NSURL *url = [NSURL URLWithString:self.url];
        [[UIApplication sharedApplication] openURL:url];
    }
}

@end
