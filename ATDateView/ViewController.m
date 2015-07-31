//
//  ViewController.m
//  ATDateView
//
//  Created by ATBJB15 on 15/7/31.
//  Copyright (c) 2015年 AT. All rights reserved.
//

#import "ViewController.h"
#import "MyDatePicker.h"

#define kWindowW ([UIApplication sharedApplication].keyWindow.bounds.size.width)
#define kWindowH ([UIApplication sharedApplication].keyWindow.bounds.size.height)

@interface ViewController ()
- (IBAction)btnClick:(id)sender;

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)btnClick:(id)sender {
    
    MyDatePicker *myDatePicker = [[MyDatePicker alloc] initWithFrame:CGRectMake(0, 0,kWindowW,kWindowH)];
    [[UIApplication sharedApplication].keyWindow addSubview:myDatePicker];
    [MyDatePicker exChangeOut:myDatePicker dur:0.5];
//    __weak ViewController *weakSelf = self;
    myDatePicker.MyDatePicker = ^(NSString *tempS){//block带出
        NSLog(@"您选中日期是:%@",tempS);
    };
}
@end
