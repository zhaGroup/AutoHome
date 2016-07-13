//
//  XHQSubBrandViewController.m
//  AutoHome
//
//  Created by tarena on 16/7/12.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "XHQSubBrandViewController.h"

@interface XHQSubBrandViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSIndexPath *myIndexPath;
@property (nonatomic,strong) NSArray *brands;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *series;

@end

@implementation XHQSubBrandViewController
-(instancetype)initWithIndexPath:(NSIndexPath *)indexPath andbrands:(NSArray *)brands
{
    if (self = [super init]) {
        _myIndexPath = indexPath;
        _brands = brands;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
