//
//  InputPasswordView.m
//  National Wallet
//
//  Created by 谢 on 2018/4/26.
//  Copyright © 2018年 chaos technology. All rights reserved.
//
#import "InputPasswordView.h"
//#import <Masonry/Masonry.h>
#define RGBA(r, g, b, a) [UIColor colorWithRed:r / 255.0f green:g / 255.0f blue:b / 255.0f alpha:a]
#define RGB(r, g, b) RGBA(r, g, b, 1.0f)

@interface InputPasswordView ()
@property (nonatomic, copy) InputPasswordComplete inputPasswordComplete;
@property (nonatomic, strong) NSMutableArray *allUnitArray;
@property (nonatomic, strong) UIButton *inputPasswordClickAction;

@end
@implementation InputPasswordView

+ (instancetype)inputPasswordViewframe:(CGRect)frame complete:(InputPasswordComplete)completer {

    InputPasswordView *inputV = [[InputPasswordView alloc] initWithFrame:frame];
    inputV.inputPasswordComplete = completer;
    return inputV;
}
- (void)inputBecomeFirstResponder {
    [self.inputNumber becomeFirstResponder];
}

- (void)ClickInput {
    [_inputNumber becomeFirstResponder];
}

- (UITextField *)inputNumber {
    if (!_inputNumber) {
        _inputNumber = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 1, 1)];
        _inputNumber.keyboardType = UIKeyboardTypeNumberPad;
        [_inputNumber addTarget:self action:@selector(enterNumer:) forControlEvents:UIControlEventEditingChanged];
    }
    return _inputNumber;
}
- (void)enterNumer:(UITextField *)sender {
    for (int i = 0; i <= 6; i++) {
        UILabel *num = [self viewWithTag:i + 1];
        if (num.tag <= sender.text.length && num) {
            num.text = [sender.text substringWithRange:NSMakeRange(i, 1)];
        } else {
            num.text = @"";
        }
    }
    if (sender.text.length == 6) {
        self.inputPasswordComplete(sender.text);
    }
}
- (void)enterNumber:(NSString *)detail {
    for (int i = 0; i <= 6; i++) {
        UILabel *num = [self viewWithTag:i + 1];
        if (num.tag <= detail.length && num) {
            num.text = self.spotSign;
        } else {
            num.text = @"";
        }
    }
    if (detail.length == 6) {
        self.inputPasswordComplete(detail);
    }
}
- (void)Change:(UITextField *)text {
    for (int i = 0; i <= 6; i++) {
        UILabel *num = [self viewWithTag:i + 1];
        if (num.tag <= text.text.length) {
            num.text = self.spotSign;
        } else {
            num.text = @"";
        }
    }
    if (text.text.length == 6) {
        self.inputPasswordComplete(self.inputNumber.text);
    }
}
/** @lazy <#item#> */
- (NSString *)spotSign {
    if (!_spotSign) {
        _spotSign = @"✽";
    }
    return _spotSign;
}

- (void)inputPasswordViewArray:(NSArray *)labelArray
             passwordUnitStyle:(PasswordUnitStyle)passwordUnitStyle
                      complete:(InputPasswordComplete)completer {
    self.passwordUnitStyle = passwordUnitStyle;

    [self setupUI];
    [self.inputNumber setSecureTextEntry:YES];
    self.inputPasswordComplete = completer;
}

- (void)setupUI {
    for (int i = 0; i < self.allUnitArray.count; i++) {
        UIView *unitView = self.allUnitArray[i];
        [self addSubview:unitView];
    }
    [self addSubview:self.inputNumber];
    [self addSubview:self.inputPasswordClickAction];
}

/** @lazy <#item#> */
- (UIButton *)inputPasswordClickAction {
    if (!_inputPasswordClickAction) {
        _inputPasswordClickAction = [[UIButton alloc] init];
        [_inputPasswordClickAction addTarget:self action:@selector(ClickInput) forControlEvents:UIControlEventTouchUpInside];
    }
    return _inputPasswordClickAction;
}

- (NSMutableArray *)allUnitArray {
    if (!_allUnitArray) {
        _allUnitArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < 6; i++) {
            UIView *unit = [[UIView alloc] init];
            UILabel *unit_LB = [[UILabel alloc] init];
            [unit addSubview:unit_LB];
            unit_LB.tag = i + 1;
            unit_LB.textAlignment = NSTextAlignmentCenter;
            unit_LB.backgroundColor = [UIColor clearColor];
            unit_LB.textColor = [InputPasswordView colorWithHexString:@"#7190d7"];
            [_allUnitArray addObject:unit];
            unit_LB.textAlignment = NSTextAlignmentCenter;
            unit_LB.font = [UIFont systemFontOfSize:20];
        }
    }
    return _allUnitArray;
}

- (void)clean {
    self.inputNumber.text = @"";
    for (int i = 0; i <= 6; i++) {
        UILabel *num = [self viewWithTag:i + 1];
        num.text = @"";
    }
}

- (void)updateConstraints {
    [super updateConstraints];
    __weak __typeof(self) weakSelf = self;
//    [self.inputPasswordClickAction mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(weakSelf).mas_offset(0);
//    }];
//
//    for (int i = 0; i < 6; i++) {
//        UIView *unit = self.allUnitArray[i];
//        [unit mas_remakeConstraints:^(MASConstraintMaker *make) {
//            float border = 0;
//            if (weakSelf.passwordUnitStyle == PasswordUnitStypeFrameClearance) {
//                border = 10;
//            }
//            make.width.equalTo(weakSelf.mas_width).multipliedBy(1 / 6.0).offset(-border);
//            make.top.equalTo(weakSelf);
//            make.height.mas_equalTo(unit.mas_width);
//            if (i == 0) {
//                make.left.mas_equalTo(border / 2);
//            } else {
//                UIView *unit = self.allUnitArray[i - 1];
//                make.left.equalTo(unit.mas_right).offset(border);
//            }
//
//            UILabel *unit_LB = [self viewWithTag:i + 1];
//            [unit_LB mas_remakeConstraints:^(MASConstraintMaker *make) {
//                make.center.equalTo(unit);
//            }];
//            switch (self.passwordUnitStyle) {
//                case PasswordUnitStypeFrame:
//                    unit.backgroundColor = [InputPasswordView colorWithHexString:@"#F9F9F9"];
//                    self.layer.masksToBounds = YES;
//                    self.layer.borderWidth = 1;
//                    self.layer.borderColor = RGB(219, 219, 219).CGColor;
//                    self.layer.cornerRadius = 5;
//                    unit.layer.borderWidth = 0.5;
//                    unit.layer.borderColor = RGB(219, 219, 219).CGColor;
//                    unit_LB.font = [UIFont systemFontOfSize:15];
//
//                    break;
//                case PasswordUnitStypeBottomLine: {
//                    int border = 5;
//                    UIView *line = [[UIView alloc] init];
//                    [unit addSubview:line];
//                    [line mas_remakeConstraints:^(MASConstraintMaker *make) {
//                        make.left.mas_equalTo(border);
//                        make.right.mas_equalTo(-border);
//                        make.bottom.mas_equalTo(-3);
//                        make.height.mas_equalTo(3);
//                    }];
//                    line.backgroundColor = [InputPasswordView colorWithHexString:@"#222847"];
//                } break;
//                case PasswordUnitStypeFrameClearance: {
//                    unit.backgroundColor = [InputPasswordView colorWithHexString:@"#F9F9F9"];
//                    unit.layer.masksToBounds = YES;
//                    unit.layer.borderWidth = 1;
//                    unit.layer.borderColor = RGB(219, 219, 219).CGColor;
//                    unit.layer.cornerRadius = 5;
//
//                    break;
//                }
//
//                default:
//                    break;
//            }
//        }];
//    }
}

- (void)deleteNumber {
    [self Change:self.inputNumber];
}


+ (UIColor *)colorWithHexString:(NSString *)color {
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];

    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    // 判断前缀
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    // 从六位数值中找到RGB对应的位数并转换
    NSRange range;
    range.location = 0;
    range.length = 2;
    //R、G、B
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];

    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:1.0f];
}

@end
