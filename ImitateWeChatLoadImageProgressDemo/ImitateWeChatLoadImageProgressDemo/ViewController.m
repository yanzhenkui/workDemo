//
//  ViewController.m
//  ImitateWeChatLoadImageProgressDemo
//
//  Created by GHSAPP on 16/8/13.
//  Copyright © 2016年 sxwvc. All rights reserved.
//

#import "ViewController.h"
#import "DALabeledCircularProgressView.h"

@interface ViewController ()
/** 空心 */
@property (nonatomic, strong) DACircularProgressView *progressView;
/** 是否无线滚动 */
@property (nonatomic, assign) BOOL isRool;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.progressView = [[DACircularProgressView alloc] initWithFrame:CGRectMake(100.0f, 100.0f, 40.0f, 40.0f)];
    self.progressView.progress = 0.4f;
    self.progressView.roundedCorners =YES;
    
    // 无限转动一圈持续时常,一般是在初始化时设置才有效
    self.progressView.indeterminateDuration = 5.0f;

    
    [self.view addSubview:_progressView];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.isRool = !self.isRool;
    if (_isRool) {
        self.progressView.indeterminate = YES;
        
    }else{
        self.progressView.indeterminate = NO;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
