//
//  WebViewController.m
//  ZPTips
//
//  Created by yueru on 2016/11/29.
//  Copyright © 2016年 yueru. All rights reserved.
//  给webView添加头部视图

#import "WebViewController.h"
#import "ModalController.h"

@interface WebViewController ()

@property (nonatomic, weak) UIWebView *webView;

@end

@implementation WebViewController

- (void)loadView {
    UIWebView *webView = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.webView = webView;
    self.view = self.webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //给webView添加头部视图
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]]];
    UIView *webBrowSerView = self.webView.scrollView.subviews[0]; //拿到webView的webBrowserView
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40);
    button.backgroundColor = [UIColor orangeColor];
    [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.webView insertSubview:button belowSubview:self.webView.scrollView]; //把backHeadImageView插入到webView的scrollView下面
    CGRect frame = webBrowSerView.frame;
    frame.origin.y = CGRectGetMaxY(button.frame);
    webBrowSerView.frame = frame; //更改webBrowserView的frame向下移backHeadImageView的高度，使其可见
}

- (void)click {
    
}


@end
