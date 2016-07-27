//
//  TRNetManager.h
//  BestGroup
//
//  Created by jiyingxin on 16/6/8.
//  Copyright © 2016年 Tedu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRBestGroupModel.h"

@interface TRNetManager : NSObject
+ (id)getBestGroupCompletionHandler:(void(^)(NSArray<TRBestGroupModel *> *bestGroups, NSError *error))completionHandler;
@end
