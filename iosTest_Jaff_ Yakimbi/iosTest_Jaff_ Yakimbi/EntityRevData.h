//
//  EntityRevData.h
//  iosTest_Jaff_ Yakimbi
//
//  Created by Jaff Low on 2/27/13.
//  Copyright (c) 2013 Jaff Low. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface EntityRevData : NSManagedObject

@property (nonatomic, retain) NSString * status;
@property (nonatomic, retain) NSString * is_shared;
@property (nonatomic, retain) NSString * shared_id;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * user_id;
@property (nonatomic, retain) NSNumber * shared_by;
@property (nonatomic, retain) NSString * shared_date;
@property (nonatomic, retain) NSString * share_level;
@property (nonatomic, retain) NSString * parent_id;
@property (nonatomic, retain) NSString * last_updated_date;
@property (nonatomic, retain) NSString * last_updated_by;
@property (nonatomic, retain) NSString * link;
@property (nonatomic, retain) NSString * created_date;
@property (nonatomic, retain) NSString * item_id;
@property (nonatomic, retain) NSString * path;
@property (nonatomic, retain) NSString * path_by_id;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSString * mime_type;
@property (nonatomic, retain) NSNumber * size;

@end
