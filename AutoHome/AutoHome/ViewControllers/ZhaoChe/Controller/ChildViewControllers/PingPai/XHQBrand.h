//
//  XHQBrand.h
//  AutoHome
//
//  Created by tarena on 16/7/12.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel.h>

@interface XHQBrand : JSONModel
@property (nonatomic,copy) NSString *icon;
@property (nonatomic,strong) NSNumber *brandID;
@property (nonatomic,copy) NSString *name;

@end
