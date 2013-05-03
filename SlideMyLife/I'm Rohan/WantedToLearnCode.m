//
//  WantedToLearnCode.m
//  Slide My Life
//
//  Created by user on 3/5/13.
//  Copyright (c) 2013 Rohan Kapur. All rights reserved.
//

#import "WantedToLearnCode.h"

@implementation WantedToLearnCode

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder: aDecoder]) {
        
        self.SlideID = [NSString stringWithFormat: @"%@", A_CODER_WAS_BORN_WANTEDTOLEARNCODE_SLIDE];
        self.isMasterSlide = NO;
        
        for (UILabel *label in self.subviews) {
            
            if ([label isKindOfClass: [UILabel class]]) {
                
                label.font = [UIFont fontWithName:@"Futura-Bold" size: 40.0f];
                
                label.text = @"It was love\n\nat first site,\n\nI knew I\n\nwanted to do\n\niOS\n\ndevelopment.\n\nSo, I started to\n\nlearn.";
            }
        }
    }
    
    return self;
}

@end
