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
    button.tag = 101;
    [self.view addSubview:button];
    
    SlideButton *button1 = [[SlideButton alloc] initWithFrame:CGRectMake(90, 40, 40, 120)];
    button1.delegate = self;
    button1.tag = 201;
    [self.view addSubview:button1];
}

- (void)slideupButtonWithTag:(NSInteger)tag {
    
    if (tag == 101) {
        NSLog(@"101slideUpButton");
    } else {
        NSLog(@"102slideUpButton");
    }
    
}

- (void)slideMiddleButtonWithTag:(NSInteger)tag {
    NSLog(@"slideMiddleButton");
}

- (void)slideDownButtonWithTag:(NSInteger)tag {
    NSLog(@"slideDownButton");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
