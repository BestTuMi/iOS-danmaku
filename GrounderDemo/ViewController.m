//
//  ViewController.m
//  GrounderDemo
//
//  Created by 贾楠 on 16/3/8.
//  Copyright © 2016年 贾楠. All rights reserved.
//

#import "ViewController.h"
#import "GrounderSuperView.h"
@interface ViewController()
{
    GrounderSuperView *superView;
}
@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 50, 50);
    button.backgroundColor = [UIColor blackColor];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

    superView = [[GrounderSuperView alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, 140)];
    [self.view addSubview:superView];
}

- (void)buttonClick{
    [superView setModel:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
