//
//  XHQPingCeiViewController.m
//  AutoHome
//
//  Created by tarena on 16/7/6.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "XHQPingCeiViewController.h"

@interface XHQPingCeiViewController ()

@end

@implementation XHQPingCeiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.path = PingCe;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)configNavi
{
    self.navigationItem.title = @"评测";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"bar_btn_icon_returntext"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction:)];
}
-(void)backAction:(UIBarButtonItem*)sender
{
    [self backWithType:@"reveal" Subtype:@"fromLeft"];
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
