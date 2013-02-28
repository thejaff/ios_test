//
//  MainViewController.h
//  iosTest_Jaff_ Yakimbi
//
//  Created by Jaff Low on 2/28/13.
//  Copyright (c) 2013 Jaff Low. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "tblViewController.h"
@interface MainViewController : UIViewController <NSURLConnectionDelegate>
{
    NSMutableData *responseData;
    tblViewController *tblViewC;

}

@property (nonatomic, retain) tblViewController *tblViewC;
@end
