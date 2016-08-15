//
//  ViewController.m
//  CommentModal
//
//  Created by GHSAPP on 16/8/15.
//  Copyright © 2016年 sxwvc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

static NSString * const cellID = @"CommentTableViewCell";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor lightGrayColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 100;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.view addSubview:self.tableView];
    
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    // 布局子控件
    
    
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.textLabel.text = [NSString stringWithFormat:@"%ld组%ld行",indexPath.section,indexPath.row];
    }
    return cell;
}

#pragma mark - UITableViewDelegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *myView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
    myView.backgroundColor = [UIColor greenColor];
    UILabel *label = [[UILabel alloc] init];
    label.frame = myView.bounds;
    [myView addSubview:label];
    if (section == 0) {
        label.text = @"第一组组头";
    }else if (section == 1) {
        label.text = @"第二组组头";
    }
    return myView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

#pragma mark - 点击cell时显示menueController
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didSelectRowAtIndexPath");
    // 取出当前的cell
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    UIMenuController *menue = [UIMenuController sharedMenuController];
    
    // 设置菜单内容
    menue.menuItems = @[
                        [[UIMenuItem alloc]initWithTitle:@"顶" action:@selector(ding:)],
                        [[UIMenuItem alloc]initWithTitle:@"回复" action:@selector(reply:)],
                        [[UIMenuItem alloc]initWithTitle:@"举报" action:@selector(warn:)]
                        ];
    // 显示的位置
    CGRect rect = CGRectMake(0, cell.frame.size.height * 0.5, cell.frame.size.width, 1);
    [menue setTargetRect:rect inView:cell];
    
    // 显示出来
    [menue setMenuVisible:YES animated:YES];
    
}
#pragma mark - UIMenuController处理
// 设置-(BOOL) canBecomeFirstResponder的返回值为YES，原因不言而喻
- (BOOL)canBecomeFirstResponder
{
    return YES;
}
//重载函数-(BOOL) canPerfomAction:(SEL)action withSender:(id)sender，设置要显示的菜单项，返回值为YES。若不进行任何限制，则将显示系统自带的所有菜单项（很多的，自己可以 试一下)，在此，只显示自定义的3项，即：
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if (!self.isFirstResponder) { // 文本框弹出键盘, 文本框才是第一响应者
        if (action == @selector(ding:)
            || action == @selector(reply:)
            || action == @selector(warn:)) return NO;
    }
    
    return [super canPerformAction:action withSender:sender];

}

- (void)ding:(UIMenuController *)menu
{
    NSLog(@"ding");
}

- (void)reply:(UIMenuController *)menu
{
    NSLog(@"reply");
}

- (void)warn:(UIMenuController *)menu
{
    NSLog(@"warn");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
