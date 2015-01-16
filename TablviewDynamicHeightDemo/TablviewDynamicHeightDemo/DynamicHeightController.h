//
//  DynamicHeightController.h
//  TablviewDynamicHeightDemo
//
//  Created by Fox on 15/1/16.
//  Copyright (c) 2015年 FoxBabe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DynamicHeightController : UIViewController

// type 1:创建一个Label，赋值后返回相应的高度   2:使用UIView的systemLayoutSizeFittingSize方法进行计算
@property (nonatomic, assign) int type;
@property (nonatomic, weak) IBOutlet UITableView *maintableview;

@end
