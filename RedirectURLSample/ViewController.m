//
//  ViewController.m
//  RedirectURLSample
//
//  Created by iDevelopper on 29/03/2017.
//  Copyright © 2017 iDevelopper. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIWebViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectZero];
    webView.delegate = self;
    [self.view addSubview:webView];
    
    NSString *urlString = @"http://listen.streamonomy.com/cooljazzflorida";
    /* If you enter this url using Safari browser, the redirected url is:
     http://streaming.shoutcast.com/cooljazzflorida?lang=fr-fr
     */
    NSURL *urlToPlay = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:urlToPlay];
    [webView loadRequest:request];
}

#pragma mark - UIWebView Delegate

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSURL *url = [webView.request mainDocumentURL];
    NSLog(@"DID FINISH The Redirected URL is: %@", url);
    /*
     The redirected url is: (not the same returned by the browser and this url is not found)
     http://streaming.shoutcast.com/cooljazzflorida_64?lang=en-us
    */
    
    
    // Set AVPlayerItem with the redirected URL
    // ...
}

@end
