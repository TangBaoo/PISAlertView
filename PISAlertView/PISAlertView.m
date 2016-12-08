//
//  PISAlertView.m
//  PISAlertView
//
//  Created by 灌汤包的大蒸笼 on 2016/12/8.
//  Copyright © 2016年 灌汤包的大蒸笼. All rights reserved.
//

#define IOS_8 ([UIDevice currentDevice].systemVersion.floatValue >= 8.0)

#import "PISAlertView.h"

@interface PISAlertView () <UIAlertViewDelegate,UIActionSheetDelegate>

@property (nonatomic, strong) NSMutableArray *buttonArray;
@property (nonatomic, strong) NSMutableArray *actionArray;
@property (nonatomic, weak) UIViewController *showController;

@end

@implementation PISAlertView

// 重写该方法，保证该对象不会被释放，如果被释放，iOS8以下的UIAlertView不会回调
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    static PISAlertView *_pisAlertView = nil;
    dispatch_once(&onceToken, ^{
        if (_pisAlertView == nil) {
            _pisAlertView = [super allocWithZone:zone];
        }
    });
    return _pisAlertView;
}

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message
{
    if (self = [super init]) {
        
        self.buttonArray = [[NSMutableArray alloc] init];
        self.actionArray = [[NSMutableArray alloc] init];
        self.messageStr = message;
        self.titleStr = title;
        
    }
    return self;
}

- (void)addBtnTitle:(NSString *)title action:(ClickAction)action
{
    [_buttonArray addObject:title];
    [_actionArray addObject:action];
}

- (void)showWithView:(UIViewController *)showView TypeStyle:(PISAlertViewStyle)typeStyle
{
    self.showController = showView;
    self.alertStyle = typeStyle;
    
    if (IOS_8) {
        [self createAlertController];
    } else {
        [self createAlertView];
    }
}

- (void)createAlertView
{
    if (_alertStyle == PISAlertViewStyleNormal) {
        
        [self createNormalAlertView];
    } else if (_alertStyle == PISAlertViewStyleSheet) {
        
        [self createSheetAlertView];
    }
}

- (void)createNormalAlertView
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:_titleStr message:_messageStr delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
    
    for (NSString *titles in _buttonArray) {
        [alertView addButtonWithTitle:titles];
    }
    [alertView show];
}

// actionSheet默认带取消 创建时候不需要创建取消按钮
- (void)createSheetAlertView
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:_titleStr delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:nil, nil];
    
    actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
    for (NSString *titles in _buttonArray) {
        [actionSheet addButtonWithTitle:titles];
    }
    [actionSheet showInView:_showController.view];
}

- (void)createAlertController
{
    [self createNormalAlertController];
}

- (void)createNormalAlertController
{
    UIAlertControllerStyle StyleAlert;
    if (_alertStyle == PISAlertViewStyleNormal) {
        StyleAlert = UIAlertControllerStyleAlert;
    } else if (_alertStyle == PISAlertViewStyleSheet) {
        StyleAlert = UIAlertControllerStyleActionSheet;
    }
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:_titleStr message:_messageStr preferredStyle:StyleAlert];
    
    for (int i = 0; i < _buttonArray.count; i++) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:_buttonArray[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            ClickAction ac = _actionArray[i];
            ac();
        }];
        [alertController addAction:action];
    }
    if (_showController) {
        [_showController showDetailViewController:alertController sender:nil];
    }
}


#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    ClickAction action = _actionArray[buttonIndex];
    action();
}

#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex) {
        
        ClickAction action = _actionArray[buttonIndex - 1];
        action();
    }
}

@end
