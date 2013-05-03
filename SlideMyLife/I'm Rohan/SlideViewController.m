//
//  RohanViewController.m
//  I'm Rohan
//
//  Created by Rohan Kapur on 27/4/13.
//  Copyright (c) 2013 Rohan Kapur. All rights reserved.
//

#import "SlideViewController.h"

#import "WebViewController.h"

#import "TweetTableViewCell.h"


#define NUMBER_OF_TWEETS 25

@interface SlideViewController ()

@end

@implementation SlideViewController
@synthesize scrollView, pageControl, slideCount, slide;

#pragma mark Table View Methods (ONLY FOR WWDCTWEETS)

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 56;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return NUMBER_OF_TWEETS;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"TweetTableViewCell";
    
    TweetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: CellIdentifier];
    
    if (cell == nil) {
        
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"TweetTableViewCell" owner:self options:nil];
        
        for (UIView *view in views) {
            
            if([view isKindOfClass:[UITableViewCell class]])
            {
                cell = (TweetTableViewCell *)view;
            }
        }
    }
    
    if (cell) {
        
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.tweetImage.image = [UIImage imageNamed: [NSString stringWithFormat: @"wwdc_%i", (indexPath.row + 1)]];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated: YES];
}


#pragma mark Slide Delegate

- (void)presentWeb:(NSString *)link {
    
    WebViewController *webViewController = [[WebViewController alloc] initWithLink: link];
    [self.navigationController pushViewController:webViewController animated: YES];
}

#pragma mark UIScrollView Delegate

- (void)scrollViewDidScroll:(UIScrollView *)sender {

    CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;

    int newPage = self.pageControl.currentPage;

    if (page > self.slideCount - 1) {

        self.slideCount++;
        newPage++;

        [self registerNewSlideWithIndex: self.slideCount];
        
        self.slide = ((Slide *)slides[self.slideCount - 1]);
        self.slide.delegate = self;
        
        [self drawSlide: slideCount];
    }
    else if (page < self.slideCount - 1) {
        
        self.slideCount--;
        newPage--;
        
        self.slide = ((Slide *)slides[self.slideCount - 1]);
        self.slide.delegate = self;
    }

    if (self.slide.isMasterSlide) {

        self.pageControl.currentPage = newPage;
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {

}

#pragma mark Slide Setup

- (void)registerNewSlideWithIndex: (int)index {
    
    if (index <= [[(SlideAppDelegate *)[UIApplication sharedApplication].delegate slideIDs] count] - 1) {
        
        NSString *name = [(SlideAppDelegate *)[UIApplication sharedApplication].delegate slideIDs][index];
        
        UIView *view = [[NSBundle mainBundle] loadNibNamed:name owner:self options: nil][0];
        
        BOOL isUsed = NO;
        
        for (Slide *_slide in slides) {
            
            if ([_slide.SlideID isEqualToString: ((Slide *)view).SlideID]) {
                
                isUsed = YES;
            }
        }
        
        if (!isUsed) {
            
            [slides addObject: view];
        }
    }
}

- (void)drawSlide: (int)index {
    
    if ([[((SlideAppDelegate *) [UIApplication sharedApplication].delegate) slideIDs] count] > index) {
        
        CGRect frame = self.scrollView.frame;
        frame.origin.x = frame.size.width * index;
        frame.origin.y = 0;
        
        Slide *_slide = slides[index];
        _slide.frame = frame;
        
        BOOL isUsed = NO;
        
        for (Slide *__slide in self.scrollView.subviews) {
            
            if ([__slide isKindOfClass: [Slide class]])
            {
                if ([__slide.SlideID isEqualToString: _slide.SlideID]) {
                    
                    isUsed = YES;
                }
            }
            
        }
        
        if (!isUsed) {
            
            [self.scrollView addSubview: _slide];
        }
    }
}

#pragma mark Initialization

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
        self.slideCount = 1;
        
        slides = [[NSMutableArray alloc] init];
        
        [self registerNewSlideWithIndex: self.slideCount - 1];
        [self registerNewSlideWithIndex: self.slideCount];
        
        self.slide = slides[0];
        self.slide.delegate = self;

    }
    
    return self;
}

- (id)init {
    
    if (self = [super init]) {
        
        self.slideCount = 1;
        
        slides = [[NSMutableArray alloc] init];
        
        [self registerNewSlideWithIndex: self.slideCount - 1];
        [self registerNewSlideWithIndex: self.slideCount];

        self.slide = slides[0];
        self.slide.delegate = self;
    }
     
    return self;
}

- (void)viewDidLoad
{
    int NUMBER_OF_SLIDES = [[((SlideAppDelegate *)[UIApplication sharedApplication].delegate) slideIDs] count];

    self.scrollView.pagingEnabled = YES;
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * NUMBER_OF_SLIDES, self.scrollView.frame.size.height);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.scrollsToTop = NO;
    self.scrollView.delegate = self;
    self.scrollView.bounces = NO;
    
    self.pageControl.numberOfPages = NUMBER_OF_SLIDES;
    self.pageControl.currentPage = 0;
    self.pageControl.hidden = YES;

    [self drawSlide: self.slideCount - 1];
    [self drawSlide: self.slideCount];

    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
