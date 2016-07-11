//
//  XHQZuiXinModel.h
//  AutoHome
//
//  Created by tarena on 16/7/8.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel.h>

@interface XHQZuiXinModel : JSONModel
@property (nonatomic,copy) NSString *count;
@property (nonatomic,copy) NSString *image;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *pubDate;

@property (nonatomic,copy) NSString *url;

@end
