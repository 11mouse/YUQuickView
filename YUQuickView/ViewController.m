//
//  ViewController.m
//  YUQuickView
//
//  Created by duan on 14/10/27.
//  Copyright (c) 2014年 duan. All rights reserved.
//

#import "ViewController.h"
#import "YUQuickView.h"
@interface ViewController ()
{
    YUQuickView *easyUI;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    easyUI=[YUQuickView defaultIntance];
    [easyUI enableQuickView:YES];
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake(10, 100, 80, 20);
    [btn setTitle:@"测试按钮" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
    UIView *testView=[[UIView alloc] initWithFrame:CGRectMake(0, 90, 200, 50)];
    [self.view addSubview:testView];
    
    UIView *testView1=[[UIView alloc] initWithFrame:CGRectMake(1, 0, 120, 30)];
    [testView addSubview:testView1];
    
    UIView *testView2=[[UIView alloc] initWithFrame:CGRectMake(2, 0, 120, 30)];
    [testView addSubview:testView2];
    
    UIView *testView3=[[UIView alloc] initWithFrame:CGRectMake(3, 0, 120, 30)];
    [testView1 addSubview:testView3];
    
    UILabel *textLabel=[[UILabel alloc] initWithFrame:CGRectMake(10, 100, 80, 20)];
    textLabel.textColor=[UIColor blackColor];
    textLabel.text=@"text test";
    [self.view addSubview:textLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
