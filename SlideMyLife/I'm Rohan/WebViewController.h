//
//  WebViewController.h
//  Slide My Life
//
//  Created by Rohan Kapur on 27/4/13.
//  Copyright (c) 2013 Rohan Kapur. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController <UIWebViewDelegate> {
    
    UIActivityIndicatorView *act;
    
    NSString *link;
}

@property (strong, nonatomic) IBOutlet UIWebView *webView;

- (id)initWithLink: (NSString *)link;

- (IBAction)back;

@end
