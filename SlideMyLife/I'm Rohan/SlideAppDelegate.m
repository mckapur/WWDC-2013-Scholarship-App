//
//  RohanAppDelegate.m
//  I'm Rohan
//
//  Created by Rohan Kapur on 27/4/13.
//  Copyright (c) 2013 Rohan Kapur. All rights reserved.
//

#import "SlideAppDelegate.h"

#import "SlideViewController.h"

@implementation SlideAppDelegate
@synthesize window, viewController, navigationController, slideIDs;

- (void)addSlideIDs {
    
    self.slideIDs = [[NSMutableArray alloc] init];
    
    [slideIDs addObject: INTRO_SLIDE];
    [slideIDs addObject: WHO_I_AM_SLIDE];
    [slideIDs addObject: WHO_I_AM_SLIDE_AGE_SLIDE];
    [slideIDs addObject: WHO_I_AM_SLIDE_NATIONALITY_SLIDE];
    [slideIDs addObject: WHO_I_AM_SLIDE_MULTICULTURAL_EH_SLIDE];
    [slideIDs addObject: LOVE_FOR_APPLE_SLIDE];
    [slideIDs addObject: LOVE_FOR_APPLE_IPOD_NANO_SLIDE];
    [slideIDs addObject: LOVE_FOR_APPLE_IPOD_TOUCH_SLIDE];
    [slideIDs addObject: LOVE_FOR_APPLE_IPHONEIMAC_SLIDE];
    [slideIDs addObject: A_CODER_WAS_BORN_SLIDE];
    [slideIDs addObject: A_CODER_WAS_BORN_DOWNLOADEDXCODE_SLIDE];
    [slideIDs addObject: A_CODER_WAS_BORN_ROHAN_QUOTE_SLIDE];
    [slideIDs addObject: A_CODER_WAS_BORN_WANTEDTOLEARNCODE_SLIDE];
    [slideIDs addObject: A_CODER_WAS_BORN_LEARNING_SLIDE];
    [slideIDs addObject: A_CODER_WAS_BORN_DETERMINED_SLIDE];
    [slideIDs addObject: PROJECTS_SLIDE];
    [slideIDs addObject: PROJECTS_ONTHESTORE_SLIDE];
    [slideIDs addObject: PROJECTS_INPROGRESS_SLIDE];
    [slideIDs addObject: PROJECTS_EXPERIMENTS_SLIDE];
    [slideIDs addObject: WWDC_SLIDE];
    [slideIDs addObject: WWDC_WWDCTWEETS_SLIDE];
    [slideIDs addObject: WWDC_WWDCEMAIL_SLIDE];
    [slideIDs addObject: WWDC_WWDCWHY_SLIDE];
    [slideIDs addObject: WHYIMAKEAPPS_SLIDE];
    [slideIDs addObject: THINKDIFFERENT_SLIDE];
    
    if (!IS_IPHONE_5) {
        
        NSMutableArray *newSlideIDs = [[NSMutableArray alloc] init];
        
        for (int i = 0; i <= slideIDs.count - 1; i++) {
            
            [newSlideIDs addObject: [slideIDs[i] stringByAppendingString:@"_4S"]];
        }
             
        slideIDs = newSlideIDs;
    }
    
}

#pragma mark SlideToUnlock Delegate

- (void)completed {
    
    SlideViewController *rohanViewController = [[SlideViewController alloc] init];

    if (!IS_IPHONE_5) {
        
        rohanViewController = [[SlideViewController alloc] initWithNibName:@"SlideViewController_4S" bundle: nil];
    }
    
    [self.navigationController pushViewController:rohanViewController animated: YES];
}

#pragma mark States

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self addSlideIDs];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    self.viewController = [[SlideToUnlockViewController alloc] initWithDelegate: self];
    
    if (!IS_IPHONE_5) {
        
        self.viewController = [[SlideToUnlockViewController alloc] initWithNibName:@"SlideToUnlockViewController_4S" bundle: nil];
        
        self.viewController.delegate = self;
    }
    
    self.navigationController = [[UINavigationController alloc] init];
    [navigationController setNavigationBarHidden: YES];

    navigationController.viewControllers = @[self.viewController];

    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    
    return YES;
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
