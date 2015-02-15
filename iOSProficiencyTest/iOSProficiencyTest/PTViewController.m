//
//  ViewController.m
//  iOSProficiencyTest
//
//  Created by Qazi on 12/02/2015.
//  Copyright (c) 2015 Qazi. All rights reserved.
//

#import "PTViewController.h"
#import "HTTPClient.h"
#import "PTRow.h"
#import "PTRowTableViewCell.h"
#import "UIImageView+AFNetworking.h"


CGFloat const kPadding = 21+10+60;
int const kImageHeight = 100;



@interface PTViewController ()


@end

@implementation PTViewController


-(void)refresh:(UIRefreshControl *)refreshControl
{
  
  
  HTTPClient *thisClient = [HTTPClient sharedClient];
  
  
  [thisClient getListsuccess:^(NSDictionary *result) {
    
    serverResponse = [[PTResponse instanceFromDictionary:result] retain];
    
    
    self.navigationItem.title = serverResponse.title;
    
    
    
    if (refreshControl != nil) {
      
      
      [refreshControl endRefreshing];
    }
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

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  [self refresh:nil];
  
  UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
  [refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
  [self.tableView addSubview:refreshControl];
  
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
  
  return serverResponse.rows.count;
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  CGFloat height = kPadding ;
  static NSString *MyIdentifier = @"tableCell";
  
  
  PTRow *thisRow = serverResponse.rows[indexPath.row];
  
  
  PTRowTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
  
  if (cell == nil)
  {
    cell = [[[PTRowTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:MyIdentifier] autorelease];
  }
  
  height += [self getHeightForLabel:cell.detailLabel withText:thisRow.descriptionText];
  
  if ((thisRow.imageLink != nil) && (height < kImageHeight)){
    
    
    height =kImageHeight + 20;
  }
  return  height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *MyIdentifier = @"tableCell";
  
  PTRow *thisRow = serverResponse.rows[indexPath.row];
  
  PTRowTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
  
  if (cell == nil)
  {
    cell = [[[PTRowTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:MyIdentifier] autorelease] ;
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
    cell.image.image = nil;
  }
  return cell;
}
- (void)dealloc {
  [_tableView release];
  [serverResponse release];
  [super dealloc];
}

#pragma -mark internal
-(CGFloat)getHeightForLabel:(UILabel*)label withText:(NSString*)text
{
  CGFloat prefferedWidth = 200;
  
  
  NSLog(@"Screen Heigh %f",[[UIScreen mainScreen] bounds].size.height);
  if (([[UIScreen mainScreen] bounds].size.height  > 600) && ([[UIScreen mainScreen] bounds].size.height<700)){
    
    prefferedWidth = 250;
    
  }
  else if ([[UIScreen mainScreen] bounds].size.height > 700)
  {
    prefferedWidth = 300;
  }
  
  
  CGSize maximumLabelSize = CGSizeMake(prefferedWidth, FLT_MAX);
  
  CGSize expectedLabelSize = [text sizeWithFont:label.font constrainedToSize:maximumLabelSize lineBreakMode:label.lineBreakMode];
  
  return expectedLabelSize.height;
  
}
@end
