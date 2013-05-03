//
//  Age.h
//  Slide My Life
//
//  Created by user on 30/4/13.
//  Copyright (c) 2013 Rohan Kapur. All rights reserved.
//

#import "Slide.h"

@interface Age : Slide

@property (nonatomic, retain) NSDate *birthday;

@property (weak, nonatomic) IBOutlet UILabel *years;
@property (weak, nonatomic) IBOutlet UILabel *months;
@property (weak, nonatomic) IBOutlet UILabel *days;
@property (weak, nonatomic) IBOutlet UILabel *hours;
@property (weak, nonatomic) IBOutlet UILabel *minutes;
@property (weak, nonatomic) IBOutlet UILabel *seconds;

@end
