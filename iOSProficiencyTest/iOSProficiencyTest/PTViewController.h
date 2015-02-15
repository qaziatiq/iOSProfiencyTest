//
//  ViewController.h
//  iOSProficiencyTest
//
//  Created by Qazi on 12/02/2015.
//  Copyright (c) 2015 Qazi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PTResponse.h"

@interface PTViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
@private
    PTResponse *serverResponse;
}
@property (retain, nonatomic) IBOutlet UITableView *tableView;



@end

