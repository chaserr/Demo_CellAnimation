//
//  ViewController.m
//  TableViewTestAnimation
//
//  Created by 童星 on 16/6/16.
//  Copyright © 2016年 童星. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIView *singleMapView;
@end

@implementation ViewController
- (IBAction)clickEvent:(id)sender {
    
    [_singleMapView removeFromSuperview];

    UIView *singleMapView = [[UIView alloc]
                             initWithFrame:CGRectMake(50, 150, 300, 250)];
    singleMapView.backgroundColor = [UIColor colorWithRed:0.120 green:0.543 blue:0.311 alpha:1.000];
    _singleMapView= singleMapView;
    [self.view addSubview:singleMapView];
    
    
    singleMapView.transform = CGAffineTransformMakeScale(1, 0.01);
    [UIView animateWithDuration:0.5
                     animations:^{
                         singleMapView.transform = CGAffineTransformMakeScale(1, 1);
                     }completion:^(BOOL finish){
                                              }];
    
}
- (IBAction)cancleClick:(id)sender {
    
    [UIView animateWithDuration:0.5
                     animations:^{
                         _singleMapView.transform = CGAffineTransformMakeScale(1, 0.01);
                     }completion:^(BOOL finish){
                         [_singleMapView removeFromSuperview];
                     }];
    
}




- (void)viewDidLoad {
    [super viewDidLoad];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
