//
//  XHQRootViewController.h
//  AutoHome
//
//  Created by tarena on 16/7/7.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XHQNetRequest.h"

@interface XHQRootViewController : UIViewController
@property (nonatomic,strong) NSMutableArray *dataSource;

-(void)request:(NSString*)method url:(NSString*)urlString para:(NSDictionary *)dict;

-(void)showHub:(BOOL)show;

-(void)parserData:(id)data;

-(void)pushNextWithType:(NSString*)type Subtype:(NSString*)subtype ViewController:(UIViewController*)viewController;

-(void)backWithType:(NSString *)type Subtype:(NSString *)subtype;

@end
