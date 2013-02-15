//
//  SFScrollContent.m
//  SFScrollBuilder
//
//  Created by Mathias on 15/02/13.
//  Copyright (c) 2013 Mathias. All rights reserved.
//

#import "SFScrollContent.h"

@implementation SFScrollContent

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        int textHeight = 20;
        
        //Adding a label on the bottom
        CGRect bounds = [self bounds];
        bounds.origin.y = frame.size.height-textHeight;
        bounds.size.height = textHeight;
        UILabel *title = [[UILabel alloc] initWithFrame:bounds];
        title.text = @"View Title";
        [title setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:title];
    }
    return self;
}

@end
