//
//  LinkLabel.m
//  Slide My Life
//
//  Created by Rohan Kapur on 27/4/13.
//  Copyright (c) 2013 Rohan Kapur. All rights reserved.
//

#import "LinkLabel.h"

@implementation LinkLabel

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder: aDecoder];
    
    if (self) {
        
        self.textColor = [UIColor colorWithRed: 57.0f/255.0f green: 167.0f/255.0f blue:1.0f alpha: 1.0f];
    }
    
    return self;
}

@end
