//
//  DwTableViewController.h
//  EditTableApp
//
//  Created by IKKO FUSHIKI on 6/11/14.
//  Copyright (c) 2014 IKKO FUSHIKI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DwTableData.h"

@interface DwTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) DwTableData* tableData;

- (void) setTableView:(UITableView *) tableView;
- (void) createTableData;
- (void) updateEditMode:(UITableView *) tableView withEditButton:(UIButton *) button;
- (void) updateEditMode:(UITableView *) tableView withBarButtonItem:(UIBarButtonItem *) buttonItem;

@end
