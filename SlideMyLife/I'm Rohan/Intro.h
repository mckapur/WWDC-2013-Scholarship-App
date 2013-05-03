//
//  Intro.h
//  Slide My Life
//
//  Created by Rohan Kapur on 27/4/13.
//  Copyright (c) 2013 Rohan Kapur. All rights reserved.p
//

#import <UIKit/UIKit.h>

#import "Slide.h"

#import "LinkLabel.h"

@interface Intro : Slide

- (IBAction)wwdc2013Hashtag;

@property (strong, nonatomic) IBOutlet LinkLabel *hashtagLabel;

@end
