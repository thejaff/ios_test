//
//  MainViewController.m
//  iosTest_Jaff_ Yakimbi
//
//  Created by Jaff Low on 2/28/13.
//  Copyright (c) 2013 Jaff Low. All rights reserved.
//

#import "MainViewController.h"
#import "EntityRevData.h"
#import "AppDelegate.h"
#define urlString @"http://gist.github.com/anonymous/4680060/raw/aac6d818e7103edfe721e719b1512f707bcfb478/sample.json"

@interface MainViewController ()

@end

@implementation MainViewController
@synthesize tblViewC;
- (NSMutableData *)ResponseData { //Lazy load
    if (!responseData) {
        responseData = [[NSMutableData alloc]init];;
    }
    return responseData;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self startRequest];
    // Do any additional setup after loading the view from its nib.
    tblViewC = [[tblViewController alloc]initWithStyle:UITableViewStylePlain];
    [self.view addSubview:tblViewC.view];
}

-(void)startRequest{
    NSLog(@"Start Request");
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    NSURLConnection *con = [[NSURLConnection alloc]initWithRequest:req delegate:self];
    
    if (!con) {
        // Show error alert.
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle: @"Connection Failed"
                                                            message: @"Unable to make connection. Try again later."
                                                           delegate: nil
                                                  cancelButtonTitle: @"OK"
                                                  otherButtonTitles: nil];
        [alertView show];
        con = nil;
    }
}

#pragma mark - httpRequest delegate

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {

    [[self ResponseData] setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    
    [[self ResponseData] appendData:data];
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // Show error alert.
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle: @"Error From Server"
                                                        message: @"Please Check your internet Connection or Try again later."
                                                       delegate: nil
                                              cancelButtonTitle: @"OK"
                                              otherButtonTitles: nil];
    [alertView show];
}


- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
   ;
    
    NSError *error =nil;
    
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:responseData options:0 error: &error];
    if (!jsonArray) {
        NSLog(@"Error parsing JSON: %@", error);
    } else {
        for(NSDictionary *item in jsonArray) {
            NSLog(@"Item: %@", item);
        }
    }

    NSLog(@"complete is %@ \n" , [[jsonArray valueForKey:@"my_files"]valueForKey:@"content"]);
    [self writeToCoreData:[[jsonArray valueForKey:@"my_files"]valueForKey:@"content"]];
    
    [self.tblViewC reloadContentInfo];
}

#pragma mark - CoreData

-(void) writeToCoreData :(NSArray *)arrContent{

    NSManagedObjectContext *context = [AppDelegate instance].managedObjectContext ;
    
    
    for (NSDictionary *itemDic in arrContent) {
        EntityRevData *entry = [ NSEntityDescription insertNewObjectForEntityForName:@"EntityRevData" inManagedObjectContext:context];
        
        entry.created_date = [itemDic valueForKey:@"create_date"];
        entry.is_shared = [itemDic valueForKey:@"is_shared"];
        entry.item_id = [NSString  stringWithFormat:@"%@",[itemDic valueForKey:@"item_id"]];
        entry.last_updated_by = [itemDic valueForKey:@"last_updated_by"];
        entry.last_updated_date = [itemDic valueForKey:@"last_updated_date"];
        entry.link = [itemDic valueForKey:@"link"];
        entry.mime_type = [NSString stringWithFormat:@"%@",[itemDic valueForKey:@"mime_type"]];
        entry.name  = [itemDic valueForKey:@"name"];
        entry.parent_id = [NSString stringWithFormat:@"%@",[itemDic valueForKey:@"parent_id"]];
        entry.path_by_id = [itemDic valueForKey:@"path_by_id"];
        entry.shared_id =[itemDic valueForKey: @"share_id" ];
        entry.share_level = [itemDic valueForKey:@"shared_level"];
        entry.shared_by = [NSString stringWithFormat:@"%@",[itemDic valueForKey:@"shared_by"]];
        entry.shared_date = [itemDic valueForKey:@"shared_date"];
        NSLog(@"%@ is size", [itemDic valueForKey:@"size"]);
      entry.size = [NSNumber numberWithInt:[itemDic valueForKey:@"size"]];
        entry.status = [itemDic valueForKey:@"status"];
      entry.type = [NSNumber numberWithInt:[itemDic valueForKey:@"type"]];
      entry.user_id = [NSString stringWithFormat:@"%@",[itemDic valueForKey:@"user_id"]];

        NSError *err;
        
        if (![context save:&err]) {
            NSLog(@"Core Data Error: Please kindly check in MainViewController");
        }
        
        NSLog(@"item id rec %@",entry.item_id);
    }
    
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
