//
//  WebViewController.m
//  Flix
//
//  Created by ezietz on 6/28/19.
//  Copyright © 2019 ezietz. All rights reserved.
//

#import "WebViewController.h"
#import <WebKit/WebKit.h>
#import "DetailsViewController.h"
#import "MoviesViewController.h"
#import "UIImageView+AFNetworking.h"

@interface WebViewController ()

@property (weak, nonatomic) IBOutlet WKWebView *webView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@", _movie);
    // Do any additional setup after loading the view.
    
    NSString *baseUrlString = @"https://api.themoviedb.org/3/movie/";
    NSString *movieID = [self.movie[@"id"] stringValue];
    NSLog(@"%@ / %@", baseUrlString, movieID);
    NSString *fullUrlString = [baseUrlString stringByAppendingString:movieID];
    NSString *apiKey = @"/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=en-US";
    NSString *urlString = [fullUrlString stringByAppendingString:apiKey];
    // Convert the url String to a NSURL object.
    NSURL *url = [NSURL URLWithString:urlString];
    // Place the URL in a URL Request.
    NSURLRequest *request = [NSURLRequest requestWithURL:url
                                             cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                         timeoutInterval:10.0];

    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    // Load Request into WebView.
    [self.webView loadRequest:request];

    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error != nil) {
            NSLog(@"%@", [error localizedDescription]);
        }
        else {
            NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSDictionary *trailer = dataDictionary[@"results"][0];
            NSString *trailerKey = trailer[@"key"];
           //  self.movie = dataDictionary[@"results"];
            NSString *linkBaseString = @"https://www.youtube.com/watch?v=";
            // NSString *remainderString = self.movie[@"id"];
            NSString *combinedString = [linkBaseString stringByAppendingString:trailerKey];
            NSURL *finalURL = [NSURL URLWithString:combinedString];
            NSURLRequest *request = [NSURLRequest requestWithURL:finalURL
                                                     cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                                 timeoutInterval:10.0];
            [self.webView loadRequest:request]; }// show video
        }];
        [task resume];
    }
    


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
