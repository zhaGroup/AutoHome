//
//  XHQSeries.h
//  AutoHome
//
//  Created by tarena on 16/7/13.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel.h>

@interface XHQSeries : JSONModel
@property (nonatomic,copy) NSString *seriesIcon;
@property (nonatomic,copy) NSString *seriesName;
@property (nonatomic,copy) NSString *seriesPrice;
@property (nonatomic,copy) NSString *seriesId;

@end
