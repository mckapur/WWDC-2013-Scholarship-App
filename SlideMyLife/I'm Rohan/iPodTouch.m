//
//  iPodTouch.m
//  Slide My Life
//
//  Created by user on 1/5/13.
//  Copyright (c) 2013 Rohan Kapur. All rights reserved.
//

#import "iPodTouch.h"

@implementation iPodTouch

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder: aDecoder]) {
        
        self.SlideID = [NSString stringWithFormat: @"%@", LOVE_FOR_APPLE_IPOD_TOUCH_SLIDE];
        self.isMasterSlide = NO;
        
        for (UILabel *label in self.subviews) {
            
            if ([label isKindOfClass: [UILabel class]]) {
                
                label.font = [UIFont fontWithName:@"Gotham Light" size: 15.0f];
            }
        }
    }
    
    return self;
}

@end
