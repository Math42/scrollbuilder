//
//  SFScrollBuilderAppDelegate.h
//  SFScrollBuilder
//
//  Created by Mathias on 15/02/13.
//  Copyright (c) 2013 Mathias. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SFScrollBuilderAppDelegate : UIResponder <UIApplicationDelegate>
{
    int viewWidth;
    int viewHeight;
}

@property (strong, nonatomic) UIWindow *window;

-(NSMutableArray *)generateViews;

@end
