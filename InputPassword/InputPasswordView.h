//
//  InputPasswordView.h
//  National Wallet
//
//  Created by 谢 on 2018/4/26.
//  Copyright © 2018年 chaos technology. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum PasswordUnitStyle {
    PasswordUnitStypeFrame,           //边框
    PasswordUnitStypeBottomLine,      //下划线
    PasswordUnitStypeFrameClearance,  //间隙
} PasswordUnitStyle;
typedef void (^InputPasswordComplete)(NSString *inputDetail);
@interface InputPasswordView : UIView
@property (nonatomic, strong) UITextField *inputNumber;
@property (nonatomic, assign) PasswordUnitStyle passwordUnitStyle;
@property (nonatomic, strong) NSString *spotSign;

/**
 实例化控件

 @param frame frame
 @param completer 输入完成回调
 */
+ (instancetype)inputPasswordViewframe:(CGRect)frame
                              complete:(InputPasswordComplete)completer;

/**
成为第一响应
 */
- (void)inputBecomeFirstResponder;

- (void)inputPasswordViewArray:(NSArray *)labelArray
             passwordUnitStyle:(PasswordUnitStyle)passwordUnitStyle
                      complete:(InputPasswordComplete)completer;

- (void)enterNumber:(NSString *)detail;
- (void)clean;
- (void)deleteNumber;
@end
