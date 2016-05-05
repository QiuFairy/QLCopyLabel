//
//  ViewController.m
//  QLCopyLabel
//
//  Created by qiu on 16/5/5.
//  Copyright © 2016年 QiuFairy. All rights reserved.
//

#import "ViewController.h"
#import "QLCLabel.h"


@interface ViewController ()
@property (nonatomic, strong) QLCLabel *label;
@property (nonatomic, strong) UITextField *textfield;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.label = [[QLCLabel alloc]initWithFrame:CGRectMake(100, 100, 200, 44)];
    self.label.backgroundColor = [UIColor lightGrayColor];
    self.label.text = @"woaini";
    [self.view addSubview:self.label];
    
    
    self.textfield = [[UITextField alloc]initWithFrame:CGRectMake(100, 200, 200, 44)];
    self.textfield.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.textfield];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
