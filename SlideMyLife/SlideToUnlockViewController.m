//
//  SlideToUnlockViewController.m
//  I'm Rohan
//
//  Created by Rohan Kapur on 27/4/13.
//  Copyright (c) 2013 Rohan Kapur. All rights reserved.
//

#import "SlideToUnlockViewController.h"

#import <QuartzCore/QuartzCore.h>

@interface SlideToUnlockViewController ()

@end

static const CGFloat gradientWidth = 0.2;
static const CGFloat gradientDimAlpha = 0.5;
static const int animation_FramesPerSec = 8;

@implementation SlideToUnlockViewController

@synthesize delegate, slideToUnlock_Label;

#pragma mark Slider Actions/Events

- (void)sliderUp:(UISlider *)sender
{	
    if (touchIsDown) {
        
        touchIsDown = NO;
		
		if (slideToUnlock_Slider.value != 1.0)
		{
			[slideToUnlock_Slider setValue: 0 animated: YES];
			
            slideToUnlock_Label.alpha = 1.0;
			
            [self startTimer];
        }
		else {

            [self.delegate completed];
		}
	}
}

- (void)sliderDown:(UISlider *) sender
{
	touchIsDown = YES;
}

- (void)sliderChanged:(UISlider *) sender
{
	slideToUnlock_Label.alpha = MAX(0.0, 1.0 - (slideToUnlock_Slider.value * 3.5));
	
	if (slideToUnlock_Slider.value != 0) {
		
        [self stopTimer];
        
		[slideToUnlock_Label.layer setNeedsDisplay];
	}
}

#pragma mark Label Rendering (OpenSourced Text Rendering Method)

- (UILabel *)slideToUnlock_Label {

	(void)[self view];
	
	return slideToUnlock_Label;
}

- (void)drawLayer:(CALayer *)theLayer
        inContext:(CGContextRef)theContext
{
    const char *labelFontName = [slideToUnlock_Label.font.fontName UTF8String];
	
	CGContextSelectFont(theContext, labelFontName, slideToUnlock_Label.font.pointSize, kCGEncodingMacRoman);
    
	CGAffineTransform xform = CGAffineTransformMake(1.0,  0.0,
													0.0, -1.0,
													0.0,  0.0);
	CGContextSetTextMatrix(theContext, xform);
	
	CGContextSetTextDrawingMode (theContext, kCGTextClip);
	
	const char *text = [slideToUnlock_Label.text cStringUsingEncoding:NSMacOSRomanStringEncoding];
	CGContextShowTextAtPoint(
                             theContext,
                             0,
                             (size_t)slideToUnlock_Label.font.ascender,
                             text,
                             strlen(text));
    
	CGPoint textEnd = CGContextGetTextPosition(theContext);
	
	CGColorRef textColor = slideToUnlock_Label.textColor.CGColor;
	const CGFloat *components = CGColorGetComponents(textColor);
	size_t numberOfComponents = CGColorGetNumberOfComponents(textColor);
	BOOL isRGB = (numberOfComponents == 4);
	CGFloat red = components[0];
	CGFloat green = isRGB ? components[1] : components[0];
	CGFloat blue = isRGB ? components[2] : components[0];
	CGFloat alpha = isRGB ? components[3] : components[1];
    
	size_t num_locations = 3;

	CGFloat gradientComponents[12];
	for (int row = 0; row < num_locations; row++) {
		int index = 4 * row;
		gradientComponents[index++] = red;
		gradientComponents[index++] = green;
		gradientComponents[index++] = blue;
		gradientComponents[index] = alpha * gradientDimAlpha;
	}
    
	if (animation_Timer) {
		gradientComponents[7] = alpha;
	}
    
	CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
	
	CGGradientRef gradient = CGGradientCreateWithColorComponents (colorspace, gradientComponents,
																  gradientLocations, num_locations);

	CGContextDrawLinearGradient (theContext, gradient, slideToUnlock_Label.bounds.origin, textEnd, 0);
	
	CGGradientRelease(gradient);
	CGColorSpaceRelease(colorspace);
}

#pragma mark Location Updates

- (void)setGradientLocations:(CGFloat)leftEdge {
    
	leftEdge -= gradientWidth;
	
	gradientLocations[0] = leftEdge < 0.0 ? 0.0 : (leftEdge > 1.0 ? 1.0 : leftEdge);
	gradientLocations[1] = MIN(leftEdge + gradientWidth, 1.0);
	gradientLocations[2] = MIN(gradientLocations[1] + gradientWidth, 1.0);
	
	[slideToUnlock_Label.layer setNeedsDisplay];
}

#pragma mark Frames

- (void)startTimer {
    
	if (!animation_Timer) {
        
		animation_TimerCount = 0;
        
		[self setGradientLocations: 0];
        
		animation_Timer = [NSTimer
                           scheduledTimerWithTimeInterval:1.0/animation_FramesPerSec
						   target:self
						   selector:@selector(animationTimerFired:)
						   userInfo:nil
						   repeats:YES];
	}
}

- (void)stopTimer {
    
	if (animation_Timer) {
	
        [animation_Timer invalidate];
		animation_Timer = nil;
	}
}

- (void)animationTimerFired:(NSTimer *)theTimer {
		
    if (++animation_TimerCount == (2 * animation_FramesPerSec)) {
        
        animation_TimerCount = 0;
	}
	
    [self setGradientLocations:((CGFloat)animation_TimerCount/(CGFloat)animation_FramesPerSec)];
}

#pragma mark Initialization

/********************************/

#pragma mark (SUBMARK) UI Rendering

- (void)renderSlideToUnlockUIComponents {
    
	UIImage *trackImage = [UIImage imageNamed:@"sliderTrack.png"];
	slideToUnlock_Background = [[UIImageView alloc] initWithImage:trackImage];

	UIView *view = [[UIView alloc] initWithFrame:slideToUnlock_Background.frame];
	[view addSubview: slideToUnlock_Background];
	
    slideToUnlock_Background.alpha = 0.8;

	slideToUnlock_Slider = [[UISlider alloc] initWithFrame:slideToUnlock_Background.frame];

	CGRect sliderFrame = slideToUnlock_Slider.frame;
	sliderFrame.size.width -= 46; 
	
    slideToUnlock_Slider.frame = sliderFrame;
	slideToUnlock_Slider.center = slideToUnlock_Background.center;
	slideToUnlock_Slider.backgroundColor = [UIColor clearColor];
    
	[slideToUnlock_Slider setMinimumTrackImage:[UIImage imageNamed:@"sliderMaxMin-02.png"] forState:UIControlStateNormal];
	[slideToUnlock_Slider setMaximumTrackImage:[UIImage imageNamed:@"sliderMaxMin-02.png"] forState:UIControlStateNormal];
        
	UIImage *thumbImage = [UIImage imageNamed:@"sliderThumb_Resized.png"];
	[slideToUnlock_Slider setThumbImage:thumbImage forState:UIControlStateNormal];
    
    slideToUnlock_Slider.minimumValue = 0.0;
	slideToUnlock_Slider.maximumValue = 1.0;
	slideToUnlock_Slider.continuous = YES;
	slideToUnlock_Slider.value = 0.0;

	[slideToUnlock_Slider addTarget:self
			   action:@selector(sliderUp:)
	 forControlEvents:UIControlEventTouchUpInside];
	[slideToUnlock_Slider addTarget:self
			   action:@selector(sliderDown:)
	 forControlEvents:UIControlEventTouchDown];
	[slideToUnlock_Slider addTarget:self
			   action:@selector(sliderChanged:)
	 forControlEvents:UIControlEventValueChanged];
    
    NSString *labelText = NSLocalizedString(@"slide my life", @"SlideToUnlock label");
	UIFont *labelFont = [UIFont systemFontOfSize:24];
	CGSize labelSize = [labelText sizeWithFont:labelFont];

	slideToUnlock_Label = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, labelSize.width, labelSize.height)];
	
	CGFloat labelHorizontalCenter = slideToUnlock_Slider.center.x + (thumbImage.size.width / 2);
	slideToUnlock_Label.center = CGPointMake(labelHorizontalCenter, slideToUnlock_Slider.center.y);
	
	slideToUnlock_Label.textColor = [UIColor whiteColor];
	slideToUnlock_Label.textAlignment = NSTextAlignmentCenter;
	slideToUnlock_Label.backgroundColor = [UIColor clearColor];
	slideToUnlock_Label.font = labelFont;
	slideToUnlock_Label.text = labelText;
	[view addSubview: slideToUnlock_Label];
	
	[view addSubview: slideToUnlock_Slider];
    	
	slideToUnlock_Label.layer.delegate = self;
	
	[self.view addSubview: view];
    
    int determinedY = 508;
    
    if (!IS_IPHONE_5) {
        
        determinedY = 420;
    }
    
    view.center = CGPointMake(self.view.center.x, determinedY);
}

/********************************/

- (id)init {
        
    if (self = [super init]) {
        
        slideToUnlock_Slider.value = 0.0;
		slideToUnlock_Label.alpha = 1.0;
		
        touchIsDown = NO;
		
        [self startTimer];
    }
    
    return self;
}

- (id)initWithDelegate:(id<SlideToUnlockDelegate>)_delegate
{    
    if (self = [self init]) {
        
        self.delegate = _delegate;
    }
    
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
        slideToUnlock_Slider.value = 0.0;
		slideToUnlock_Label.alpha = 1.0;
		
        touchIsDown = NO;
		
        [self startTimer];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [self renderSlideToUnlockUIComponents];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear: YES];
    
    [self stopTimer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
