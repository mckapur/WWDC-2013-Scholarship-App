//
//  Slide.h
//  Slide My Life
//
//  Created by Rohan Kapur on 27/4/13.
//  Copyright (c) 2013 Rohan Kapur. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <QuartzCore/QuartzCore.h>

#import "SlideAppDelegate.h"

@protocol SlideDelegate <NSObject>

- (void)presentWeb: (NSString *)link;

@end

@interface Slide : UIView

@property (nonatomic, retain) NSString *SlideID;
@property (nonatomic) BOOL isMasterSlide;

@property (nonatomic, retain) id<SlideDelegate> delegate;

@end
