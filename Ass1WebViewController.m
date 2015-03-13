//
//  Ass1WebViewController.m
//  MM_Assessment_1
//
//  Created by Mick Lerche on 3/13/15.
//  Copyright (c) 2015 Mick Lerche. All rights reserved.
//

#import "Ass1WebViewController.h"

@interface Ass1WebViewController () <UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityView;

@end

@implementation Ass1WebViewController

#pragma view items
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = self.calculatedValue;
    self.webView.delegate = self;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.mobilemakers.co"]]];
}

#pragma webView delegates
- (void)webViewDidStartLoad:(UIWebView *)webView {
    [self.activityView startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.activityView stopAnimating];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [self.activityView stopAnimating];
}



@end
