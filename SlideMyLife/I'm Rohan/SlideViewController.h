//
//  RohanViewController.h
//  I'm Rohan
//
//  Created by Rohan Kapur on 27/4/13.
//  Copyright (c) 2013 Rohan Kapur. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Slide.h"

@interface SlideViewController : UIViewController <SlideDelegate, UIScrollViewDelegate>
{
    NSMutableArray *slides;
}

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property (nonatomic, retain) Slide *slide;
@property (nonatomic) int slideCount;

@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;

@end
