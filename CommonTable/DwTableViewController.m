//
//  DwTableViewController.m
//  EditTableApp
//
//  Created by IKKO FUSHIKI on 6/11/14.
//  Copyright (c) 2014 IKKO FUSHIKI. All rights reserved.
//

#import "DwTableViewController.h"

@interface DwTableViewController ()

@end

@implementation DwTableViewController

@synthesize tableData;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self createTableData];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    if (tableData == nil) {
        [self createTableData];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setTableView:(UITableView *) tableView
{
    if (tableView) {
        // Become the delegate and dataSource of the tableView.
        [tableView setEditing:NO];
        tableView.delegate = self;
        tableView.dataSource = self;
    }
}

- (void) createTableData
{
    tableData = [[DwTableData alloc] init];
    if (tableData == nil) {
        [tableData createTableContents];
    }
    
}

- (void) updateEditMode:(UITableView *) tableView withEditButton:(UIButton *) button
{
    if (tableView != nil && button != nil) {
        if (tableView.isEditing == NO) {
            [button setTitle:@"Done" forState:UIControlStateNormal];
            [tableView setEditing:YES animated:YES];
        }
        else {
            [button setTitle:@"Edit" forState:UIControlStateNormal];
            [tableView setEditing:NO animated:YES];
        }
        
    }
}

- (void) updateEditMode:(UITableView *) tableView withBarButtonItem:(UIBarButtonItem *) buttonItem
{
    if (tableView != nil && buttonItem != nil) {
        if (tableView.isEditing == NO) {
            buttonItem.title = @"Done";
            [tableView setEditing:YES animated:YES];
        }
        else {
            buttonItem.title = @"Delete";
            [tableView setEditing:NO animated:YES];
        }
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSInteger num = 1;
    if (tableData) {
        num = [tableData numberOfSectionsInTableView:tableView];
    }

    return num;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSInteger num = 0;
    if (tableData) {
        num = [tableData tableView:tableView numberOfRowsInSection:section];
    }
    return num;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    
    if (tableData) {
        cell = [tableData tableView:tableView cellForRowAtIndexPath:indexPath];
    }
    
    return cell;
}

// For editing
- (void) tableView:(UITableView *) tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableData) {
        [self tableView:tableView commitEditingStyle:editingStyle forRowAtIndexPath:indexPath];
    }
}

@end
