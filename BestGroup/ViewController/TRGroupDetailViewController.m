//
//  TRGroupDetailViewController.m
//  BestGroup
//
//  Created by tarena on 16/6/12.
//  Copyright © 2016年 Tedu. All rights reserved.
//

#import "TRGroupDetailViewController.h"
#import "TRHeroCell.h"
#import "TRBestGroupCell.h"

@interface TRGroupDetailViewController ()

@end

@implementation TRGroupDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[TRHeroCell class] forCellReuseIdentifier:@"TRHeroCell"];
    [self.tableView registerClass:[TRBestGroupCell class] forCellReuseIdentifier:@"TRBestGroupCell"];
    self.tableView.sectionFooterHeight = 9;
    self.tableView.sectionHeaderHeight = 1;
    //隐藏掉group风格的表格的头部和脚部空白
    self.tableView.contentInset = UIEdgeInsetsMake(-35, 0, -29, 0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //第0分组 1个,  第1分组 5个
    return section ? 5 : 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return [tableView fd_heightForCellWithIdentifier:@"TRBestGroupCell" configuration:^(TRBestGroupCell *cell) {
            cell.titleLb.text = _bestGroupModel.title;
            
            cell.descLb.numberOfLines = 0;
            cell.descLb.text = _bestGroupModel.des;
            //图片的高度是固定的, 不随内容而变化, 所以这里不写了
        }];
    }else{
        return [tableView fd_heightForCellWithIdentifier:@"TRHeroCell" configuration:^(TRHeroCell *cell) {
            cell.descLb.text = @[_bestGroupModel.des1, _bestGroupModel.des2, _bestGroupModel.des3, _bestGroupModel.des4, _bestGroupModel.des5][indexPath.row];
            //图片的高度是固定的, 不随内容而变化, 所以这里不写了
        }];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        TRBestGroupCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TRBestGroupCell" forIndexPath:indexPath];
        cell.titleLb.text = _bestGroupModel.title;
        
        cell.descLb.numberOfLines = 0;
        cell.descLb.text = _bestGroupModel.des;
        
        
        [cell.iconIVs enumerateObjectsUsingBlock:^(UIImageView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSString *enName = @[_bestGroupModel.hero1, _bestGroupModel.hero2, _bestGroupModel.hero3, _bestGroupModel.hero4, _bestGroupModel.hero5][idx];
            NSURL *iconURL =[NSString stringWithFormat:kHeroIconPath, enName].yx_URL;
            [obj sd_setImageWithURL:iconURL placeholderImage:[UIImage imageNamed:@"Album_ToolViewEmotionHL"]];
        }];
        return cell;
    }
    
    if (indexPath.section == 1) {
        TRHeroCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TRHeroCell" forIndexPath:indexPath];
        cell.descLb.text = @[_bestGroupModel.des1, _bestGroupModel.des2, _bestGroupModel.des3, _bestGroupModel.des4, _bestGroupModel.des5][indexPath.row];
        NSString *enName = @[_bestGroupModel.hero1, _bestGroupModel.hero2, _bestGroupModel.hero3, _bestGroupModel.hero4, _bestGroupModel.hero5][indexPath.row];
        NSURL *iconURL =[NSString stringWithFormat:kHeroIconPath, enName].yx_URL;
        [cell.iconIV sd_setImageWithURL:iconURL placeholderImage:[UIImage imageNamed:@"Album_ToolViewEmotionHL"]];
        return cell;
    }
    
    return [UITableViewCell new];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
