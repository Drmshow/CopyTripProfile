//
//  TouristCityTableViewCell.m
//  CopyTrip
//
//  Created by admin on 16/3/21.
//  Copyright © 2016年 drmshow. All rights reserved.
//

#import "TouristCityTableViewCell.h"

@implementation TouristCityTableViewCell

- (void)awakeFromNib {
    self.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
