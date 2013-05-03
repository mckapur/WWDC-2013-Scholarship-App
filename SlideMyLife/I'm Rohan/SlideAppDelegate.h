//
//  RohanAppDelegate.h
//  I'm Rohan
//
//  Created by Rohan Kapur on 27/4/13.
//  Copyright (c) 2013 Rohan Kapur. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SlideToUnlockViewController.h"

@interface SlideAppDelegate : UIResponder <UIApplicationDelegate, SlideToUnlockDelegate>

@property (nonatomic, retain) NSMutableArray *slideIDs;

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) SlideToUnlockViewController *viewController;

@property (strong, nonatomic) UINavigationController *navigationController;

@end
