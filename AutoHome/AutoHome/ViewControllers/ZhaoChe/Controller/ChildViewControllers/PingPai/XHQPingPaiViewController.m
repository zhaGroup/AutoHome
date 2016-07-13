//
//  XHQPingPaiViewController.m
//  AutoHome
//
//  Created by tarena on 16/7/7.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "XHQPingPaiViewController.h"
#import "XHQBrandCar.h"
#import "XHQBrandCell.h"
#import "XHQSubBrandViewController.h"

@interface XHQPingPaiViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UIWindow *window;
@property (nonatomic,strong) UIView *bgview;

@end

@implementation XHQPingPaiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
    [self request:@"GET" url:BrandCar para:nil];
}
-(void)parserData:(id)data
{
    NSArray *arr = data[@"letters"];
    for (NSDictionary *dict in arr) {
        XHQBrandCar *brandCar = [[XHQBrandCar alloc] initWithDictionary:dict error:nil];
        [self.dataSource addObject:brandCar];
    }
    [self.tableView reloadData];
}
-(void)setupTableView
{
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 60;
    [self.view addSubview:_tableView];
    [_tableView registerNib:[UINib nibWithNibName:@"XHQBrandCell" bundle:nil] forCellReuseIdentifier:@"cell"];
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
    XHQBrandCar *model = self.dataSource[section];
    return model.brandNum;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XHQBrandCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    XHQBrandCar *brandCar = self.dataSource[indexPath.section];
    XHQBrand *brand = [[XHQBrand alloc] initWithDictionary:brandCar.brands[indexPath.row] error:nil];
    [cell.heardIV sd_setImageWithURL:[NSURL URLWithString:brand.icon] placeholderImage:[UIImage imageNamed:@"bg_day"]];
    cell.nameLabel.text = brand.name;
    return cell;
}
- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    NSMutableArray *indexTitles = [NSMutableArray array];
    for (XHQBrandCar *car in self.dataSource) {
        [indexTitles addObject:car.letter];
    }
    return indexTitles;
}
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    XHQBrandCar *model = self.dataSource[section];
    return model.letter;
}
//点中cell的时候
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIWindow *window = [[UIWindow alloc] initWithFrame:CGRectMake(LYSW , 64, LYSW , LYSH - 112)];
    window.backgroundColor = [[UIColor clearColor] colorWithAlphaComponent:0.7];
    window.windowLevel = UIWindowLevelNormal;
    window.hidden = NO;
    [window makeKeyAndVisible];
    window.rootViewController = [[XHQSubBrandViewController alloc] initWithIndexPath:indexPath andbrands:self.dataSource];
    self.window = window;
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(LYSW, 0, LYSW / 4 * 3, LYSH)];
    [UIView animateWithDuration:0.25 animations:^{
        [window setFrame:CGRectMake(LYSW - LYSW / 4 * 3, 64, LYSW / 4 * 3, LYSH - 112)];
        [bgView setFrame:self.view.bounds];
    }];
    bgView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    UITapGestureRecognizer *tap  = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    [bgView addGestureRecognizer:tap];
    [self.view addSubview:bgView];
    self.bgview = bgView;
}
-(void)tapAction
{
    [UIView animateWithDuration:0.25 animations:^{
        self.bgview.alpha = 0;
        [self.window setFrame:CGRectMake(LYSW , 64, LYSW , LYSH - 112)];
        [self.bgview setFrame:CGRectMake(LYSW, 0, LYSW / 4 * 3, LYSH)];
    } completion:^(BOOL finished) {
        [self.bgview removeFromSuperview];
        [self.window resignKeyWindow];
        self.window  = nil;
        self.bgview = nil;
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
