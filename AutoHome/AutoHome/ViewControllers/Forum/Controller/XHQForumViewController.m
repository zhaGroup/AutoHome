//
//  XHQForumViewController.m
//  AutoHome
//
//  Created by tarena on 16/7/6.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "XHQForumViewController.h"
#import "XHQJingXuanViewController.h"
#import "XHQReTieViewController.h"
#import "XHQChangYongForumViewController.h"


@interface XHQForumViewController ()

@end

@implementation XHQForumViewController
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
    
    NSArray *arrTitle = @[@"精选推荐",@"热帖",@"常用论坛"];
    NSArray *arrClass = @[[XHQJingXuanViewController class],[XHQReTieViewController class], [XHQChangYongForumViewController class]];
    
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
