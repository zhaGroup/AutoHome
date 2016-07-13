//
//  XHQSubBrandViewController.m
//  AutoHome
//
//  Created by tarena on 16/7/12.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "XHQSubBrandViewController.h"
#import "XHQSubBrand.h"
#import "XHQSeries.h"
#import "XHQSubBrandCell.h"

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
    [self requestSubBrandCarInfo];
    [self setupTableView];
}
-(void)requestSubBrandCarInfo
{
    NSMutableDictionary *paras = [NSMutableDictionary dictionary];
    XHQBrandCar *brandCar = self.brands[self.myIndexPath.section];
    XHQBrand *brand = [[XHQBrand alloc] initWithDictionary:brandCar.brands[_myIndexPath.row] error:nil];
    paras[BrandID] = brand.brandID;
    
    [self request:@"GET" url:SubBrandsURL para:paras];
}
-(void)parserData:(id)data
{
    NSArray *arr = data[@"subBrands"];
    for (NSDictionary *dict in arr) {
        XHQSubBrand *subBrand = [[XHQSubBrand alloc] initWithDictionary:dict error:nil];
        [self.dataSource addObject:subBrand];
    }
    [self.tableView reloadData];
}
-(void)setupTableView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, LYSW / 4 * 3, LYSH - 112) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 60;
    [self.view addSubview:_tableView];
    [_tableView registerNib:[UINib nibWithNibName:@"XHQSubBrandCell" bundle:nil] forCellReuseIdentifier:@"cell"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataSource.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    XHQSubBrand *subBrand = self.dataSource[section];
    return subBrand.seriesNum;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XHQSubBrandCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    XHQSubBrand *subBrand = self.dataSource[indexPath.section];
    XHQSeries *series = subBrand.series[indexPath.row];
    [cell.carImageV sd_setImageWithURL:[NSURL URLWithString:series.seriesIcon]];
    cell.carNameLabel.text = series.seriesName;
    cell.priceLabel.text = series.seriesPrice;
    
    return cell;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *brandView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, LYSH / 4 * 3, 20)];
    brandView.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 200, 20)];
    label.font = [UIFont systemFontOfSize:16];
    label.textColor = LYRGB(83, 163, 196);
    
    XHQSubBrand *subBrand = self.dataSource[section];
    label.text = subBrand.subBrandName;
    [brandView addSubview:label];
    return brandView;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}


@end



















