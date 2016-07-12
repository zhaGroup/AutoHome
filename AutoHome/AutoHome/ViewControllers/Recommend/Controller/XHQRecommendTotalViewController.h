//
//  XHQRecommendTotalViewController.h
//  AutoHome
//
//  Created by tarena on 16/7/12.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "XHQRootViewController.h"

@interface XHQRecommendTotalViewController : XHQRootViewController

@property (nonatomic,assign) NSInteger page;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,copy) NSString *path;
-(void)refreshData;

@end
