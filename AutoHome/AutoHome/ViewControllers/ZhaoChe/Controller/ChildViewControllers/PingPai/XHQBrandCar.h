//
//  XHQBrandCar.h
//  AutoHome
//
//  Created by tarena on 16/7/12.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel.h>
#import "XHQBrand.h"

@interface XHQBrandCar : JSONModel
@property (nonatomic,copy) NSString *letter;
@property (nonatomic,assign) NSInteger brandNum;
@property (nonatomic,strong) NSArray *brands;

@end
