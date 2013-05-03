//
//  MulticulturalEh.m
//  Slide My Life
//
//  Created by user on 1/5/13.
//  Copyright (c) 2013 Rohan Kapur. All rights reserved.
//

#import "MulticulturalEh.h"

@implementation MulticulturalEh

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder: aDecoder]) {
        
        self.SlideID = [NSString stringWithFormat: @"%@", WHO_I_AM_SLIDE_MULTICULTURAL_EH_SLIDE];
        self.isMasterSlide = NO;
        
        for (UILabel *label in self.subviews) {
            
            if ([label isKindOfClass: [UILabel class]]) {
                
                label.font = [UIFont fontWithName:@"Futura-Bold" size: 40.0f];
                label.textColor = [UIColor whiteColor];
                label.text = @"Pretty\n\nmulticultural,\n\neh?";
            }
        }
    }
    
    return self;
}

@end
