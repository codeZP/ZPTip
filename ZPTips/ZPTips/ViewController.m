//
//  ViewController.m
//  ZPTips
//
//  Created by yueru on 2016/11/29.
//  Copyright © 2016年 yueru. All rights reserved.
//

#import "ViewController.h"
#import "UIView+CustomRadio.h"
#import "UIImage+Extension.h"
#import "ModalController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topViewHCons;

@end

@implementation ViewController

static CGFloat H = -240;
static CGFloat totalH = 200 - 64;

- (void)viewDidLoad {
    [super viewDidLoad];
    //这样隐藏式没用的
//    self.navigationController.navigationBar.alpha = 0.0;
    //隐藏时候要设置一个空图片
//    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    //控制局部圆角问题
    [self.button customRadionWithCornerType:UIRectCornerTopRight | UIRectCornerTopLeft radio:10];
    self.tableView.contentInset = UIEdgeInsetsMake(240, 0, 0, 0);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = @"xxxxxxxx";
    return cell;
}
- (IBAction)click {
    ModalController *vc = [[ModalController alloc] init];
    vc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint point = scrollView.contentOffset;
    CGFloat offsetH = point.y - H;
    CGFloat alph = offsetH / totalH;
    if (alph >= 1) {
        alph = 0.99;
    }
    UIImage *image = [UIImage imageWithColor:[UIColor colorWithWhite:1.0 alpha:alph]];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    CGFloat topViewH = 200 - offsetH;
    self.topViewHCons.constant = topViewH;
    if (topViewH <= 64) {
        self.topViewHCons.constant = 64;
    }
}

@end
