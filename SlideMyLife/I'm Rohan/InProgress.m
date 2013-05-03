//
//  InProgress.m
//  Slide My Life
//
//  Created by user on 2/5/13.
//  Copyright (c) 2013 Rohan Kapur. All rights reserved.
//

#import "InProgress.h"

@implementation InProgress

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder: aDecoder]) {
        
        self.SlideID = [NSString stringWithFormat: @"%@", PROJECTS_INPROGRESS_SLIDE];
        self.isMasterSlide = NO;
        
        for (UILabel *label in self.subviews) {
            
            if ([label isKindOfClass: [UILabel class]]) {
                
                if (label.tag == 1) {
                    
                    label.font = [UIFont fontWithName:@"Futura-Bold" size: 30.0f];
                }
                else {
                    
                    label.font = [UIFont fontWithName:@"Gotham Light" size: 15.0f];
                }
            }
        }
        
        for (UIImageView *imageView in self.subviews) {
            
            if ([imageView isKindOfClass: [UIImageView class]]) {
                
                if (imageView.tag != 1) {
                    
                    imageView.layer.cornerRadius = 15.0f;
                    imageView.layer.masksToBounds = YES;
                }
            }
        }
    }
    
    return self;
}

@end
