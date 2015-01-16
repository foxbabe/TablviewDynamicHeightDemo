//
//  ViewController.m
//  TablviewDynamicHeightDemo
//
//  Created by Fox on 15/1/16.
//  Copyright (c) 2015年 FoxBabe. All rights reserved.
//

#import "ViewController.h"
#import "DynamicHeightController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showTableviewAction:(id)sender {
    
    UIButton *button = sender;
    
    DynamicHeightController *detailVC = [[DynamicHeightController alloc]
                                         initWithNibName:@"DynamicHeightController" bundle:nil];
    detailVC.type = button.tag - 3000;
    [self.navigationController pushViewController:detailVC animated:YES];
    
}
@end
