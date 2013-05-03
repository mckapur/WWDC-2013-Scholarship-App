//
//  Experiments.m
//  Slide My Life
//
//  Created by user on 2/5/13.
//  Copyright (c) 2013 Rohan Kapur. All rights reserved.
//

#import "Experiments.h"

@implementation Experiments

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder: aDecoder]) {
        
        self.SlideID = [NSString stringWithFormat: @"%@", PROJECTS_EXPERIMENTS_SLIDE];
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
    }
    
    return self;
}

- (IBAction)leap {
    
    [self.delegate presentWeb: @"http://youtu.be/pEsYEEEbBqQ"];
}

- (IBAction)arduino {
    
    [self.delegate presentWeb: @"http://youtu.be/2p_ROdwFXEM"];
}

@end
