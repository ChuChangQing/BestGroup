//
//  TRBestGroupViewModel.m
//  BestGroup
//
//  Created by jiyingxin on 16/6/8.
//  Copyright © 2016年 Tedu. All rights reserved.
//

#import "TRBestGroupViewModel.h"

@implementation TRBestGroupViewModel

- (NSInteger)rowNumber{
    return self.dataList.count;
}

- (TRBestGroupModel *)modelForRow:(NSInteger)row{
    return self.dataList[row];
}

- (NSURL *)heroIconURLForRow:(NSInteger)row index:(NSInteger)index{
    TRBestGroupModel *model = [self modelForRow:row];
    NSArray<NSString *> *iconNames = @[@"hero1", @"hero2", @"hero3", @"hero4", @"hero5"];
    //valueForKey是 KVC的方式, 使用字符串获取对应属性的值
    NSString *enName = [model valueForKey:iconNames[index]];
    return [NSString stringWithFormat:kHeroIconPath, enName].yx_URL;
}

- (NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].title;
}

- (NSString *)descForRow:(NSInteger)row{
    return [self modelForRow:row].des;
}

- (void)getDataWithRequestMode:(VMRequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    _dataTask = [TRNetManager getBestGroupCompletionHandler:^(NSArray<TRBestGroupModel *> *bestGroups, NSError *error) {
        if (!error) {
            _dataList = bestGroups;
        }
        !completionHandler?:completionHandler(error);
    }];
}

@end
