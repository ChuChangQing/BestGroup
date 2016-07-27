//
//  TRHeroCell.m
//  BestGroup
//
//  Created by tarena on 16/6/12.
//  Copyright © 2016年 Tedu. All rights reserved.
//

#import "TRHeroCell.h"

@implementation TRHeroCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self descLb];
        
        self.separatorInset = UIEdgeInsetsZero;
        self.layoutMargins = UIEdgeInsetsZero;
        self.preservesSuperviewLayoutMargins = NO;
    }
    return self;
}


- (UILabel *)descLb {
    if(_descLb == nil) {
        _descLb = [[UILabel alloc] init];
        [self.contentView addSubview:_descLb];
        _descLb.numberOfLines = 0;
        
        [_descLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconIV.mas_right).equalTo(5);
            make.top.equalTo(5);
            make.right.bottom.equalTo(-5);
        }];
    }
    return _descLb;
}

- (UIImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconIV];
        //图片宽高与上一页保持一致
        CGFloat width = (kScreenW - 5 * 6) / 5;
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(5);
            make.width.height.equalTo(width);
            make.bottom.mas_lessThanOrEqualTo(-5);
        }];
    }
    return _iconIV;
}

@end
