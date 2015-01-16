//
//  DynamicHeightController.m
//  TablviewDynamicHeightDemo
//
//  Created by Fox on 15/1/16.
//  Copyright (c) 2015年 FoxBabe. All rights reserved.
//

#import "DynamicHeightController.h"
#import "DynamicHeightCell.h"

@interface DynamicHeightController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) UILabel *heightLabel;
@property (nonatomic, strong) DynamicHeightCell *dynamicHeightCell;

@end

@implementation DynamicHeightController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"高度自适应";
    
    self.maintableview.delegate = self;
    self.maintableview.dataSource = self;
    [self.maintableview registerNib:[UINib nibWithNibName:@"DynamicHeightCell" bundle:nil]
             forCellReuseIdentifier:@"DynamicHeightCell"];
    
    self.dataSource = [[NSMutableArray alloc] init];
    [self.dataSource addObject:@"列表高度自适应Demo"];
    [self.dataSource addObject:@"利用自动布局，高度自适应Demo"];
    [self.dataSource addObject:@"利用自动布局，高度自适应Demo，利用自动布局，高度自适应Demo，利用自动布局，高度自适应Demo，利用自动布局，高度自适应Demo"];
    
    self.dynamicHeightCell = [self.maintableview dequeueReusableCellWithIdentifier:@"DynamicHeightCell"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DynamicHeightCell *cell = [self.maintableview dequeueReusableCellWithIdentifier:@"DynamicHeightCell"
                                                                       forIndexPath:indexPath];
    cell.name.text = [self.dataSource objectAtIndex:indexPath.row];
    
    return cell;
}


#pragma mark - UITableViewDelegate methods
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.type == 1) {
        if (self.heightLabel == nil) {
            self.heightLabel = [[UILabel alloc] initWithFrame:
                                CGRectMake(0.0f, 0.0f, CGRectGetWidth(self.view.frame) - 28.0f, CGFLOAT_MAX)];
            self.heightLabel.numberOfLines = 0;
            self.heightLabel.font = [UIFont systemFontOfSize:17.0f];
        }
        
        [self.heightLabel setFrame:CGRectMake(0.0f, 0.0f, CGRectGetWidth(self.view.frame) - 28.0f, CGFLOAT_MAX)];
        self.heightLabel.text = [self.dataSource objectAtIndex:indexPath.row];
        [self.heightLabel sizeToFit];
        
        return self.heightLabel.frame.size.height + 75;
    }else{
        self.dynamicHeightCell.name.text = [self.dataSource objectAtIndex:indexPath.row];
        [self.dynamicHeightCell.contentView updateConstraintsIfNeeded];
        [self.dynamicHeightCell.contentView layoutIfNeeded];
        CGSize size = [self.dynamicHeightCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
        return 1  + size.height;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
