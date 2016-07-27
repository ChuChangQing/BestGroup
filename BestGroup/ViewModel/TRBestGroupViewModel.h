//
//  TRBestGroupViewModel.h
//  BestGroup
//
//  Created by jiyingxin on 16/6/8.
//  Copyright © 2016年 Tedu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRNetManager.h"
#import "TRBaseViewModel.h"

@interface TRBestGroupViewModel : TRBaseViewModel

@property (nonatomic, readonly) NSInteger rowNumber;

- (NSString *)titleForRow:(NSInteger)row;
- (NSString *)descForRow:(NSInteger)row;
- (NSURL *)heroIconURLForRow:(NSInteger)row index:(NSInteger)index;
- (TRBestGroupModel *)modelForRow:(NSInteger)row;

@property (nonatomic) NSArray<TRBestGroupModel *> *dataList;


@end
