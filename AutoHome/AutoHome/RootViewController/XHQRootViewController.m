//
//  XHQRootViewController.m
//  AutoHome
//
//  Created by tarena on 16/7/7.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "XHQRootViewController.h"

@interface XHQRootViewController ()
-(void) showIndicatorInView:(UIView*)presentView isDisplay:(BOOL)show;

@property (nonatomic,strong) MBProgressHUD *hud;

@end

@implementation XHQRootViewController
-(void)showIndicatorInView:(UIView *)presentView isDisplay:(BOOL)show{
}
-(NSMutableArray *)dataSource
{
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    self.dataSource = nil;
}
//数据请求
-(void)request:(NSString *)method url:(NSString *)urlString para:(NSDictionary *)dict
{
    if ([method isEqualToString:@"GET"]) {
        [XHQNetRequest get:urlString paramers:dict complete:^(id data) {
            [self parserData:data];
        } fail:^(NSError *error) {
            NSLog(@"error = %@",error);
            [self showHub:NO];
        }];
    }else{
        [XHQNetRequest post:urlString paramers:dict complete:^(id data) {
            [self parserData:data];
        } fail:^(NSError *error) {
            NSLog(@"POST失败原因 = %@",error.description);
            
        }];
    }
}
-(void)parserData:(id)data
{
    
}
-(void)showHub:(BOOL)show
{
    if (show) {
        [self.hud show:YES];
    }else{
        [self.hud hide:YES];
    }
}
-(void)pushNextWithType:(NSString *)type Subtype:(NSString *)subtype ViewController:(UIViewController *)viewController
{
    CATransition *transition = [CATransition animation];
    transition.type = type;
    transition.subtype = subtype;
    transition.duration = 2;
    viewController.hidesBottomBarWhenPushed = YES;
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    [self.navigationController pushViewController:viewController animated:nil];
}
-(void)backWithType:(NSString *)type Subtype:(NSString *)subtype
{
    CATransition *transition = [CATransition animation];
    transition.type = type;
    transition.subtype = subtype;
    transition.duration = 2;
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    [self.navigationController popViewControllerAnimated:nil];
}

#pragma mark ---- 懒加载 ----
-(MBProgressHUD *)hud
{
    if (_hud == nil) {
        _hud = [[MBProgressHUD alloc] initWithView:self.view];
        _hud.labelText = @"正在为您刷新";
        [self.view addSubview:_hud];
    }
    return _hud;
}


@end



























