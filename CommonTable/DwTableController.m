//
//  MyTableController.m
//  EmbeddedTableApp
//
//  Created by IKKO FUSHIKI on 6/4/14.
//  Copyright (c) 2014 IKKO FUSHIKI. All rights reserved.
//

#import "DwTableController.h"

/*
typedef enum {
    DwTableEditModeNone = 0,
    DwTableEditModeDelete = -1,
    DwTableEditModeAdd = 1
} DwTableEditMode;
 */

@interface DwTableController() {
    NSMutableArray* _tableContents;
    NSMutableArray* _imageNames;    
//    BOOL    _editMode;
}

@end

@implementation DwTableController

@synthesize viewController;

- (id) initWithTableView:(UITableView *) tableView andViewController:(UIViewController *)controller
{
    if (self = [super init]) {
//        _editMode = NO;
        if (tableView) {
            // Become the delegate and dataSource of the tableView.
            [tableView setEditing:NO];
            tableView.delegate = self;
            tableView.dataSource = self;
        }
        viewController = controller;
    }
    return self;
}

- (id) init
{
    return [self initWithTableView:nil andViewController:nil];
}

/*
- (BOOL) isEditMode
{
    return _editMode;
}
 */

- (void) updateEditMode:(UITableView *) tableView withEditButton:(UIButton *) button
{
    if (tableView != nil && button != nil) {
//        if (_editMode) {
        if (tableView.isEditing == NO) {
            [button setTitle:@"Done" forState:UIControlStateNormal];
            [tableView setEditing:YES animated:YES];
//            _editMode = YES;
        }
        else {
            [button setTitle:@"Edit" forState:UIControlStateNormal];
            [tableView setEditing:NO animated:YES];
//            _editMode = NO;
        }

    }
}

- (void) updateEditMode:(UITableView *) tableView withBarButtonItem:(UIBarButtonItem *) buttonItem
{
    if (tableView != nil && buttonItem != nil) {
//        if (_editMode == NO) {
        if (tableView.isEditing == NO) {
            buttonItem.title = @"Done";
            [tableView setEditing:YES animated:YES];
//            _editMode = YES;
        }
        else {
            buttonItem.title = @"Delete";
            [tableView setEditing:NO animated:YES];
//            _editMode = NO;
        }
    }
}

- (void) createTableContents
{
    //  _tableContents = [[NSMutableArray alloc] initWithArray:[UIFont familyNames]];
    if (!_tableContents) {
        _tableContents = [[NSMutableArray alloc] initWithObjects:@"Number One", @"Number Two", @"Number Three", nil];
        _imageNames = [[NSMutableArray alloc] initWithObjects:@"calculator.png", @"iBooks.png", @"Phone.png", nil];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSInteger num = 0;
    if (_tableContents) {
        num = _tableContents.count;
    }
    return num;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell1"; // This can be any name.
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    UITableViewCellStyle style = UITableViewCellStyleDefault;
    
    // Configure the cell...
    if (!cell)
        cell = [[UITableViewCell alloc] initWithStyle:style reuseIdentifier:CellIdentifier];
    
    // Set the cell text
    cell.textLabel.text = _tableContents[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:_imageNames[indexPath.row]];
    
    return cell;
}

// For editing
- (void) tableView:(UITableView *) tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_tableContents removeObjectAtIndex:indexPath.row];
        [_imageNames removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

@end
