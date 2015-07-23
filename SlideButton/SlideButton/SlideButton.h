//
//  SlideButton.h
//  SlideButton
//
//  Created by Ralbatr on 15/7/22.
//  Copyright © 2015年 ralbatr Yi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SlideButtonDelegate <NSObject>

- (void)slideupButton;

- (void)slideDownButton;

@end



@interface SlideButton : UIView

@property (nonatomic,weak) id <SlideButtonDelegate> delegate;

#pragma mark 设置三个状态名字
- (void)setUpImageName:(NSString *)upImageName MiddleImageName:(NSString *)middleImageName DownImageName:(NSString *)downImageName ;

@end
