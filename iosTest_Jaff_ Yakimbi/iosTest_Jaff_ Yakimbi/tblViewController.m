//
//  tblViewController.m
//  iosTest_Jaff_ Yakimbi
//
//  Created by Jaff Low on 2/28/13.
//  Copyright (c) 2013 Jaff Low. All rights reserved.
//

#import "tblViewController.h"
#import "AppDelegate.h"
#import "EntityRevData.h"
#import "PopOverChoiceViewController.h"
@interface tblViewController ()

@end

@implementation tblViewController
@synthesize dataArray;
@synthesize currentMoreIndex;
@synthesize showHidden;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        if ([AppDelegate instance].isIPad) {
             [self.tableView setFrame:CGRectMake(0, 0, 768, 1024)];
            [self.tableView setBackgroundColor:[UIColor darkGrayColor]];
        }
        else{
        [self.tableView setFrame:CGRectMake(0, 0, 320, 480)];
        }
        
    }
    return self;
}

- (NSArray *)dataArray { //Lazy load
    if (!dataArray) {
        dataArray = [[NSArray alloc]init];;
    }
    return dataArray;
}

- (NSIndexPath *)currentMoreIndex {

    if(!currentMoreIndex){
    
        currentMoreIndex = [[NSIndexPath alloc]init];
    }
    return currentMoreIndex;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    showHidden = NO;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}

-(void) reloadContentInfo {

    NSEntityDescription *entity = [NSEntityDescription entityForName:@"EntityRevData" inManagedObjectContext:[AppDelegate instance].managedObjectContext];
    NSFetchRequest *fetchReq = [[NSFetchRequest alloc]init];
    [fetchReq setEntity:entity];
    
    NSError *err =nil;
    
    self.dataArray = [[AppDelegate instance].managedObjectContext executeFetchRequest:fetchReq error:&err];
    
    [self.tableView reloadData];
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
    if (!showHidden) {
        return [self.dataArray count];
    }
    else{
    return [self.dataArray count]+1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    if ([currentMoreIndex isEqual:indexPath]) {
        
        [cell.textLabel setText:@"Hey, PopOver only exclusive for iPad!"];
        [cell.textLabel setNumberOfLines:0];
        [cell.textLabel setBackgroundColor:[UIColor clearColor]];
        [cell.contentView setBackgroundColor:[UIColor orangeColor]];
            }else{
    [cell.textLabel setText:[NSString stringWithFormat:@"File Name : %@",[(EntityRevData *)[dataArray objectAtIndex:indexPath.row] name]]];
    [cell.detailTextLabel setText:[NSString stringWithFormat:@"Last Updated By : %@",[(EntityRevData *)[dataArray objectAtIndex:indexPath.row] last_updated_by]]];
    
    if ([[AppDelegate instance]isIPad]) {
        [cell.detailTextLabel setTextColor:[UIColor lightGrayColor]];
    }
    }
    // Configure the cell...
    
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


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
    if ([[AppDelegate instance]isIPad]) {
        
        PopOverChoiceViewController *popVC = [[PopOverChoiceViewController alloc]initWithStyle:UITableViewStyleGrouped];
        
        UIPopoverController *popOverC = [[UIPopoverController alloc]initWithContentViewController:popVC];
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        CGRect popRect = [self.view convertRect:cell.frame fromView:self.view];
        
        
        [popOverC setPopoverContentSize:CGSizeMake(360, 200)];
        [popOverC presentPopoverFromRect:popRect inView:self.tableView permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
        
        
    }
    else{
    
        NSIndexPath *more1 = [NSIndexPath indexPathForRow:[indexPath row]+1 inSection:[indexPath section]];
        
        NSLog(@"else ady %@"  , self.currentMoreIndex);
        
        
        
        if (![self.currentMoreIndex isEqual:more1] && showHidden == YES) {
            NSLog(@"show more YES");
            NSArray *indexPathArray = [NSArray arrayWithObjects:self.currentMoreIndex, nil];
            showHidden = NO;
            [self.tableView deleteRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationBottom];
            showHidden = YES;
            NSArray *indexPathArray2 = [NSArray arrayWithObjects:more1, nil];
            self.currentMoreIndex = more1;
            
            [self.tableView insertRowsAtIndexPaths:indexPathArray2 withRowAnimation:UITableViewRowAnimationTop];
            
            
        }
        else if([self.currentMoreIndex isEqual:more1] && showHidden == YES){
            
            NSArray *indexPathArray = [NSArray arrayWithObjects:self.currentMoreIndex, nil];
            showHidden = NO;
            self.currentMoreIndex = nil;
            [self.tableView deleteRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationBottom];
            
            
        }
    
        else {
            NSLog(@"show more NO");
            showHidden = YES;
            NSArray *indexPathArray2 = [NSArray arrayWithObjects:more1, nil];
            self.currentMoreIndex = more1;
            NSLog(@"curret %@", self.currentMoreIndex );
            [self.tableView insertRowsAtIndexPaths:indexPathArray2 withRowAnimation:UITableViewRowAnimationTop];
            
            
        }
    
    }
    
    
    
    
}

@end
