//
//  ViewController.m
//  IQKeyBoard使用
//
//  Created by 黄章成 on 2017/7/27.
//  Copyright © 2017年 黄章成. All rights reserved.
//

#import "ViewController.h"
#import "IQKeyboardManager.h"
#import "TestViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.automaticallyAdjustsScrollViewInsets = NO;// 记得在xib中去掉AdjustsScrollViewInsets，或者在这里添加这句代码也行。
    
    IQKeyboardManager *mgr = [IQKeyboardManager sharedManager];
    mgr.enable = YES; // 开启
    mgr.enableAutoToolbar = YES; // 开启toolBar
//    mgr.toolbarDoneBarButtonItemText = @"xx";
    mgr.toolbarDoneBarButtonItemImage = [[UIImage imageNamed:@"44"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    mgr.shouldResignOnTouchOutside = YES; // 允许点击外面收回键盘
    mgr.keyboardDistanceFromTextField = 30; // textField距离键盘的距离（只有在键盘遮挡textField的情况下才起作用）
    
}
- (IBAction)push:(id)sender {
    
    TestViewController *vc = [[TestViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
