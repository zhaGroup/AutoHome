//
//  XHQNetRequest.m
//  AutoHome
//
//  Created by tarena on 16/7/7.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "XHQNetRequest.h"
#import <AFNetworking.h>

@implementation XHQNetRequest
+(void)get:(NSString *)urlString complete:(CompleteCallBack)callBack fail:(FailureCallBack)failure
{
    
    AFHTTPSessionManager *mannager = [AFHTTPSessionManager manager];
    mannager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [mannager GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSString *str = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
//        NSLog(@"str = %@",str);
//        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        callBack(dict);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}
+(void)post:(NSString *)urlString complete:(CompleteCallBack)callBack fail:(FailureCallBack)failure
{
    AFHTTPSessionManager *mannager = [AFHTTPSessionManager manager];
    mannager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [mannager POST:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSString *str = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
//        NSLog(@"str = %@",str);
//        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        callBack(dict);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}


@end
