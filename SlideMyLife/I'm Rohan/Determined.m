//
//  Determined.m
//  Slide My Life
//
//  Created by user on 1/5/13.
//  Copyright (c) 2013 Rohan Kapur. All rights reserved.
//

#import "Determined.h"

@implementation Determined

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder: aDecoder]) {
        
        self.SlideID = [NSString stringWithFormat: @"%@", A_CODER_WAS_BORN_DETERMINED_SLIDE];
        self.isMasterSlide = NO;
        
        for (UILabel *label in self.subviews) {
            
            if ([label isKindOfClass: [UILabel class]]) {
                
                label.font = [UIFont fontWithName:@"Futura-Bold" size: 45.0f];
                label.text = @"I was\n\ndetermined\n\nto know it\n\nall. This\n\nwas going\n\nto become\n\nmy life.";
            }
        }
    }
    
    return self;
}

@end
