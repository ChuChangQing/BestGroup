//
//  TRBestGroupViewController.m
//  BestGroup
//
//  Created by jiyingxin on 16/6/8.
//  Copyright © 2016年 Tedu. All rights reserved.
//

#import "TRBestGroupViewController.h"
#import "TRBestGroupCell.h"
#import "TRBestGroupViewModel.h"
#import "TRGroupDetailViewController.h"

static NSString * const identify = @"TRBestGroupCell";

@interface TRBestGroupViewController ()
@property (nonatomic) TRBestGroupViewModel *bestGroupVM;
@end

@implementation TRBestGroupViewController

#pragma mark - Lazy Load
- (TRBestGroupViewModel *)bestGroupVM{
    if (!_bestGroupVM) {
        _bestGroupVM = [TRBestGroupViewModel new];
    }
    return _bestGroupVM;
}

#pragma mark - lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    //去掉数据没有下载完毕之前, 表格上的空Cell样式.
    self.tableView.tableFooterView = [UIView new];
    self.navigationItem.title = @"最佳阵容";
    [self.tableView registerClass:[TRBestGroupCell class] forCellReuseIdentifier:identify];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.bestGroupVM getDataWithRequestMode:VMRequestModeRefresh completionHandler:^(NSError *error) {
            [self.tableView.mj_header endRefreshing];
            if (error) {
                DDLogError(@"%@, %s", error, __func__);
            }else{
                [self.tableView reloadData];
            }
        }];
    }];
    [self.tableView.mj_header beginRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.bestGroupVM.rowNumber;
}
//系统自带的Cell高度自动计算, 尝试把这个功能使用FDTemplateLayoutCell轮子来实现.
/*
 - (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
 return UITableViewAutomaticDimension;
 }*/

//使用第三方轮子, 计算cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView fd_heightForCellWithIdentifier:identify configuration:^(TRBestGroupCell *cell) {
#warning 注意block中的cell是id类型的, 需要根据实际情况做对应的显示声明
        //与cellForRowAtIndexPath:方法中一模一样的写法
        cell.titleLb.text = [self.bestGroupVM titleForRow:indexPath.row];
        cell.descLb.text = [self.bestGroupVM descForRow:indexPath.row];
        [cell.iconIVs enumerateObjectsUsingBlock:^(UIImageView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [obj sd_setImageWithURL:[self.bestGroupVM heroIconURLForRow:indexPath.row index:idx] placeholderImage:[UIImage imageNamed:@"Album_ToolViewEmotionHL"]];
        }];
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    TRGroupDetailViewController *vc = [[TRGroupDetailViewController alloc] initWithStyle:UITableViewStyleGrouped];
    vc.bestGroupModel = [self.bestGroupVM modelForRow:indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TRBestGroupCell *cell = [tableView dequeueReusableCellWithIdentifier:identify forIndexPath:indexPath];
    
    cell.titleLb.text = [self.bestGroupVM titleForRow:indexPath.row];
    cell.descLb.text = [self.bestGroupVM descForRow:indexPath.row];
    [cell.iconIVs enumerateObjectsUsingBlock:^(UIImageView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj sd_setImageWithURL:[self.bestGroupVM heroIconURLForRow:indexPath.row index:idx] placeholderImage:[UIImage imageNamed:@"Album_ToolViewEmotionHL"]];
    }];
    
    return cell;
}

@end













