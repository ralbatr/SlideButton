//
//  ViewController.m
//  SlideButton
//
//  Created by Ralbatr on 15/7/22.
//  Copyright © 2015年 ralbatr Yi. All rights reserved.
//

#import "ViewController.h"
#import "SlideButton.h"

@interface ViewController ()<SlideButtonDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor brownColor];
    // Do any additional setup after loading the view, typically from a nib.
    SlideButton *button = [[SlideButton alloc] initWithFrame:CGRectMake(20, 40, 40, 120)];
    button.delegate = self;
    [self.view addSubview:button];
}

- (void)slideupButton {
    NSLog(@"slideUpButton");
}

- (void)slideMiddleButton {
    NSLog(@"slideMiddleButton");
}

- (void)slideDownButton {
    NSLog(@"slideDownButton");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
