//
//  RowTableViewCell.m
//  iOSProficiencyTest
//
//  Created by Qazi on 13/02/2015.
//  Copyright (c) 2015 Qazi. All rights reserved.
//

#import "PTRowTableViewCell.h"

@implementation PTRowTableViewCell



- (void)awakeFromNib {
  // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
  [super setSelected:selected animated:animated];
  
  // Configure the view for the selected state
}

- (void)dealloc {
  [_image release];
  [_titleLable release];
  [_detailLabel release];
  [super dealloc];
}
@end
