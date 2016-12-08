# PISAlertView
因为iOS8 以后UIAlertView已经不推荐使用 但是还需要兼容iOS7
所以自己简单封装了一下UIAlertView 和 UIAlertController
根据系统自动选择 封装的比较简单 为了方便使用而已

# 使用方法
PISAlertView *alert = [[PISAlertView alloc] initWithTitle:@"这是个提示" message:@"提示了很多信息"];
[alert addBtnTitle:@"确定" action:^{
NSLog(@"确定了");
}];
[alert addBtnTitle:@"取消" action:^{
NSLog(@"cancel");
}];
[alert showWithView:self TypeStyle:PISAlertViewStyleNormal];
