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
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView *web = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:web];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.urlPath]];
    [web loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
