//
//  ACoderWasBorn.m
//  Slide My Life
//
//  Created by user on 1/5/13.
//  Copyright (c) 2013 Rohan Kapur. All rights reserved.
//

#import "ACoderWasBorn.h"

@implementation ACoderWasBorn

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder: aDecoder]) {
        
        self.SlideID = [NSString stringWithFormat: @"%@", A_CODER_WAS_BORN_SLIDE];
        self.isMasterSlide = YES;
    }
    
    return self;
}

@end
