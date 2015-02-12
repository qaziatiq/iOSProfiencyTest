//
//  RowTableViewCell.h
//  iOSProficiencyTest
//
//  Created by Qazi on 13/02/2015.
//  Copyright (c) 2015 Qazi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RowTableViewCell : UITableViewCell
@property (retain, nonatomic) IBOutlet UIImageView *image;
@property (retain, nonatomic) IBOutlet UILabel *titleLable;
@property (retain, nonatomic) IBOutlet UILabel *detailLabel;

@end
