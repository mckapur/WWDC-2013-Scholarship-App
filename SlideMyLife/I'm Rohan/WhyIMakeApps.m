//
//  WhyIMakeApps.m
//  Slide My Life
//
//  Created by user on 3/5/13.
//  Copyright (c) 2013 Rohan Kapur. All rights reserved.
//

#import "WhyIMakeApps.h"

@implementation WhyIMakeApps

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder: aDecoder]) {
        
        self.SlideID = [NSString stringWithFormat: @"%@", WHYIMAKEAPPS_SLIDE];
        self.isMasterSlide = YES;
        
        for (UILabel *label in self.subviews) {
            
            if ([label isKindOfClass: [UILabel class]]) {
                                
                if (label.tag == 1) {
                    
                    label.font = [UIFont fontWithName:@"Futura-Bold" size: 25.0f];
                }
                else if (label.tag == 2) {
                    
                    label.font = [UIFont fontWithName:@"Gotham Book" size: 18.0f];
                }
                else {
                    
                    label.font = [UIFont fontWithName:@"Gotham Book" size: 15.0f];
                }
            }
        }
    }
    
    return self;
}

- (IBAction)website {
    
    [self.delegate presentWeb: @"http://rohankapur.com"];
}

@end
