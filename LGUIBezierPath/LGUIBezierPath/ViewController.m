//
//  ViewController.m
//  LGUIBezierPath
//
//  Created by carnet on 2018/6/11.
//  Copyright © 2018年 LG. All rights reserved.
//

#import "ViewController.h"
#import "BezierPathView.h"
#import "CoreGraphicsView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CoreGraphicsView *view = [[CoreGraphicsView alloc]initWithFrame:self.view.frame];
    view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view];
}

@end
