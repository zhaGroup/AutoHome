//
//  XHQZuiXinViewController.m
//  AutoHome
//
//  Created by tarena on 16/7/6.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "XHQZuiXinViewController.h"
#import "XHQHeaderView.h"
#import "XHQCilceModel.h"
#import "XHQZuiXinModel.h"
#import "XHQZuiXinCell.h"
#import "XHQWebViewController.h"

@interface XHQZuiXinViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *cirleArr;
@property (nonatomic,assign) NSInteger page;
//@property (nonatomic,strong) NSArray *tempArr;

@end

@implementation XHQZuiXinViewController
-(NSMutableArray *)cirleArr
{
    if (_cirleArr == nil) {
        _cirleArr = [NSMutableArray array];
    }
    return _cirleArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setMytableView];
    [self refreshData];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushAction:) name:@"ImageNOtification" object:nil];
    
}
-(void)pushAction:(NSNotification*)noti
{
    NSString *path = (NSString*)noti.object;
    XHQWebViewController *webVC = [[XHQWebViewController alloc] init];
    webVC.urlPath = path;
//    [self.navigationController pushViewController:webVC animated:YES];
    [self pushNextWithType:@"suckEffect" Subtype:@"fromRight" ViewController:webVC];
}
#pragma mark - 上拉加载和下拉刷新
//下拉刷新
-(void)refreshData
{
    _page = 1;
    [self customData];
}
//上拉加载
-(void)loadMoreData
{
    _page += 1;
    [self customData];
}
//设置上拉加载和下拉刷新
-(void)setRefreshView
{
    _page = 1;
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
    [self.tableView.mj_footer beginRefreshing];
}


#pragma mark - 数据请求和解析
-(void)customData
{
    NSString *path = [NSString stringWithFormat:MAIN,self.page];
    [self request:@"GET" url:path para:nil];
}
//重载父类的解析方法,解析请求回来的数据
-(void)parserData:(id)data
{
    if (_page == 1) {
        [self.dataSource removeAllObjects];
        [self.cirleArr removeAllObjects];
    }
    
    //轮播图
    NSArray *clile = data[@"focus"];
    if (self.cirleArr.count == 0) {
        for (NSDictionary *dic in clile) {
            XHQCilceModel *model = [[XHQCilceModel alloc] initWithDictionary:dic error:nil];
            [self.cirleArr addObject:model];
        }
    }
    
//    self.tempArr = self.cirleArr;
    //首页数据
    NSArray *items = data[@"data"];
    for (NSDictionary *dict in items) {
        XHQZuiXinModel *model = [[XHQZuiXinModel alloc] initWithDictionary:dict error:nil];
        [self.dataSource addObject:model];
//        NSLog(@"%ld",self.dataSource.count);
    }
    [self.tableView reloadData];
//    [self refreshData];
//    [self setHeardView];
    
    //结束上拉和下拉刷新
    if (_page == 1) {
        [self.tableView.mj_header endRefreshing];
    }
    if (_page > 1) {
        [self.tableView.mj_footer endRefreshing];
    }
}
-(UIView*)setHeardView
{
    XHQHeaderView *heardV = [[XHQHeaderView alloc] initWithFrame:CGRectMake(0, 0, LYSW, 200)];
    heardV.allImages = [self.cirleArr copy];
    return heardV;
}
-(void)setMytableView
{
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
//    NSLog(@"%@",NSStringFromCGRect(self.tableView.frame));
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
//    [self setRefreshView];
    [self.tableView registerNib:[UINib nibWithNibName:@"XHQZuiXinCell" bundle:nil] forCellReuseIdentifier:@"cell"];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 200;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [self setHeardView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source

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
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    XHQZuiXinModel *model = self.dataSource[indexPath.row];
    XHQWebViewController *webVC = [[XHQWebViewController alloc] init];
    webVC.urlPath = model.url;
    [self pushNextWithType:@"cube" Subtype:@"fromBottom" ViewController:webVC];
}

//给cell添加动画
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 0.1);
    [UIView animateWithDuration:1 animations:^{
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
