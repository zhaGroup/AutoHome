//
//  XHQSubBrand.m
//  AutoHome
//
//  Created by tarena on 16/7/13.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "XHQSubBrand.h"

@implementation XHQSubBrand
-(void)setSeries:(NSArray *)series
{
    NSMutableArray *mutableArr = [NSMutableArray array];
    for (NSDictionary *dict in series) {
        XHQSeries *series = [[XHQSeries alloc] initWithDictionary:dict error:nil];
        [mutableArr addObject:series];
    }
    _series = [mutableArr copy];
}

@end
