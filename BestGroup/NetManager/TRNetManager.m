//
//  TRNetManager.m
//  BestGroup
//
//  Created by jiyingxin on 16/6/8.
//  Copyright © 2016年 Tedu. All rights reserved.
//

#import "TRNetManager.h"

@implementation TRNetManager
+ (id)getBestGroupCompletionHandler:(void (^)(NSArray<TRBestGroupModel *> *, NSError *))completionHandler{
    NSMutableDictionary *params = [NSMutableDictionary new];
    [params setObject:@77 forKey:@"v"];
    [params setObject:@"iOS8.2" forKey:@"OSType"];
    return [self GET:kBestGroupPath parameters:params progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler?:completionHandler([TRBestGroupModel parseJSON:jsonObject], error);
    }];
}
@end
