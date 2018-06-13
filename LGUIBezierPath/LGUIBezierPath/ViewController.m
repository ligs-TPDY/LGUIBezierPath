//
//  ViewController.m
//  LGUIBezierPath
//
//  Created by carnet on 2018/6/11.
//  Copyright © 2018年 LG. All rights reserved.
//

#import "ViewController.h"
#import "BezierPathView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)loadView
{
    self.view = [[BezierPathView alloc]init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
   
}

@end
