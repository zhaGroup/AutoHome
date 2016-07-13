//
//  XHQNetRequest.h
//  AutoHome
//
//  Created by tarena on 16/7/7.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^CompleteCallBack)(id data);
typedef void (^FailureCallBack)(NSError *error);

@interface XHQNetRequest : NSObject

//get方式请求数据
+(void)get:(NSString*)urlString complete:(CompleteCallBack)callBack fail:(FailureCallBack)failure;
////post方式请求数据
//+(void)post:(NSString*)urlString complete:(CompleteCallBack)callBack fail:(FailureCallBack)failure;

//get方式请求数据 带参数
+(void)get:(NSString*)urlString paramers:(NSDictionary*)params complete:(CompleteCallBack)callBack fail:(FailureCallBack)failure;
//post方式请求数据 带参数
+(void)post:(NSString*)urlString paramers:(NSDictionary*)params complete:(CompleteCallBack)callBack fail:(FailureCallBack)failure;

@end
