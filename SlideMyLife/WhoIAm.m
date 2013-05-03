//
//  Age.m
//  Slide My Life
//
//  Created by Rohan Kapur on 28/4/13.
//  Copyright (c) 2013 Rohan Kapur. All rights reserved.
//

#import "WhoIAm.h"

@implementation WhoIAm

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder: aDecoder]) {
        
        self.SlideID = [NSString stringWithFormat: @"%@", WHO_I_AM_SLIDE];
        self.isMasterSlide = YES;
    }
    
    return self;
}

@end
