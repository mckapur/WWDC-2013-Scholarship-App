//
//  SlideToUnlockViewController.h
//  I'm Rohan
//
//  Created by Rohan Kapur on 27/4/13.
//  Copyright (c) 2013 Rohan Kapur. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SlideToUnlockDelegate <NSObject>

- (void)completed;

@end

@interface SlideToUnlockViewController : UIViewController
{
    UIImageView *slideToUnlock_Background;
    
	UISlider *slideToUnlock_Slider;
        
	NSTimer *animation_Timer;
    int animation_TimerCount;
    
	BOOL touchIsDown;
    
	CGFloat gradientLocations[3];
}

@property (nonatomic, retain) id <SlideToUnlockDelegate> delegate;

@property (nonatomic, retain) UILabel *slideToUnlock_Label;

- (id)initWithDelegate: (id<SlideToUnlockDelegate>)delegate;

@end
