//
//  XHQMeViewController.m
//  AutoHome
//
//  Created by tarena on 16/7/6.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "XHQMeViewController.h"

@interface XHQMeViewController ()<UITableViewDataSource, UITableViewDelegate>
@end

@implementation XHQMeViewController
//- (instancetype)init
//{
//    self = [super initWithTagViewHeight:44];
//    if (self) {
//        
//    }
//    return self;
//}
//
//
//
//
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.navigationItem.title = @"我";
//Set rightBarButton With Image Photos;
    UIButton *modeBarButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [modeBarButton setBackgroundImage:[UIImage imageNamed:@"me_moon@2x.png"] forState:(UIControlStateNormal)];
    modeBarButton.frame = CGRectMake(0, 0, 35, 35);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:modeBarButton];
//****************** 农大神
    [modeBarButton addTarget:self action:@selector(nightMode:) forControlEvents:UIControlEventTouchUpInside];
    [modeBarButton setBackgroundImage:[UIImage imageNamed:@"me_day@2x.png"] forState:UIControlStateSelected];
    [self.view addSubview:modeBarButton];
    
    
//    modeBarButton = [[UIBarButtonItem alloc]
//    initWithImage:[UIImage imageNamed:@"me_moon@2x.png"] style:UIBarButtonItemStylePlain target:self action:@selector(nightMode:)] ;
 
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"我" style:(UIBarButtonItemStyleDone) target:self action:nil];
}


-(void)nightMode:(UIButton*)sender{
    if ((sender.selected = !sender.selected))
    {
    self.view.backgroundColor = [UIColor grayColor];
    }
    else
    {
    self.view.backgroundColor = [UIColor whiteColor];
    }
//    self.view.backgroundColor = [UIColor grayColor];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 1) {
        return 4;
    }
    return 1;
}

//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
////    
////    switch (indexPath.section) {
////        case 0:
////            <#statements#>
////            break;
////            
////        default:
////            break;
//    }
//    
//    
//    
//    
//    
//}

//-(void)viewDidAppear:(BOOL)animated
//{
//    [super viewDidAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES];
//    self.automaticallyAdjustsScrollViewInsets = NO;
//}
//
//

//
//-(void)initUI
//{
//    
//    self.tagItemSize = CGSizeMake(80, 44);
//    self.normalTitleColor = [UIColor grayColor];
//    self.normalTitleFont  = [UIFont systemFontOfSize:LYNormalTitleFont];
//    
//    self.selectedTitleColor = LYBlueColor;
//    self.selectedTitleFont = [UIFont systemFontOfSize:LYSelectedTitleFont];
//    
//    self.selectedIndicatorColor = LYBlueColor;
//    
//    NSArray *arrTitle = @[@"精选推荐",@"热帖",@"常用论坛"];
//    NSArray *arrClass = @[[XHQJingXuanViewController class],[XHQReTieViewController class], [XHQChangYongForumViewController class]];
//    
//    [self reloadDataWith:arrTitle andSubViewdisplayClasses:arrClass withParams:nil];
//}


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
