//
//  ZKWebViewVC.m
//  LoadHtml5Test
//
//  Created by GHSAPP on 16/8/22.
//  Copyright © 2016年 sxwvc. All rights reserved.
//

#import "ZKWebViewVC.h"
#import "JGProgressHUD.h"

@interface ZKWebViewVC ()<UIWebViewDelegate>
@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) JGProgressHUD *hud;
@end

@implementation ZKWebViewVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.webView];
    
    // 1.设置webView的代理
    self.webView.delegate = self;
    // 2.加载Html5页面
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"News.html" withExtension:nil];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    // 展示HUD
    JGProgressHUD *hud = [JGProgressHUD progressHUDWithStyle:JGProgressHUDStyleDark];
    [hud showInView:self.view animated:YES];
    _hud = hud;
}


#pragma mark - UIWebViewDelegate
// 是否开始加载
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSLog(@"shouldStartLoadWithRequest");
    
    
    return YES;
}
// 已经开始加载
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"webViewDidStartLoad");
}
// 已经完成加载
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"webViewDidFinishLoad");
    // 隐藏HUD
    [_hud dismiss];
}
// 加载失败
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error
{
    NSLog(@"didFailLoadWithError");
    // 隐藏HUD
    [_hud dismiss];
}


@end
