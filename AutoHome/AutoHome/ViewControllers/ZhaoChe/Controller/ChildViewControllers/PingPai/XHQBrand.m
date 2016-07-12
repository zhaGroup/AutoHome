//
//  XHQBrand.m
//  AutoHome
//
//  Created by tarena on 16/7/12.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "XHQBrand.h"

@implementation XHQBrand
+(JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id":@"brandID"}];
}

@end
