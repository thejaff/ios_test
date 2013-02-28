//
//  PopOverChoiceViewController.m
//  iosTest_Jaff_ Yakimbi
//
//  Created by Jaff Low on 2/28/13.
//  Copyright (c) 2013 Jaff Low. All rights reserved.
//

#import "PopOverChoiceViewController.h"

@interface PopOverChoiceViewController ()

@end

@implementation PopOverChoiceViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        [self.tableView setFrame:CGRectMake(0, 0, 320, 185)];
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    if (indexPath.row == 0) {
        [cell.textLabel setText:@"Pop Pop Pop"];
        cell.backgroundColor = [UIColor yellowColor ];
     //   [cell setBackgroundColor:[UIColor yellowColor]];
    }
    if (indexPath.row == 1) {
        [cell.textLabel setText:@"Successfully Displayed!"];
        [cell setBackgroundColor:[UIColor blueColor]];
    }
    if (indexPath.row == 2) {
        [cell.textLabel setText:@"Hey I just Done This,"];
        [cell setBackgroundColor:[UIColor greenColor]];
    }
    if (indexPath.row == 3) {
        [cell.textLabel setText:@"It is Easy!"];
        [cell setBackgroundColor:[UIColor greenColor]];
    }
    if (indexPath.row == 4) {
        [cell.textLabel setText:@"And Here's My number"];
        [cell setBackgroundColor:[UIColor greenColor]];
    }
    if (indexPath.row == 5) {
        [cell.textLabel setText:@"60124713828"];
        [cell setBackgroundColor:[UIColor greenColor]];
    }
    if (indexPath.row == 6) {
        [cell.textLabel setText:@"So Call me Maybe ?  "];
        [cell setBackgroundColor:[UIColor greenColor]];
    }
    if (indexPath.row == 7) {
        [cell.textLabel setText:@"Hire Me ? :) "];
        [cell setBackgroundColor:[UIColor greenColor]];
    }
    // Configure the cell...
    
    return cell;
}

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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

@end
