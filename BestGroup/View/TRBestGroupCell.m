
//
//  TRBestGroupCell.m
//  BestGroup
//
//  Created by jiyingxin on 16/6/8.
//  Copyright © 2016年 Tedu. All rights reserved.
//

#import "TRBestGroupCell.h"

@implementation TRBestGroupCell

- (NSArray<UIImageView *> *)iconIVs {
    if(_iconIVs == nil) {
        NSMutableArray *icons = [NSMutableArray new];
        //间隔5
        CGFloat width = (kScreenW - 5 * 6) / 5;
        UIView *lastView = nil;
        for (int i = 0; i < 5; i++) {
            UIImageView *icon = [UIImageView new];
            [self.contentView addSubview:icon];
            icon.contentMode = UIViewContentModeScaleAspectFit;
            [icon mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.height.equalTo(width);
                make.top.equalTo(self.titleLb.mas_bottom).equalTo(5);;
                if (lastView) {
                    make.left.equalTo(lastView.mas_right).equalTo(5);
                    if (i == 4) {
                        make.right.equalTo(-5);
                    }
                }else{
                    make.left.equalTo(5);
                }
            }];
            [icons addObject:icon];
            lastView = icon;
        }
        _iconIVs = icons.copy;
    }
    return _iconIVs;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.numberOfLines = 0;
        _titleLb.font = [UIFont systemFontOfSize:18];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(5);
            make.right.equalTo(-5);
        }];
    }
    return _titleLb;
}

- (UILabel *)descLb {
    if(_descLb == nil) {
        _descLb = [[UILabel alloc] init];
        _descLb.font = [UIFont systemFontOfSize:14];
        _descLb.textColor = [UIColor darkGrayColor];
        _descLb.numberOfLines = 2;
        [self.contentView addSubview:_descLb];
        [_descLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(5);
            make.right.equalTo(-5);
            make.top.equalTo(self.iconIVs[0].mas_bottom).equalTo(5);
            make.bottom.equalTo(-5);
        }];
    }
    return _descLb;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //去掉分割线左侧间距
        self.separatorInset = UIEdgeInsetsZero;
        self.layoutMargins = UIEdgeInsetsZero;
        self.preservesSuperviewLayoutMargins = NO;
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
