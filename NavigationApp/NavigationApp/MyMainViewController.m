//
//  MyMainViewController.m
//  NavigationApp
//
//  Created by IKKO FUSHIKI on 6/9/14.
//  Copyright (c) 2014 IKKO FUSHIKI. All rights reserved.
//

#import "MyMainViewController.h"
#import "DetailViewController.h"

@interface MyMainViewController ()
@property (nonatomic, strong)    NSMutableArray* _tableContents;
@end

@implementation MyMainViewController
@synthesize _tableContents;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        _tableContents = nil;
        // Custom initialization
    }
    return self;
}

- (void) createTableContents
{
    //  _tableContents = [[NSMutableArray alloc] initWithArray:[UIFont familyNames]];
    if (!_tableContents) {
        _tableContents = [[NSMutableArray alloc] initWithObjects:@"Ikko Fushiki", @"Maria Fushiki", @"Erika Fushiki", @"Monica Fushiki", nil];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self createTableContents];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Configure the cell...
    static NSString *CellIdentifier = @"Cell"; // This can be any name.
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    UITableViewCellStyle style = UITableViewCellStyleDefault;
    
    // Configure the cell...
    if (!cell)
        cell = [[UITableViewCell alloc] initWithStyle:style reuseIdentifier:CellIdentifier];
        
    // Set the cell text
    cell.textLabel.text = _tableContents[indexPath.row];
    
    return cell;
}

// didSelectRowAtIndexPath is called when a TableViewCell is selected.
// prepareForSeque is not called.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
 //   UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];

    UIStoryboard *storyboard = self.storyboard;
    if (storyboard) {
        DetailViewController * detailController = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
        [self.navigationController pushViewController:detailController animated:YES];

    }
}

#pragma mark - Navigation

// prepareFrSegue is called from Button or UIBarButtonItem from UINavigationItem.
// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

#pragma mark - Table view data source

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */




@end
