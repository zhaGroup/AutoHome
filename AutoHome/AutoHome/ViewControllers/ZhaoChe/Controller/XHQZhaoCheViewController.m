//
//  XHQZhaoCheViewController.m
//  AutoHome
//
//  Created by tarena on 16/7/6.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "XHQZhaoCheViewController.h"
#import "XHQPingPaiViewController.h"
#import "XHQShaiXuanViewController.h"
#import "XHQJiangJiaViewController.h"
#import "XHQZhaoErShouCheViewController.h"

@interface XHQZhaoCheViewController ()

@end

@implementation XHQZhaoCheViewController
- (instancetype)init
{
    self = [super initWithTagViewHeight:44];
    if (self) {
        
    }
    return self;
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
    self.automaticallyAdjustsScrollViewInsets = NO;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}
-(void)initUI
{
    
    self.tagItemSize = CGSizeMake(80, 44);
    self.normalTitleColor = [UIColor grayColor];
    self.normalTitleFont  = [UIFont systemFontOfSize:LYNormalTitleFont];
    
    self.selectedTitleColor = LYBlueColor;
    self.selectedTitleFont = [UIFont systemFontOfSize:LYSelectedTitleFont];
    
    self.selectedIndicatorColor = LYBlueColor;
    
    NSArray *arrTitle = @[@"品牌",@"筛选",@"降价",@"找二手车"];
    NSArray *arrClass = @[[XHQPingPaiViewController class],[XHQShaiXuanViewController class], [XHQJiangJiaViewController class],[XHQZhaoErShouCheViewController class]];
    
    [self reloadDataWith:arrTitle andSubViewdisplayClasses:arrClass withParams:nil];
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
