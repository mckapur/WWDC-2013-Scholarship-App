//
//  WWDCWhy.m
//  Slide My Life
//
//  Created by user on 2/5/13.
//  Copyright (c) 2013 Rohan Kapur. All rights reserved.
//

#import "WWDCWhy.h"

@implementation WWDCWhy

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder: aDecoder]) {
        
        self.SlideID = [NSString stringWithFormat: @"%@", WWDC_WWDCWHY_SLIDE];
        self.isMasterSlide = NO;
    }
    
    for (UILabel *label in self.subviews) {
        
        if ([label isKindOfClass: [UILabel class]]) {
            
            if (label.tag == 1) {
                
                label.font = [UIFont fontWithName:@"Futura-Bold" size: 30.0f];
            }
            else {
                
                label.font = [UIFont fontWithName:@"Gotham Light" size: 15.0f];
                
                if (label.tag == 2) {
                    
                    label.font = [UIFont fontWithName:@"Gotham Bold" size: 25.0f];
                }
            }
        }
    }
    
    for (UIImageView *imageView in self.subviews) {
        
        if ([imageView isKindOfClass: [UIImageView class]]) {
            
            if (imageView.tag != 1) {
                
                imageView.layer.cornerRadius = 30.0f;
                
                imageView.layer.borderWidth = 2.0f;
                imageView.layer.borderColor = (__bridge CGColorRef)([UIColor whiteColor]);
                
                imageView.layer.masksToBounds = YES;
            }
        }
    }

    return self;
}

- (IBAction)lenny {
    
    [self.delegate presentWeb: @"http://twitter.com/lennykhazan"];
}

- (IBAction)coulton {
    
    [self.delegate presentWeb: @"http://twitter.com/coultonvento"];
}

- (IBAction)patrick {
    
    [self.delegate presentWeb: @"http://twitter.com/balestrapatrick"];
}

- (IBAction)midas {
    
    [self.delegate presentWeb: @"http://twitter.com/midaskwant"];
}

@end
