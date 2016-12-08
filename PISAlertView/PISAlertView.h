//
//  PISAlertView.h
//  PISAlertView
//
//  Created by 灌汤包的大蒸笼 on 2016/12/8.
//  Copyright © 2016年 灌汤包的大蒸笼. All rights reserved.
//
//  因为iOS8 以后UIAlertView已经不推荐使用 所以自己简单封装了一下UIAlertView 和
//  UIAlertController 根据系统自动选择 封装的比较简单 为了方便使用而已
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// block回调 点击方法
typedef void (^ClickAction)();

// alert样式
typedef enum{
    PISAlertViewStyleNormal = 0,
    PISAlertViewStyleSheet
}PISAlertViewStyle;


@interface PISAlertView : NSObject 

@property (nonatomic, copy) NSString *titleStr;
@property (nonatomic, copy) NSString *messageStr;
@property (nonatomic, assign) PISAlertViewStyle alertStyle;


/**
 * @brief 初始化title message
 */
- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message;

/**
 * @brief 显示alert 以及设置alert类型
 */
- (void)showWithView:(UIViewController *)showView
           TypeStyle:(PISAlertViewStyle)typeStyle;

/**
 * @brief 添加按钮及事件，回调点击方法
 */
- (void)addBtnTitle:(NSString *)title action:(ClickAction)action;

NS_ASSUME_NONNULL_END

@end
