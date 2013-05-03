//
//  WWDCEmail.m
//  Slide My Life
//
//  Created by user on 2/5/13.
//  Copyright (c) 2013 Rohan Kapur. All rights reserved.
//

#import "WWDCEmail.h"

@implementation WWDCEmail

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder: aDecoder]) {
        
        self.SlideID = [NSString stringWithFormat: @"%@", WWDC_WWDCEMAIL_SLIDE];
        self.isMasterSlide = NO;
    }
    
    return self;
}

@end
