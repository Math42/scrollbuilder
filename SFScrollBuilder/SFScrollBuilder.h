//
//  SFScrollBuilder.h
//  SFScrollBuilder
//
//  Created by Mathias on 15/02/13.
//  Copyright (c) 2013 Mathias. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SFScrollBuilder : UIView <UIScrollViewDelegate>
{
    UIScrollView *scrollView;
    UIPageControl *pageControl;
    int widthBetweenViews;
    NSInteger actualPage;
    
}

@property(nonatomic) NSMutableArray *subViews;

-(void)updateView;
@end
