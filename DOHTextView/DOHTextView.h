//
//  DOHTextView.h
//
//  Created by Dolion.Hou on 2017/7/18.
//  Copyright © 2017年 Dolion.Hou. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DOHTextViewDelegate <NSObject>
//敏感词汇检测  等待实现
- (void)warningOfContent;
@end

@interface DOHTextView : UITextView
//默认文字
@property (nonatomic, copy) NSString *placeholderText;
//要输入文字的颜色
@property (nonatomic, copy) UIColor *DOHTextColor;
//默认文字的颜色
@property (nonatomic, copy) UIColor *DOHPlaceholderTextColor;
//可输入最大文字的个数
@property (nonatomic, assign) NSInteger maxNumberOfWords;
//最少要输入的文字的个数
@property (nonatomic, assign) NSInteger minNumberOfWords;
//是否允许提交
@property (nonatomic) BOOL isAllow;
//提交提示
@property (nonatomic, copy) NSString *handleTip;

@property (nonatomic, weak) id<DOHTextViewDelegate> DOHDelegate;
//实例化方法之一
- (instancetype)initWithFrame:(CGRect)frame;
/*
 *设置textView的边框、阴影属性。
 *提示：当不想设置某个属性的时候
 *CGFloat类型设置为0；
 *UIColor设置为nil;
 *CGPathRef设置为nil;
 *CGSize设置为CGSizeZero;
 **/
- (void)setTextViewCornerRadius:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor shadowOffset:(CGSize)shadowOffset shadowColor:(UIColor *)shadowColor shadowOpacity:(CGFloat)shadowOpacity shadowPath:(CGPathRef)shadowPath shadowRadius:(CGFloat)shadowRadius;
@end
