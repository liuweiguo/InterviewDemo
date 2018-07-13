//
//  CustomTableViewCell.m
//  LWGInterviewDemo
//
//  Created by LWG on 2018/7/13.
//  Copyright © 2018年 LWG. All rights reserved.
//

#import "CustomTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "Masonry.h"

@implementation CustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}

- (void)addDataWithModel:(DataModel *)model{
    self.titleLabel.text = model.title;
    self.descLabel.text = model.descStr;
    [self.contentImageView sd_setImageWithURL:[NSURL URLWithString:model.imageHref] placeholderImage:[UIImage imageNamed:@"placeholderImage"]];
}

@end
