//
//  XHQTabBarViewController.m
//  AutoHome
//
//  Created by tarena on 16/7/6.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "XHQTabBarViewController.h"
#import "XHQRecommendViewController.h"
#import "XHQForumViewController.h"
#import "XHQZhaoCheViewController.h"
#import "XHQFoundViewController.h"
#import "XHQMeViewController.h"

@interface XHQTabBarViewController ()

@end

@implementation XHQTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIViewController *recommendVC = [[XHQRecommendViewController alloc] init];
    UIViewController *forumVC = [[XHQForumViewController alloc] init];
    UIViewController *zhaoCheVC = [[XHQZhaoCheViewController alloc] init];
    UIViewController *foundVC = [[XHQFoundViewController alloc] init];
    UIViewController *meVC = [[XHQMeViewController alloc] init];
    
    NSArray *arr = @[recommendVC,forumVC,zhaoCheVC,foundVC,meVC];
    
//    NSArray *arrName = @[@"推荐",@"论坛",@"找车",@"发现",@"我"];
    for (int i = 0; i < 5; i++)
    {
        UIViewController *vc = arr[i];
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"tab0%d",i+1]];
        UIImage *seletedImage = [UIImage imageNamed:[NSString stringWithFormat:@"tab0%d_p",i+1]];
        [self addVC:vc andImage:image andSelectedImage:seletedImage];
    }
    self.tabBar.tintColor = LYBlueColor;
    
}
-(void)addVC:(UIViewController*)vc andImage:(UIImage*)image andSelectedImage:(UIImage*)selImage
{
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selImage;
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
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
