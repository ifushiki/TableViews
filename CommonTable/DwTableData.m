//
//  DwTableData.m
//  EditTableApp
//
//  Created by IKKO FUSHIKI on 6/11/14.
//  Copyright (c) 2014 IKKO FUSHIKI. All rights reserved.
//

#import "DwTableData.h"

@interface DwTableData() {
    NSMutableArray* _tableContents;
    NSMutableArray* _imageNames;
}

@end
@implementation DwTableData

// Subclass should override
- (void) createTableContents
{
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
