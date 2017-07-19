//
//  DOHTextView.m
//
//  Created by Dolion.Hou on 2017/7/18.
//  Copyright © 2017年 Dolion.Hou. All rights reserved.
//

#import "DOHTextView.h"

@interface DOHTextView ()<UITextViewDelegate>

@end

@implementation DOHTextView{
    UILabel *_tipLabel;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setConfigure];
        [self addTextViewSubviews];
        self.delegate = self;
    }
    return self;
}

- (void)setConfigure{
    self.backgroundColor = [UIColor whiteColor];
    self.handleTip = @"请输入您的意见";
    self.isAllow = NO;
}

- (void)addTextViewSubviews{
     _tipLabel= [[UILabel alloc] init];
    [self addSubview:_tipLabel];
    [_tipLabel setTextColor:[UIColor grayColor]];
    [_tipLabel setFont:[UIFont systemFontOfSize:10]];
    _tipLabel.textAlignment = NSTextAlignmentCenter;
    _tipLabel.frame = CGRectMake(self.frame.size.width-105, self.frame.size.height-25, 100, 20);
    
    _tipLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _tipLabel.layer.borderWidth = 0.5;
    _tipLabel.layer.cornerRadius = 10;
    _tipLabel.layer.masksToBounds = YES;
    _tipLabel.hidden = YES;
}

- (void)setMaxNumberOfWords:(NSInteger)maxNumberOfWords{
    _maxNumberOfWords = maxNumberOfWords;
    _tipLabel.hidden = NO;
    _tipLabel.text = [NSString stringWithFormat:@"还可输入 %ld 字",maxNumberOfWords];
}

- (void)setDOHPlaceholderTextColor:(UIColor *)DOHPlaceholderTextColor{
    _DOHPlaceholderTextColor = DOHPlaceholderTextColor;
    [self setPlaceholderText:_placeholderText];
}

- (void)setPlaceholderText:(NSString *)placeholderText{
    _placeholderText = placeholderText;
    self.text = placeholderText;
    if (self.DOHPlaceholderTextColor) {
        self.textColor = self.DOHPlaceholderTextColor;
    }else{
        self.textColor = [UIColor grayColor];
    }
}
#pragma mark - UITextViewDelegate
- (void)textViewDidBeginEditing:(UITextView *)textView{
    if ([textView.text isEqualToString:self.placeholderText]) {
        textView.text = @"";
    }
    self.textColor = _DOHTextColor;
}

- (void)textViewDidEndEditing:(UITextView *)textView{
    [self setHandleTipWord:textView];
    [self setPlaceholderText:_placeholderText];
}

- (void)textViewDidChange:(UITextView *)textView{
    [self maxWordsDeal:textView];
    [self setHandleTipWord:textView];
}

- (void)textViewDidChangeSelection:(UITextView *)textView{
   [self setHandleTipWord:textView];
}
//设置提交提示信息
- (void)setHandleTipWord:(UITextView *)textView{
    if (textView.text.length >= _minNumberOfWords&&textView.text.length<=_maxNumberOfWords) {
        self.isAllow = YES;
    }else if(textView.text.length <_minNumberOfWords){
        self.isAllow = NO;
        self.handleTip = [NSString stringWithFormat:@"您至少要输入%ld文字",_minNumberOfWords];
    }else if(textView.text.length > _maxNumberOfWords){
        _handleTip = [NSString stringWithFormat:@"已超出 %ld 字",(textView.text.length - _maxNumberOfWords)];
        self.isAllow = NO;
    }else{
        self.isAllow = YES;
    }
}
//最大字数处理
- (void)maxWordsDeal:(UITextView *)textView{
    if (_maxNumberOfWords) {
        if (textView.text.length > _maxNumberOfWords) {
            _tipLabel.text = [NSString stringWithFormat:@"已超出 %ld 字",(textView.text.length - _maxNumberOfWords)];
            _tipLabel.textColor = [UIColor redColor];
        }else{
            _tipLabel.text = [NSString stringWithFormat:@"还可输入 %ld 字",(_maxNumberOfWords - textView.text.length)];
            _tipLabel.textColor = [UIColor blackColor];
        }
        _tipLabel.hidden = NO;
    }else{
        _tipLabel.hidden = YES;
    }
}

- (void)setTextViewCornerRadius:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor shadowOffset:(CGSize)shadowOffset shadowColor:(UIColor *)shadowColor shadowOpacity:(CGFloat)shadowOpacity shadowPath:(CGPathRef)shadowPath shadowRadius:(CGFloat)shadowRadius{
    if (!shadowRadius) {
        self.layer.cornerRadius = cornerRadius?cornerRadius:0;
        self.layer.masksToBounds = cornerRadius?YES:NO;
        self.layer.borderColor = borderColor?borderColor.CGColor:nil;
        self.layer.borderWidth = borderWidth?borderWidth:0;
    }else{
        self.layer.cornerRadius = cornerRadius?cornerRadius:0;
        self.layer.shadowRadius = shadowRadius?shadowRadius:0;
        self.layer.shadowColor = shadowColor?shadowColor.CGColor:nil;
        self.layer.shadowOpacity = shadowOpacity;
        self.layer.shadowOffset = shadowOffset;
        self.clipsToBounds = NO;
    }
}

@end
