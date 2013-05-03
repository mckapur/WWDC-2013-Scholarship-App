//
//  Intro.m
//  Slide My Life
//
//  Created by Rohan Kapur on 27/4/13.
//  Copyright (c) 2013 Rohan Kapur. All rights reserved.
//

#import "Intro.h"

@implementation Intro

- (id)initWithCoder:(NSCoder *)aDecoder
{    
    if (self = [super initWithCoder: aDecoder]) {
        
        self.SlideID = [NSString stringWithFormat: @"%@", INTRO_SLIDE];
        self.isMasterSlide = YES;
    }
    
    return self;
}

- (IBAction)wwdc2013Hashtag {

    [self.delegate presentWeb: [NSString stringWithFormat: @"https://twitter.com/search?q=%%23%@&src=typd", [self.hashtagLabel.text stringByReplacingOccurrencesOfString:@"#" withString: @""]]];
}

@end
