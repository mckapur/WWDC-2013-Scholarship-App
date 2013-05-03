//
//  Age.m
//  Slide My Life
//
//  Created by user on 30/4/13.
//  Copyright (c) 2013 Rohan Kapur. All rights reserved.
//

#import "Age.h"

#define BIRTHDAY_STRING @"7:00 PM - 18 - 02 - 1999"

@implementation Age
@synthesize birthday;

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder: aDecoder]) {
        
        self.SlideID = [NSString stringWithFormat: @"%@", WHO_I_AM_SLIDE_AGE_SLIDE];
        self.isMasterSlide = NO;
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"HH:mm a - dd - MM - yyyy"];

        self.birthday = [dateFormatter dateFromString: BIRTHDAY_STRING];
        
        [[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(refreshAge) userInfo:nil repeats: YES] fire];
        
        for (UIView *view in self.subviews) {
            
            if ([view isKindOfClass: [UILabel class]]) {
                
                ((UILabel *)view).font = [UIFont fontWithName:@"Gotham Book" size: 29.0];
                
                if ([[((UILabel *)view) text] isEqualToString: @"OLD."]) {
                    
                    ((UILabel *)view).font = [UIFont fontWithName:@"Gotham Bold" size: 70.0];
                }
            }
        }
    }
    
    return self;
}

- (void)refreshAge {
    
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorianCalendar
                            components:NSSecondCalendarUnit |NSMinuteCalendarUnit | NSHourCalendarUnit | NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit
                            fromDate:birthday
                            toDate:[NSDate date]
                            options: 0];
    
    [self.years setText: [NSString stringWithFormat:@"I'm %i years", [components year]]];
    [self.months setText: [NSString stringWithFormat: @"%i months", [components month]]];
    [self.days setText: [NSString stringWithFormat: @"%i days", [components day]]];
    [self.hours setText: [NSString stringWithFormat: @"%i hours", [components hour]]];
    [self.minutes setText: [NSString stringWithFormat: @"%i minutes", [components minute]]];
    [self.seconds setText: [NSString stringWithFormat: @"%i seconds", [components second]]];
}

@end
