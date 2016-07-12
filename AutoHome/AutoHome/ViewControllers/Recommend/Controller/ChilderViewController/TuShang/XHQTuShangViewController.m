//
//  XHQYongCheViewController.m
//  AutoHome
//
//  Created by tarena on 16/7/6.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "XHQTuShangViewController.h"
#import "XHQPictModel.h"
#import "XHQPictCell.h"
#import "XHQPictShowViewController.h"

@interface XHQTuShangViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation XHQTuShangViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getData];
    [self configTableView];
}
-(void)getData
{
    NSString *url = PICTURE;
    [self request:@"POST" url:url para:nil];
}
-(void)parserData:(id)data
{
    NSArray *arr = data[@"groups"];
    for (NSDictionary *dict in arr) {
        XHQPictModel *model = [[XHQPictModel alloc] initWithDictionary:dict error:nil];
        [self.dataSource addObject:model];
    }
    [self.tableView reloadData];
}
-(void)configTableView
{
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 188;
    [self.view addSubview:_tableView];
    [_tableView registerNib:[UINib nibWithNibName:@"XHQPictCell" bundle:nil] forCellReuseIdentifier:@"cell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XHQPictCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    XHQPictModel *model = self.dataSource[indexPath.row];
    cell.model = model;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    XHQPictModel *model = self.dataSource[indexPath.row];
    XHQPictShowViewController *pictShowVC = [[XHQPictShowViewController alloc] init];
    pictShowVC.url = model.url;
    [self pushNextWithType:@"cube" Subtype:@"fromRight" ViewController:pictShowVC];
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
