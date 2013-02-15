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

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //sub views size
    viewWidth = 250;
    viewHeight = 280;
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor grayColor];
    
    //ScrollView's Frame
    CGRect scrollBuilderBounds = CGRectMake(0, (self.window.bounds.size.height-viewHeight)/2, self.window.bounds.size.width, viewHeight);
    
    //Init the view that contains the ScrollView
    SFScrollBuilder *scrollBuilder = [[SFScrollBuilder alloc]initWithFrame:scrollBuilderBounds];
    [scrollBuilder setSubViews:[self generateViews]]; // Add sub views
    [[self window] addSubview:scrollBuilder];
    
    [self.window makeKeyAndVisible];
    return YES;
}

-(NSMutableArray *)generateViews
{
    NSMutableArray *tabView = [[NSMutableArray alloc]init];
    
    //Init rect of views
    CGRect viewBounds = CGRectMake(0, 0, viewWidth, viewHeight);
    
    //View 1
    SFScrollContent *view = [[SFScrollContent alloc] initWithFrame:viewBounds];
    [view setBackgroundColor:[UIColor blueColor]];
    [tabView addObject:view];
    
    //View 2
    view = [[SFScrollContent alloc] initWithFrame:viewBounds];
    [view setBackgroundColor:[UIColor redColor]];
    [tabView addObject:view];
    
    //View 3
    view = [[SFScrollContent alloc] initWithFrame:viewBounds];
    [view setBackgroundColor:[UIColor brownColor]];
    [tabView addObject:view];
    
    //View 4
    view = [[SFScrollContent alloc] initWithFrame:viewBounds];
    [view setBackgroundColor:[UIColor blackColor]];
    [tabView addObject:view];
    
    //View 5
    view = [[SFScrollContent alloc] initWithFrame:viewBounds];
    [view setBackgroundColor:[UIColor yellowColor]];
    [tabView addObject:view];
    
    return tabView;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
