//
//  XHQRecommendViewController.m
//  AutoHome
//
//  Created by tarena on 16/7/6.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "XHQRecommendViewController.h"
#import "XHQZuiXinViewController.h"
#import "XHQYouChuangViewController.h"
#import "XHQKuaiBaoViewController.h"
#import "XHQShiPinViewController.h"
#import "XHQXinWenViewController.h"
#import "XHQPingCeiViewController.h"
#import "XHQDaoGoViewController.h"
#import "XHQHangQingViewController.h"
#import "XHQYongCheViewController.h"


@interface XHQRecommendViewController ()

@end

@implementation XHQRecommendViewController

- (instancetype)init
{
    if(self = [super initWithTagViewHeight:44])
    {
        
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.tagItemSize =CGSizeMake(60, 44);
    
    self.selectedTitleColor = LYBlueColor;
    self.selectedTitleFont = [UIFont systemFontOfSize:LYSelectedTitleFont];
    
    self.normalTitleColor = [UIColor grayColor];
    self.normalTitleFont = [UIFont systemFontOfSize:LYNormalTitleFont];
    
//    self.backgroundColor = [UIColor whiteColor];
    self.selectedIndicatorColor = LYBlueColor;
    
    NSArray *titleArray = @[@"最新",@"评测",@"快报",@"视频",@"新闻",@"优创",@"导购",@"行情",@"用车"];
    
    
    
    NSArray *classNames =@[ [XHQZuiXinViewController class],[XHQPingCeiViewController class],[XHQKuaiBaoViewController class],[XHQShiPinViewController class],[XHQXinWenViewController class],[XHQYouChuangViewController class],[XHQDaoGoViewController class],[XHQHangQingViewController class],[XHQYongCheViewController class]];
    
    
    [self reloadDataWith:titleArray andSubViewdisplayClasses:classNames];
    
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
