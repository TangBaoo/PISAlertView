//
//  ViewController.m
//  PISAlertView
//
//  Created by 灌汤包的大蒸笼 on 2016/12/8.
//  Copyright © 2016年 灌汤包的大蒸笼. All rights reserved.
//

#import "ViewController.h"
#import "PISAlertView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame = CGRectMake(0, 0, 150, 40);
    button1.backgroundColor = [UIColor brownColor];
    [self.view addSubview:button1];
    button1.center = self.view.center;
    [button1 setTitle:@"alert" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame = CGRectMake(button1.frame.origin.x, button1.frame.origin.y + 100, 150, 40);
    button2.backgroundColor = [UIColor grayColor];
    [button2 setTitle:@"sheet" forState:UIControlStateNormal];
    [self.view addSubview:button2];
    [button2 addTarget:self action:@selector(buttonClick2) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonClick
{
    PISAlertView *alert = [[PISAlertView alloc] initWithTitle:@"这是个提示" message:@"提示了很多信息"];
    [alert addBtnTitle:@"确定" action:^{
        NSLog(@"确定了");
    }];
    [alert addBtnTitle:@"取消" action:^{
        NSLog(@"cancel");
    }];
    [alert showWithView:self TypeStyle:PISAlertViewStyleNormal];
}

- (void)buttonClick2
{
    PISAlertView *alert = [[PISAlertView alloc] initWithTitle:@"这是个提示" message:@"提示了很多信息"];
    [alert addBtnTitle:@"确定" action:^{
        NSLog(@"确定了");
    }];
    [alert addBtnTitle:@"取消" action:^{
        NSLog(@"cancel");
    }];
    [alert showWithView:self TypeStyle:PISAlertViewStyleSheet];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
