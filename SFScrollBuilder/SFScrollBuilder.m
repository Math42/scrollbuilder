//
//  SFScrollBuilder.m
//  SFScrollBuilder
//
//  Created by Mathias on 15/02/13.
//  Copyright (c) 2013 Mathias. All rights reserved.
//

#import "SFScrollBuilder.h"
#import "SFScrollContent.h"

@implementation SFScrollBuilder

@synthesize subViews;


-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        widthBetweenViews = 10;
        currentPage = 0;
    }
    return self;
}

/*
 Method who get scroll event in the view
 Used to allow scroll on each side of the ScrollView
 */
- (UIView *) hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if ([self pointInside:point withEvent:event]) {
        //if event is in the view, forward it to the ScrollView
        return scrollView;
    }
    return nil;
}

/*
 Called when ScrollView get scroll event
 Used to update the PageControl
 */
- (void)scrollViewDidScroll:(UIScrollView *)scroll {
    NSInteger page = lround(scroll.contentOffset.x / scroll.frame.size.width);
    if (currentPage != page) {
        currentPage = page;
        
        //Update PageControl
        [pageControl setCurrentPage:currentPage];
    }
}

/*
 Called when the view receive a tap event
 Used to catch tap on subViews
 */
- (void)singleTapGestureCaptured:(UITapGestureRecognizer *)gesture {
    CGPoint touchPoint = [gesture locationInView:scrollView];
    
    //If the tap is on the actual view
    if(CGRectContainsPoint([[subViews objectAtIndex:currentPage] frame],touchPoint)){
        NSLog(@"Tap on view : %d",currentPage);
    }
}

/*
 Used to update de view with the array of sub views (subViews)
 */
-(void)updateView
{
    //if at least one view
    if (subViews && [subViews count] > 0){
        float viewWidth = [[subViews objectAtIndex:0] bounds].size.width;
        float viewHeight = [[subViews objectAtIndex:0] bounds].size.height;
        
        //Init ScrollView
        //Center it and giving it the size of one view + the space between two views so you get the right paging
        CGRect screenRect = CGRectMake((self.bounds.size.width - viewWidth - widthBetweenViews) / 2.0,
                                       0,
                                       viewWidth + widthBetweenViews,
                                       viewHeight);
        scrollView = [[UIScrollView alloc] initWithFrame:screenRect];
        
        //Total size of the scrollable world => needed for the paging
        CGSize size = CGSizeMake([subViews count]*(viewWidth+widthBetweenViews), viewHeight);
        [scrollView setContentSize:size];
        
        //Hide scroll indicator
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.showsVerticalScrollIndicator = NO;
        
        //Add a listener for tap event
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                    action:@selector(singleTapGestureCaptured:)];
        [scrollView addGestureRecognizer:singleTap];
        
        //Add view
        [scrollView setDelegate:self];
        [self addSubview:scrollView];
        
        //Position for the next view in x axis
        float nextPosition = 0; //Center first element because scrollView is center
        
        //Adding of every sub view in subViews
        for(UIView *currentView in subViews){
            //Get the frame
            screenRect = [currentView frame];
            
            //set the right x position
            screenRect.origin.x = nextPosition;
            [currentView setFrame:screenRect] ;
            
            //Add view
            [scrollView addSubview:currentView];
            
            //Prepare position of next view
            nextPosition+= viewWidth + widthBetweenViews;
        }
        
        //Allow to see next and previous view on each side of scrollView
        scrollView.clipsToBounds = NO;
        
        //Activate paging
        [scrollView setPagingEnabled:YES];
        
        //Add of PageControl
        CGRect rectPageControl = CGRectMake(0, viewHeight, self.bounds.size.width, 60);
        pageControl = [[UIPageControl alloc] initWithFrame:rectPageControl];
        [pageControl setNumberOfPages:[subViews count]];
        [self addSubview:pageControl];
    }
}

/*
 Used to update view when an array of sub view is received
 */
-(void)setSubViews:(NSMutableArray *)subViewsArray
{
    subViews = subViewsArray;
    [self updateView];
}

@end
