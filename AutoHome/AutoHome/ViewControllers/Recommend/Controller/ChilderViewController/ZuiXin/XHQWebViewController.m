//
//  XHQWebViewController.m
//  AutoHome
//
//  Created by tarena on 16/7/9.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "XHQWebViewController.h"

@interface XHQWebViewController ()

@end

@implementation XHQWebViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self.theme isEqualToString:@"最新"]) {
        [self configNavi];
    }
    UIWebView *web = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:web];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.urlPath]];
    [web loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)configNavi
{
    self.navigationItem.title = self.theme;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"bar_btn_icon_returntext"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction:)];
}
-(void)backAction:(UIBarButtonItem*)sender
{
    [self backWithType:@"cube" Subtype:@"fromTop"];
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
