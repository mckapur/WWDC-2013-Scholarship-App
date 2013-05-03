//
//  OnTheStore.m
//  Slide My Life
//
//  Created by user on 2/5/13.
//  Copyright (c) 2013 Rohan Kapur. All rights reserved.
//

#import "OnTheStore.h"

@implementation OnTheStore

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder: aDecoder]) {
        
        self.SlideID = [NSString stringWithFormat: @"%@", PROJECTS_ONTHESTORE_SLIDE];
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
                    
                    imageView.layer.cornerRadius = 16.0f;
                    imageView.layer.masksToBounds = YES;
                }
            }
        }
    }
    
    return self;
}

- (IBAction)trvlogue {
    
    [self.delegate presentWeb: @"http://trvlogue.com"];
}

- (IBAction)IB {
    
    [self.delegate presentWeb: @"https://itunes.apple.com/sg/app/ib-asia-pacific-conference/id507988688?mt=8"];
}

- (IBAction)icab2go {
    
    [self.delegate presentWeb: @"http://itunes.com/apps/icab2go"];
}

@end
