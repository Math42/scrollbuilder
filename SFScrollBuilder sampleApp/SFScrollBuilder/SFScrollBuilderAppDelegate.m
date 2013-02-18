//
//  SFScrollBuilderAppDelegate.m
//  SFScrollBuilder
//
//  Created by Mathias on 15/02/13.
//  Copyright (c) 2013 Mathias. All rights reserved.
//

#import "SFScrollBuilderAppDelegate.h"
#import "SFScrollBuilder.h"

@implementation SFScrollBuilderAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //sub views size
    viewWidth = 250;
    viewHeight = 280;
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];


    CGRect scrollBuilderBounds = CGRectMake(0,
                                            (self.window.bounds.size.height-viewHeight)/2,
                                            self.window.bounds.size.width,
                                            viewHeight);
    
    //Init the view that contains the ScrollView
    SFScrollBuilder *scrollBuilder = [[SFScrollBuilder alloc]initWithFrame:scrollBuilderBounds];
    [scrollBuilder setSubViews:[self generateViews]];
    
    self.window.backgroundColor = [UIColor grayColor];
    [self.window addSubview:scrollBuilder];
    [self.window makeKeyAndVisible];
    return YES;
}

-(NSMutableArray *)generateViews {
    NSMutableArray *views = [[NSMutableArray alloc] init];
    
    CGRect viewBounds = CGRectMake(0, 0, viewWidth, viewHeight);
    
    NSArray *colors = @[ [UIColor blueColor],
                         [UIColor redColor],
                         [UIColor brownColor],
                         [UIColor blackColor],
                         [UIColor yellowColor]];
    
    for (UIColor *color in colors) {
        UIView *view = [[UIView alloc] initWithFrame:viewBounds];
        [view setBackgroundColor:color];
        [views addObject:view];
        
        //Adding a label on the bottom
        int textHeight = 20;
        CGRect bounds = [view bounds];
        bounds.origin.y = viewBounds.size.height-textHeight;
        bounds.size.height = textHeight;
        UILabel *title = [[UILabel alloc] initWithFrame:bounds];
        title.text = @"View Title";
        [title setTextAlignment:NSTextAlignmentCenter];
        [view addSubview:title];
        
    }
    
    
    return views;
}

@end
