//
//  ViewController.h
//  iOSProficiencyTest
//
//  Created by Qazi on 12/02/2015.
//  Copyright (c) 2015 Qazi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Response.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (retain, nonatomic) IBOutlet UITableView *tableView;



@end

