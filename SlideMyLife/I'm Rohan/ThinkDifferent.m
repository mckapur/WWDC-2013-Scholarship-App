//
//  ThinkDifferent.m
//  Slide My Life
//
//  Created by user on 3/5/13.
//  Copyright (c) 2013 Rohan Kapur. All rights reserved.
//

#import "ThinkDifferent.h"

@implementation ThinkDifferent

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder: aDecoder]) {
        
        self.SlideID = [NSString stringWithFormat: @"%@", THINKDIFFERENT_SLIDE];
        self.isMasterSlide = YES;
        
        for (UILabel *label in self.subviews) {
            
            if ([label isKindOfClass: [UILabel class]] && label.tag != 1) {
                
                label.font = [UIFont fontWithName:@"Futura-Bold" size: 30.0f];
            }
        }
    }
    
    return self;
}

- (IBAction)finalmessage {
    
    [self.delegate presentWeb: @"http://youtu.be/i5XQ152t8VI"];
}

@end
