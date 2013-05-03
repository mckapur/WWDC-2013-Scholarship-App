//
//  RohanQuote.m
//  Slide My Life
//
//  Created by user on 1/5/13.
//  Copyright (c) 2013 Rohan Kapur. All rights reserved.
//

#import "RohanQuote.h"

@implementation RohanQuote

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder: aDecoder]) {
        
        self.SlideID = [NSString stringWithFormat: @"%@", A_CODER_WAS_BORN_ROHAN_QUOTE_SLIDE];
        self.isMasterSlide = NO;
        
        for (UILabel *label in self.subviews) {
            
            if ([label isKindOfClass: [UILabel class]]) {
                
                label.font = [UIFont fontWithName:@"Futura-Bold" size: 50.0f];
                label.text = @"\"Woah,\n\nyou can\n\ncreate\n\napps with\n\nthis!?\"";
            }
        }
    }
    
    return self;
}

@end
