//
//  ViewController.m
//  LoadHtml5Test
//
//  Created by GHSAPP on 16/8/22.
//  Copyright © 2016年 sxwvc. All rights reserved.
//

#import "ViewController.h"
#import "ZKWebViewVC.h"
#import "ZKWKWebViewVC.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

//    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    [self.webView loadRequest:request];
}


- (IBAction)WKWebView:(id)sender {
    ZKWKWebViewVC *WKWebVC = [[ZKWKWebViewVC alloc] init];
    [self.navigationController pushViewController:WKWebVC animated:YES];
    
}
- (IBAction)UIWebViewBtn:(id)sender {
    ZKWebViewVC *webVC =[[ZKWebViewVC alloc] init];
    [self.navigationController pushViewController:webVC animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
