//
//  XHQRecommendTotalViewController.m
//  AutoHome
//
//  Created by tarena on 16/7/12.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "XHQRecommendTotalViewController.h"
#import "XHQZuiXinCell.h"
#import "XHQZuiXinModel.h"
#import "XHQWebViewController.h"

@interface XHQRecommendTotalViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation XHQRecommendTotalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addRefresh];
}
-(void)refreshData
{
    _page = 1;
    [self customData];
}
-(void)loadMoreData
{
    _page += 1;
    [self customData];
}
-(void)addRefresh
{
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self refreshData];
    }];
    [header setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    [header setTitle:@"正在刷新" forState:MJRefreshStateNoMoreData];
    [header setTitle:@"松手刷新" forState:MJRefreshStatePulling];
    self.tableView.mj_header = header;
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self loadMoreData];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - 请求解析数据
-(void)customData
{
    NSString *url = [NSString stringWithFormat:self.path,self.page];
    [self request:@"GET" url:url para:nil];
}
-(void)parserData:(id)data{
    if (_page == 1) {
        [self.dataSource removeAllObjects];
    }
    NSArray *items = data[@"data"];
    for (NSDictionary *dict in items) {
        XHQZuiXinModel *model = [[XHQZuiXinModel alloc] initWithDictionary:dict error:nil];
        [self.dataSource addObject:model];
    }
    [self.tableView reloadData];
    if (_page == 1) {
        [self.tableView.mj_header endRefreshing];
    }
    if (_page > 1) {
        [self.tableView.mj_footer endRefreshing];
    }
}

#pragma mark - Table view
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XHQZuiXinCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    XHQZuiXinModel *model = self.dataSource[indexPath.row];
    cell.model = model;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    XHQWebViewController *webVC = [[XHQWebViewController alloc] init];
    XHQZuiXinModel *model = self.dataSource[indexPath.row];
    webVC.urlPath = model.url;
    [self pushNextWithType:@"reveal" Subtype:@"fromRight" ViewController:webVC];
}

-(UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 100;
        [self.view addSubview:_tableView];
        
        [_tableView registerNib:[UINib nibWithNibName:@"XHQZuiXinCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
}
//给cell添加动画
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
        cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 0.1);
        [UIView animateWithDuration:2 animations:^{
            cell.layer.transform = CATransform3DMakeScale(1, 1, 1);
        }];
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

























