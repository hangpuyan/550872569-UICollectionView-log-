//
//  ViewController.m
//  TableViewAutoHeight
//
//  Created by liu David on 16/7/19.
//  Copyright © 2016年 Yan. All rights reserved.
//

#import "ViewController.h"


#define VGScreenW [UIScreen mainScreen].bounds.size.width
#define VGScreenH [UIScreen mainScreen].bounds.size.height


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configTableView];
}
- (void)configTableView {
    self.view.backgroundColor =[UIColor whiteColor];
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, VGScreenW, VGScreenH) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    // 自动计算行高
    tableView.rowHeight = UITableViewAutomaticDimension;
    /** 预估行高 */
    tableView.estimatedRowHeight = 500.f;
    tableView.backgroundColor = [UIColor grayColor];
    tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:tableView];
    self.tableView = tableView;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row%2==0) {
        AutoHeightCell *cell = [AutoHeightCell cellWithTableView:tableView];
        return cell;
    } else {
        TheBugCell *cell = [TheBugCell cellWithTableView:tableView];
        return cell;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}
@end
