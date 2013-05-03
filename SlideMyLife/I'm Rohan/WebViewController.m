//
//  WebViewController.m
//  Slide My Life
//
//  Created by Rohan Kapur on 27/4/13.
//  Copyright (c) 2013 Rohan Kapur. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (IBAction)back {
    
    [self.navigationController popViewControllerAnimated: YES];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    
    if ([self webView].loading == YES) {
        
        if (act == nil) {
            
            act = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
            act.color = [UIColor blackColor];
            act.center = self.view.center;
            
            [self.view addSubview:act];
            
        } else {
            
            act.hidden = NO;
        }
        
        act.center = self.view.center;
        [act startAnimating];
    }
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    [act stopAnimating];
    [act setHidden: YES];
    act = nil;
}

-(void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear: YES];
    
    // Create UIWebView as large as the screen
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithLink:(NSString *)_link {
    
    if (self = [super init]) {
        
        link = _link;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [self.webView loadRequest: [NSURLRequest requestWithURL: [NSURL URLWithString: link]]];    
    [self.webView setDelegate:self];

    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
