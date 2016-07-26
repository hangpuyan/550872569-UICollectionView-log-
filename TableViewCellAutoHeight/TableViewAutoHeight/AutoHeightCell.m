//
//  AutoHeightCell.m
//  TableViewAutoHeight
//
//  Created by Yan on 16/7/19.
//  Copyright © 2016年 Yan. All rights reserved.
//

#import "AutoHeightCell.h"

@implementation AutoHeightCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"AutoHeightCellID";
    AutoHeightCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[AutoHeightCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        /** 第一个控件不设置底部约束 */
        UIImageView *imageView = [UIImageView new];
        imageView.image = [UIImage imageNamed:@"image"];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).with.offset(10);
            make.left.equalTo(self.contentView).with.offset(10);
            make.right.equalTo(self.contentView.mas_right).with.offset(-10);
        }];
        
#pragma mark - 燕航谱修改标记中间 添加控件只设置 top left right 约束
        /** 最后一个控件设置底部约束 */
        UILabel *label = [UILabel new];
        label.text = @"如何看待马克思主义的真理性定性作用和更好发挥政府作用如何看待马克思主义的真理性定性作用和更好发挥政府作用如何看待马克思主义的真理性定性作用和更好发挥政府作用如何看待马克思主义的真理性定性作用和更好发挥政府作用";
        label.font = [UIFont systemFontOfSize:15];
        label.numberOfLines = 0;
        label.textColor = [UIColor blueColor];
        label.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(imageView.mas_bottom).with.offset(10);
            make.left.equalTo(self.contentView).with.offset(10);
            make.right.equalTo(self.contentView).with.offset(-10);
#pragma mark - 燕航谱修改标记    最后一个控件设置底部约束
            make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-10);
        }];
        
    }
    return self;
}
@end
