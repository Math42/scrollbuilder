//
//  SFScrollBuilderAppDelegate.m
//  SFScrollBuilder
//
//  Created by Mathias on 15/02/13.
//  Copyright (c) 2013 Mathias. All rights reserved.
//

#import "SFScrollBuilderAppDelegate.h"
#import "SFScrollContent.h"
#import "SFScrollBuilder.h"

@implementation SFScrollBuilderAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //sub views size
    viewWidth = 250;
    viewHeight = 280;
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor grayColor];
    
    //ScrollView's Frame
    CGRect scrollBuilderBounds = CGRectMake(0,
                                            (self.window.bounds.size.height-viewHeight)/2,
                                            self.window.bounds.size.width,
                                            viewHeight);
    
    //Init the view that contains the ScrollView
    SFScrollBuilder *scrollBuilder = [[SFScrollBuilder alloc]initWithFrame:scrollBuilderBounds];
    [scrollBuilder setSubViews:[self generateViews]];
    [[self window] addSubview:scrollBuilder];
    
    [self.window makeKeyAndVisible];
    return YES;
}

-(NSMutableArray *)generateViews {
    NSMutableArray *views = [[NSMutableArray alloc] init];
    
    //Init rect of views
    CGRect viewBounds = CGRectMake(0, 0, viewWidth, viewHeight);
    
    NSArray *colors = @[ [UIColor blueColor],
                         [UIColor redColor],
                         [UIColor brownColor],
                         [UIColor blackColor],
                         [UIColor yellowColor]];
    
    for (UIColor *color in colors) {
        SFScrollContent *view = [[SFScrollContent alloc] initWithFrame:viewBounds];
        [view setBackgroundColor:color];
        [views addObject:view];
    }
    
    
    return views;
}

@end
