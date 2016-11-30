//
//  ViewController.m
//  ZPTips
//
//  Created by yueru on 2016/11/29.
//  Copyright © 2016年 yueru. All rights reserved.
//

#import "ViewController.h"
#import "ModalController.h"
#import "ZPExtension.h"

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
    //设置导航栏透明
    [self setupNav];
    
    //控制局部圆角问题
    [self.button customRadionWithCornerType:UIRectCornerTopRight | UIRectCornerTopLeft radio:10];
    
    self.tableView.contentInset = UIEdgeInsetsMake(240, 0, 0, 0);
    
    
    
    //判断图片类型
//    [self imageType];
    
    
    
    
    //删除NSUserDefaults数据的测试
    [[NSUserDefaults standardUserDefaults] setObject:@"123456" forKey:@"pwd"];
    NSLog(@"%@", NSHomeDirectory());
    
    
    //打印系统所有已注册的字体名称
//    [self printSystemFontName];
    
    
    
    
    
    //反转字符串
    NSString *str = @"赵攀";
    NSLog(@"%@", [str reverseInString]);
    
    
    
    //将汉字转换为拼音(带音标)
    NSString *china = @"我是中国人";
    NSLog(@"%@", [china chinaTransformWithPhoneticSymbol]);
    
    //不带音标
    NSLog(@"%@", [china chinaTransForm]);
    
    
    
    
    //禁止锁屏(两个方法任选一个就行)
    [UIApplication sharedApplication].idleTimerDisabled = YES;
    [[UIApplication sharedApplication] setIdleTimerDisabled:YES];
    
    
    //更改状态栏颜色
    [[UIApplication sharedApplication] setStatusBarBachgroundColor:[UIColor redColor]];
    
    
    //NSArray 快速求总和 最大值 最小值 和 平均值
    NSArray *array = [NSArray arrayWithObjects:@"2.0", @"2.3", @"3.0", @"4.0", @"10", nil];
    CGFloat sum = [[array valueForKeyPath:@"@sum.floatValue"] floatValue];
    CGFloat avg = [[array valueForKeyPath:@"@avg.floatValue"] floatValue];
    CGFloat max =[[array valueForKeyPath:@"@max.floatValue"] floatValue];
    CGFloat min =[[array valueForKeyPath:@"@min.floatValue"] floatValue];
    NSLog(@"%f\n%f\n%f\n%f",sum,avg,max,min);
    
    //修改UITextField中Placeholder的文字颜色
//    [textField setValue:[UIColor redColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    //  关于NSDateFormatter的格式
    //  G: 公元时代，例如AD公元
    //  yy: 年的后2位
    //  yyyy: 完整年
    //  MM: 月，显示为1-12
    //  MMM: 月，显示为英文月份简写,如 Jan
    //  MMMM: 月，显示为英文月份全称，如 Janualy
    //  dd: 日，2位数表示，如02
    //  d: 日，1-2位显示，如 2
    //  EEE: 简写星期几，如Sun
    //  EEEE: 全写星期几，如Sunday
    //  aa: 上下午，AM/PM
    //  H: 时，24小时制，0-23
    //  K：时，12小时制，0-11
    //  m: 分，1-2位
    //  mm: 分，2位
    //  s: 秒，1-2位
    //  ss: 秒，2位
    //  S: 毫秒
    
}

- (void)setupNav {
    //这样隐藏式没用的
    self.navigationController.navigationBar.alpha = 0.0;
    //隐藏时候要设置一个空图片
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
}

- (void)imageType {
    NSString *ceshi = @"http://pic.qiantucdn.com/58pic/12/58/81/17d58PICJHV.gif";
    NSLog(@"%@", ceshi.contentTypeForImage);

}


- (void)printSystemFontName {
    for (NSString *familyName in [UIFont familyNames]) {
        NSLog(@"%@", familyName);
        NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
        for (NSString *fointName in fontNames) {
            NSLog(@"\t|- %@", fointName);
        }
    }
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
    
    //这个是普通的modal
    ModalController *vc = [[ModalController alloc] init];
//    vc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
//    [self presentViewController:vc animated:YES completion:nil];
    
    
    //modal出透明的界面(注意: 8.0以后才支持) 这个比较有用!!!
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        vc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
        [self presentViewController:vc animated:YES completion:nil];
    }
    
    
    
    
    //删除NSUserDefaults所有的记录
    [self removeUserDdfaultTwo];
    
}
//移除NSUserDefaults所有记录方法一(直接一下全部删除)
- (void)removeUserDdfaultOne {
    //方法一
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
}
//移除NSUserDefaults所有记录方法二(一个一个删除)
- (void)removeUserDdfaultTwo {
    NSUserDefaults *defs = [NSUserDefaults standardUserDefaults];
    NSDictionary *dict = [defs dictionaryRepresentation];
    for (id key in dict) {
        [defs removeObjectForKey:key];
    }
    [defs synchronize];
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
