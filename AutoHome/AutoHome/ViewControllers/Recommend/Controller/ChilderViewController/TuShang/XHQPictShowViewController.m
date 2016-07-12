//
//  XHQPictShowViewController.m
//  AutoHome
//
//  Created by tarena on 16/7/12.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "XHQPictShowViewController.h"

@interface XHQPictShowViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *carIV;

@end

@implementation XHQPictShowViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configNavi];
    [self request:@"GET" url:self.url para:nil];
}
-(void)parserData:(id)data
{
    NSArray *arr = data[@"photos"];
    NSDictionary *dict = arr[0];
    NSString *path = dict[@"url"];
    NSString *name = dict[@"name"];
    
    self.nameLabel.text = name;
    [self.carIV sd_setImageWithURL:[NSURL URLWithString:path] placeholderImage:[UIImage imageNamed:@"bg_day"]];
}
-(void)configNavi
{
    self.navigationItem.title = @"图片赏析";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"bar_btn_icon_returntext"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction:)];
}
-(void)backAction:(UIBarButtonItem*)sender
{
    [self backWithType:@"cube" Subtype:@"fromLeft"];
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
