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
        _button.frame = CGRectMake(0, self.frame.size.height/3, 30, 30);
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
    NSLog(@"UIPanGestureRecognizer");
//    CGPoint point = [pan translationInView:self];
//    CGPoint rightTmpPoint = self.center;
//    rightTmpPoint.x += point.x;
//
//    if(pan.state == UIGestureRecognizerStateBegan) {
//
//    } else if (pan.state == UIGestureRecognizerStateChanged) {
//        if ( ScreenWidth - rightTmpPoint.x < _rightView.frame.size.width/2) {
//            _rightView.center = rightTmpPoint;
//            // 把另一个menuview隐藏
//            _leftView.frame = leftFrame;
//        }
//        [pan setTranslation:CGPointZero inView:_leftView];
//    } else if (pan.state == UIGestureRecognizerStateEnded) {
//        [UIView animateWithDuration:0.9 animations:^{
//            if (_rightView.center.x >= _leftView.frame.size.width/2) {
//                _rightView.frame = IS_Pad?kRightOutFrameIpad:kRightOutFrame;
//                _isNoTapAction = YES;
//            } else {
//                _rightView.frame = IS_Pad?kRightInFrameIpad:kRightInFrame;
//                _isNoTapAction = NO;
//            }
//            
//        }];
//        [pan setTranslation:CGPointZero inView:_leftView];
//    }
}

- (void)setUpImageName:(NSString *)upImageName MiddleImageName:(NSString *)middleImageName DownImageName:(NSString *)downImageName
{
    
}

@end
