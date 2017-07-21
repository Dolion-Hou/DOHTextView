//
//  ViewController.m
//  DOHTextView
//
//  Created by Dolion.Hou on 2017/7/19.
//  Copyright © 2017年 Dolion.Hou. All rights reserved.
//

#import "ViewController.h"
#import "DOHTextView.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIButton *button;

@end

@implementation ViewController{
    DOHTextView *_textView;
    UILabel *_tipLabel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setConfigure];
    [self addOwnSubviews];
}

- (void)setConfigure{
    self.view.backgroundColor = [UIColor lightGrayColor];
}

- (void)addOwnSubviews{
    _textView = [[DOHTextView alloc] initWithFrame:CGRectMake(15, 120, [UIScreen mainScreen].bounds.size.width - 30, 240)];
    [self.view addSubview:_textView];
    [self setTextViewConfigure];
}

- (void)setTextViewConfigure{
    _textView.placeholderText = @"请写下您的宝贵的意见，我们将及时采纳。再次感谢您的反馈";
    _textView.maxNumberOfWords = 15;
    _textView.minNumberOfWords = 5;
    _textView.backgroundColor = [UIColor yellowColor];
    [_textView setTextViewCornerRadius:10 borderWidth:1 borderColor:[UIColor greenColor] shadowOffset:CGSizeZero shadowColor:nil shadowOpacity:1 shadowPath:nil shadowRadius:0];
}

- (IBAction)sender:(UIButton *)sender {
    if (_textView.isAllow) {//允许提交
      //发送网络请求
    }else{
        [self creatTipLabel:_textView.handleTip];
    }
}

- (void)creatTipLabel:(NSString *)tipWords{
    _tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 25)];
    _tipLabel.center = self.view.center;
    [self.view addSubview:_tipLabel];
    
    [_tipLabel setFont:[UIFont systemFontOfSize:13]];
    [_tipLabel setTextColor:[UIColor redColor]];
    _tipLabel.backgroundColor = [UIColor yellowColor];
    _tipLabel.layer.cornerRadius = 12.5;
    _tipLabel.layer.borderWidth = 0.5;
    _tipLabel.layer.borderColor = [UIColor orangeColor].CGColor;
    _tipLabel.text = tipWords;
    _tipLabel.textAlignment = NSTextAlignmentCenter;
    
    [UIView animateWithDuration:1.25 animations:^{
        _tipLabel.frame =CGRectMake(0, 0, 200, 25);
        _tipLabel.center = self.view.center;
    } completion:^(BOOL finished) {
        [_tipLabel removeFromSuperview];
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_textView resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
