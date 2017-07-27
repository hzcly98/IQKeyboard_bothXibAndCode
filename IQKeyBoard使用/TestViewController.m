//
//  TestViewController.m
//  IQKeyBoard使用
//
//  Created by 黄章成 on 2017/7/27.
//  Copyright © 2017年 黄章成. All rights reserved.
//

#import "TestViewController.h"
#import "Masonry.h"

@interface TestViewController ()
@property (nonatomic, strong) UIScrollView *bgView;
@property (nonatomic, strong) UIView *contentView;
@end

@implementation TestViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"代码布局（Masonry）";
    
    [self initUI];

    self.view.backgroundColor = [UIColor lightGrayColor];
}

- (void)initUI {
    
    _bgView = [[UIScrollView alloc] init];
    [self.view addSubview:_bgView];
    _contentView = [[UIView alloc] init];
    [_bgView addSubview:_contentView];
    
//    _bgView.backgroundColor = [UIColor redColor];
//    _contentView.backgroundColor = [UIColor yellowColor];
    
    // 设置底部scrollview约束
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsZero);
    }];
    
    // 设置contentview约束
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(_bgView).insets(UIEdgeInsetsZero);
        make.width.mas_equalTo(self.view);
    }];
    
    
    UIView *lastView;
    
    for (int i = 0; i < 6; i ++) {
        UITextField *textField = [[UITextField alloc] init];
        textField.placeholder = [NSString stringWithFormat:@"%d",i + 1];
        textField.backgroundColor = [UIColor whiteColor];
        [_contentView addSubview:textField];
        
        [textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_contentView).offset(30);
            make.right.mas_equalTo(_contentView).offset(-30);
            make.height.mas_equalTo(30);
            if (i == 0) {
                make.top.mas_equalTo(_contentView).offset(60);
            }else{
                make.top.mas_equalTo(lastView.mas_bottom).offset(60);
            }
            
        }];
        lastView = textField;
    }
    
    [lastView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(_contentView.mas_bottom).offset(-30);
    }];
    
}


@end
