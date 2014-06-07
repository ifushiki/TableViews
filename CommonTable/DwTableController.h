//
//  DwTableController.h
//  EmbeddedTableApp
//
//  Created by IKKO FUSHIKI on 6/4/14.
//  Copyright (c) 2014 IKKO FUSHIKI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DwTableController : NSObject <UITableViewDelegate, UITableViewDataSource>

- (id) initWithTableView:(UITableView *) tableView;
- (void) createTableContents;

@end
