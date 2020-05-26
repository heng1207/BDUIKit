//
//  JCViewController.m
//  BDUIKit
//
//  Created by Your zhangheng on 04/18/2020.
//  Copyright (c) 2020 Your zhangheng. All rights reserved.
//

#import "JCViewController.h"
#import <BDUIKit/BDUIKit.h>

@interface JCViewController ()

@end

@implementation JCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButtonEnlarge *btn =[[UIButtonEnlarge alloc]init];
    [self.view addSubview:btn];
    
//    UIViewController *vc =[[TemplateManger shareInstance] getVC];
//    [self.view addSubview:vc.view];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
