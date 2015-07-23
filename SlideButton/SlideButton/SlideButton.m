//
//  SlideButton.m
//  SlideButton
//
//  Created by Ralbatr on 15/7/22.
//  Copyright © 2015年 ralbatr Yi. All rights reserved.
//

#import "SlideButton.h"

@interface SlideButton ()<UIGestureRecognizerDelegate>
{
    UIButton *_button;
}
@end

@implementation SlideButton


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self creatButton];
        [self addGestureRecognizer];
    }
    return self;
}

- (UIButton *)creatButton {
    if (nil == _button) {
        _button = [[UIButton alloc] init];
        _button.frame = CGRectMake(0, self.frame.size.height/3, self.frame.size.width, self.frame.size.height/3);
        _button.backgroundColor = [UIColor redColor];
        [self addSubview:_button];
    }
    return _button;
}

- (void)addGestureRecognizer
{
    // 创建手势识别器
    UIPanGestureRecognizer *upPan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(upPan:)];
    upPan.delegate = self;
    // 将手势识别器添加到对应的view上
    [_button addGestureRecognizer:upPan];
}

- (void)upPan:(UIPanGestureRecognizer *)pan
{
//    NSLog(@"UIPanGestureRecognizer");
    CGPoint point = [pan translationInView:self];
    CGPoint rightTmpPoint = _button.center;
    rightTmpPoint.y += point.y;
    
    CGFloat width = _button.frame.size.width;
    CGFloat height = self.frame.size.height;

//    NSLog(@"_button.frame.origin.y %f  self.frame.size.height %f",_button.frame.origin.y ,self.frame.size.height);
    if(pan.state == UIGestureRecognizerStateBegan) {

    } else if (pan.state == UIGestureRecognizerStateChanged) {
        if ( _button.frame.origin.y < self.frame.size.height && _button.frame.origin.y > -1 ) {
            _button.center = rightTmpPoint;
        }
        [pan setTranslation:CGPointZero inView:self];
    } else if (pan.state == UIGestureRecognizerStateEnded) {
        [UIView animateWithDuration:0.2 animations:^{
            // _button 的位置在 最上边的时候
            if ( _button.frame.origin.y < self.frame.size.height/3 ) {
                _button.frame = CGRectMake(0, 0, width, height/3);
                [_button setTitle:@"上" forState:UIControlStateNormal];
                [self.delegate slideupButtonWithTag:self.tag];
            }
            // _button 的位置在 中间的时候
            if ( _button.frame.origin.y > self.frame.size.height/3 && _button.frame.origin.y < self.frame.size.height*2/3) {
                _button.frame = CGRectMake(0, height/3, width, height/3);
                [_button setTitle:@"中" forState:UIControlStateNormal];
                [self.delegate slideMiddleButtonWithTag:self.tag];
            }
            // _button 的位置在 最下方的时候
            if (_button.frame.origin.y > self.frame.size.height*2/3) {
                _button.frame = CGRectMake(0, height/3*2, width, height/3);
                [_button setTitle:@"下" forState:UIControlStateNormal];
                [self.delegate slideDownButtonWithTag:self.tag];
            }
        }];
        [pan setTranslation:CGPointZero inView:self];
    }
}

- (void)setUpImageName:(NSString *)upImageName MiddleImageName:(NSString *)middleImageName DownImageName:(NSString *)downImageName
{
    _upImageName = upImageName;
    _middleImageName = middleImageName;
    _downImageName = downImageName;
}

@end
