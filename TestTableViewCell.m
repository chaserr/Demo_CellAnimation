//
//  TestTableViewCell.m
//  TableViewTestAnimation
//
//  Created by 童星 on 16/6/16.
//  Copyright © 2016年 童星. All rights reserved.
//

#import "TestTableViewCell.h"

@implementation TestTableViewCell


+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"TestCell";
    TestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
        

    }
    return cell;
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
