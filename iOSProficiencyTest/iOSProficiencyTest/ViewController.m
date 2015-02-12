//
//  ViewController.m
//  iOSProficiencyTest
//
//  Created by Qazi on 12/02/2015.
//  Copyright (c) 2015 Qazi. All rights reserved.
//

#import "ViewController.h"
#import "HTTPClient.h"
#import "Row.h"
#import "RowTableViewCell.h"
#import "UIImageView+AFNetworking.h"

#define PREFFERED_WIDTH 296

#define PADDING 21+10+60

#define IMAGE_HEIGHT 100

@interface ViewController ()

@property Response *serverResponse;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    HTTPClient *thisClient = [HTTPClient sharedClient];
    
    [thisClient getListsuccess:^(NSDictionary *result) {
        
        _serverResponse = [Response instanceFromDictionary:result];
        
        [_tableView reloadData];
        
    } failure:^(NSError *error) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:[error localizedDescription]
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - TableView Datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _serverResponse.rows.count;
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = PADDING ;
    static NSString *MyIdentifier = @"tableCell";

    
    Row *thisRow = _serverResponse.rows[indexPath.row];
    
    
    RowTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil)
    {
        cell = [[RowTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:MyIdentifier] ;
    }

    height += [self getHeightForLabel:cell.detailLabel withText:thisRow.descriptionText];
    
    NSLog(@"Before %f", height);
    if ((thisRow.imageLink != nil) && (height < IMAGE_HEIGHT)){
        
        
        height =IMAGE_HEIGHT + 20;
        NSLog(@"After %f", height);
    }
    return  height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"tableCell";
    
    Row *thisRow = _serverResponse.rows[indexPath.row];
    
    RowTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil)
    {
        cell = [[RowTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:MyIdentifier] ;
    }
    
 
    cell.titleLable.text = thisRow.itemTitle;
    cell.detailLabel.text = thisRow.descriptionText;
    
    
    
    //adjust the label the the new height.
    CGRect newFrame = cell.detailLabel.frame;
    newFrame.size.height = [self getHeightForLabel:cell.detailLabel withText:thisRow.descriptionText];
    cell.detailLabel.frame = newFrame;
    
    if (thisRow.imageLink != nil) {
        
        [cell.image setImageWithURL:[NSURL URLWithString: thisRow.imageLink] placeholderImage:[UIImage imageNamed:@"imageLoading.png"]];
    }
    else
    {
        cell.image = nil;
    }
    return cell;
}
- (void)dealloc {
    [_tableView release];
    [_serverResponse release];
    [super dealloc];
}

#pragma -mark internal
-(CGFloat)getHeightForLabel:(UILabel*)label withText:(NSString*)text
{
    CGSize maximumLabelSize = CGSizeMake(PREFFERED_WIDTH, FLT_MAX);
    
    CGSize expectedLabelSize = [text sizeWithFont:label.font constrainedToSize:maximumLabelSize lineBreakMode:label.lineBreakMode];
    
    return expectedLabelSize.height;
    
}
@end
