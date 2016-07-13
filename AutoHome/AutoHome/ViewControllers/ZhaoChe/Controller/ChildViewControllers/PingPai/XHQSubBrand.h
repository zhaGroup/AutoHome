//
//  XHQSubBrand.h
//  AutoHome
//
//  Created by tarena on 16/7/13.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel.h>
#import "XHQSeries.h"

@interface XHQSubBrand : JSONModel
@property (nonatomic,assign) NSInteger seriesNum;
@property (nonatomic,copy) NSString *subBrandName;
@property (nonatomic,strong) NSArray *series;
@end
