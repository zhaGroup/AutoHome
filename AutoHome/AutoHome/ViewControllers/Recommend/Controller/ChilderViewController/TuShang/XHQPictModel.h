//
//  XHQPictModel.h
//  AutoHome
//
//  Created by tarena on 16/7/12.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel.h>

@interface XHQPictModel : JSONModel
@property (nonatomic,copy) NSString *cover;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *url;

@end
