//
//  DynamicHeightCell.m
//  TablviewDynamicHeightDemo
//
//  Created by Fox on 15/1/16.
//  Copyright (c) 2015年 FoxBabe. All rights reserved.
//

#import "DynamicHeightCell.h"

@implementation DynamicHeightCell

- (void)awakeFromNib {
    // Initialization code
    
    self.name.numberOfLines = 0;
    self.name.font = [UIFont systemFontOfSize:17.0f];
    self.name.preferredMaxLayoutWidth = CGRectGetWidth(self.frame) - 28;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
