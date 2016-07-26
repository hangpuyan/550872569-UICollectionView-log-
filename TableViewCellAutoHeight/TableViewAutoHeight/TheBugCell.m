//
//  VOGArtCell.m
//  Vogue
//
//  Created by 蔡艳英 on 16/7/18.
//  Copyright © 2016年 Lee. All rights reserved.
//

#import "TheBugCell.h"

static  NSString *UICollectionViewCellID2 = @"UICollectionViewCellID2";

@interface TheBugCell ()<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UIImageView *imageViewArt;
@property (nonatomic, strong) UILabel *labelTile;
@property (nonatomic, strong) UILabel *labelArt;
@property (nonatomic, strong) UILabel *labelWeek;
@property (nonatomic, strong) UIImageView *imageArt;
@property (nonatomic, strong) UILabel *labelSmallTitle;

@end

@implementation TheBugCell


+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"VOGArtCellID";
    TheBugCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[TheBugCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configUI];
        self.contentView.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
//添加子控件
- (void)configUI
{
    [self initCollectionView];
}

- (void)initCollectionView
{
        /* 小测试 */
    [self.contentView addSubview:self.labelArt];
    [self.labelArt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(150);
        make.top.equalTo(self.contentView).with.offset(kSpaceTop);
    }];
    
    //浅色线
    UIView *viewLine = [UIView new];
    viewLine.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:viewLine];
    [viewLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.labelArt.mas_bottom).with.offset(kSpaceTop);
        make.left.equalTo(self.contentView);
        make.right.equalTo(self.contentView);
        make.height.equalTo(@2);
    }];
    
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    CGRect frame = CGRectMake(0, 0, VGScreenW, 120);
    
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:frame  collectionViewLayout:layout];
    collectionView.contentSize = CGSizeMake(VGScreenW * 5, kIMAGEVIEWW + 40);
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:UICollectionViewCellID2];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    [self.contentView addSubview:collectionView];
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).with.offset(kSpaceLeft);
        make.top.equalTo(viewLine.mas_bottom).with.offset(kSpaceTop);
        make.right.equalTo(self.contentView.mas_right).with.offset(-kSpaceRight);
        /******************************************************************/
        make.height.equalTo(@(kIMAGEVIEWW + 40));//报错
        //  make.height.equalTo(@(kIMAGEVIEWW + 40 + 30));//不报错
        /*  the item height must be less than the height of the UICollectionView minus the section insets top and bottom values, minus the content insets top and bottom values.
         该项目高度必须小于该UICollectionView减去部分插入顶部和底部的高值，减去内容插入顶部和底部的值。
         */
        /******************************************************************/
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-kSpaceBottom);
    }];
    //底部灰色图
    UIView *viewGrayBottom = [UIView new];
    viewGrayBottom.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:viewGrayBottom];
    [viewGrayBottom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView);
        make.height.equalTo(@kViewGaryHeight);
        make.bottom.equalTo(self.contentView);
    }];
}

#pragma mark --UICollectionViewDataSource

//定义展示的UICollectionViewCell的个数
- (NSInteger)collectionView:( UICollectionView *)collectionView numberOfItemsInSection:( NSInteger )section
{
    return 10 ;
}
//定义展示的Section的个数
- (NSInteger)numberOfSectionsInCollectionView:( UICollectionView *)collectionView
{
    return 1 ;
}

//每个UICollectionView展示的内容
- (UICollectionViewCell *)collectionView:( UICollectionView *)collectionView cellForItemAtIndexPath:( NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:UICollectionViewCellID2 forIndexPath:indexPath];
    UIImageView *imageViewArt = [UIImageView new];
    imageViewArt.image = [UIImage imageNamed:@"1"];
    [cell.contentView addSubview:imageViewArt];
    self.imageViewArt = imageViewArt;
    [imageViewArt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(cell.contentView);
        make.height.equalTo(@(kIMAGEVIEWW));
    }];
    //设置标题 cai--
    UILabel *labelTile = [UILabel new];
    [cell.contentView addSubview:labelTile];
    labelTile.text = @"标题标题标题标题标题标题";
    //自动折行设置
    labelTile.lineBreakMode = NSLineBreakByWordWrapping;
    labelTile.numberOfLines = 0;
    labelTile.textColor = [UIColor grayColor];
    labelTile.textAlignment = NSTextAlignmentLeft;
    labelTile.font = [UIFont systemFontOfSize:17];
    self.labelTile = labelTile;
    [labelTile mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageViewArt.mas_bottom);
        make.left.right.bottom.equalTo(cell.contentView);
    }];
    return cell;
}

#pragma mark --UICollectionViewDelegate


//返回这个UICollectionViewCell是否可以被选择
- (BOOL)collectionView:( UICollectionView *)collectionView shouldSelectItemAtIndexPath:( NSIndexPath *)indexPath
{
    return YES ;
}

#pragma mark - UICollectionViewDelegateFlowLayout

//定义每个UICollectionView 的大小
- ( CGSize )collectionView:( UICollectionView *)collectionView layout:( UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:( NSIndexPath *)indexPath
{
    return CGSizeMake ( kIMAGEVIEWW, kIMAGEVIEWW +40);
}

//定义每个UICollectionView 的边距
- (UIEdgeInsets)collectionView:( UICollectionView *)collectionView layout:( UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:( NSInteger )section
{
    return UIEdgeInsetsMake ( 10, 0, 10, 5);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

#pragma mark - lazy

- (UILabel *)labelArt
{
    if (!_labelArt) {
        _labelArt = [[UILabel alloc]init];
        _labelArt.text = @"小测试 | Quiz";
        _labelArt.font = [UIFont systemFontOfSize:18];
        _labelArt.textColor = [UIColor blackColor];
        _labelArt.numberOfLines = 1;
    }
    return _labelArt;
}


@end
