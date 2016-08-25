//
//  ZKWKWebViewVC.m
//  LoadHtml5Test
//
//  Created by GHSAPP on 16/8/22.
//  Copyright © 2016年 sxwvc. All rights reserved.
//

#import "ZKWKWebViewVC.h"
#import <WebKit/WebKit.h>

@interface ZKWKWebViewVC ()

@property (nonatomic, strong) WKWebView *webView;


@end

@implementation ZKWKWebViewVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.创建配置类(在创建WKWebView之前,需要先创建配置对象,用于做一些配置)
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
        //偏好设置也没有必要去修改它,使用默认的就好
    config.preferences = [[WKPreferences alloc] init];
        // 默认为0
    config.preferences.minimumFontSize = 10;
        // 默认为YES
    config.preferences.javaScriptEnabled = YES;
        // 在iOS上默认为NO,表示不能自动通过窗口打开
    config.preferences.javaScriptCanOpenWindowsAutomatically = NO;
    self.webView = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:config];
    [self.view addSubview:_webView];
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"News.html" withExtension:nil];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    
    
}


@end
