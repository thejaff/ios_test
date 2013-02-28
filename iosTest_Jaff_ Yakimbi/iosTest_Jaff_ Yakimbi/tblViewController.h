//
//  tblViewController.h
//  iosTest_Jaff_ Yakimbi
//
//  Created by Jaff Low on 2/28/13.
//  Copyright (c) 2013 Jaff Low. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tblViewController : UITableViewController
{

    BOOL showHidden;
    NSIndexPath *currentMoreIndex;

}
@property BOOL showHidden;
@property (nonatomic, retain) NSIndexPath *currentMoreIndex;
@property (nonatomic, retain) NSArray *dataArray;
-(void) reloadContentInfo;
@end
