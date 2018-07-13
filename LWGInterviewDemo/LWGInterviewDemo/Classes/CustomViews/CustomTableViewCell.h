//
//  CustomTableViewCell.h
//  LWGInterviewDemo
//
//  Created by LWG on 2018/7/13.
//  Copyright © 2018年 LWG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModel.h"
@interface CustomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UIImageView *contentImageView;
- (void)addDataWithModel:(DataModel*)model;
@end
