//
//  LSJViewController.m
//  lsj-EnlargeEdge
//
//  Created by lsj on 10/17/2021.
//  Copyright (c) 2021 lsj. All rights reserved.
//

#import "LSJViewController.h"
#import "UIButton+LSJEnlargeEdge.h"

@interface LSJViewController ()

@end

@implementation LSJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIView *buttonView = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 130 + 100 + 50, 50 + 100)];
    buttonView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:buttonView];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 130, 50)];
    button.tag = 999;
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"我增大了点击范围" forState:UIControlStateNormal];
    [button lsj_setEnlargeEdgeWithTop:50 left:50 bottom:50 right:100];// 黄色区域内都可以触发
    [button lsj_setEnlargeEdge:50];
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:button];
//    [button addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(buttonClick)]];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(100, 250, 130, 50)];
    button2.backgroundColor = [UIColor blueColor];
    [button2 setTitle:@"我没有增大点击范围" forState:UIControlStateNormal];
    button2.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:button2];
    [button2 addTarget:self action:@selector(button2Click) forControlEvents:UIControlEventTouchUpInside];
}

-(void)buttonClick{
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"提示" message:@"button被点击" preferredStyle:UIAlertControllerStyleAlert];
        //默认只有标题 没有操作的按钮:添加操作的按钮 UIAlertAction
    //展示
    UIAlertAction *cancelBtn = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        }];
    [alertVc addAction:cancelBtn];
    [self presentViewController:alertVc animated:YES completion:nil];
}

-(void)button2Click{
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"提示" message:@"button2被点击" preferredStyle:UIAlertControllerStyleAlert];
        //默认只有标题 没有操作的按钮:添加操作的按钮 UIAlertAction
    //展示
    UIAlertAction *cancelBtn = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        }];
    [alertVc addAction:cancelBtn];
    [self presentViewController:alertVc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
