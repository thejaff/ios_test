//
//  AppDelegate.h
//  iosTest_Jaff_ Yakimbi
//
//  Created by Jaff Low on 2/27/13.
//  Copyright (c) 2013 Jaff Low. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MainViewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MainViewController *viewController;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic) BOOL *isIPad;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
+ (AppDelegate *) instance ;
@end
