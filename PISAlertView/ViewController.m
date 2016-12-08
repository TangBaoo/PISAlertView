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
    button1.frame = CGRectMake(0, 0, 100, 40);
    button1.backgroundColor = [UIColor brownColor];
    [self.view addSubview:button1];
    button1.center = self.view.center;
    [button1 addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
