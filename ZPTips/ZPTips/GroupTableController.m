//
//  GroupTableController.m
//  ZPTips
//
//  Created by yueru on 2016/11/30.
//  Copyright © 2016年 yueru. All rights reserved.
//

#import "GroupTableController.h"

@interface GroupTableController ()

@end

@implementation GroupTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置group样式的tableView没有默认的表头和表尾
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0.1)];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0.1)];
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = 0;
}


@end
