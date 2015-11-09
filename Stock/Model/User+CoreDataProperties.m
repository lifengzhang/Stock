//
//  User+CoreDataProperties.m
//  Stock
//
//  Created by apple on 15/11/8.
//  Copyright © 2015年 zlf. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "User+CoreDataProperties.h"

@implementation User (CoreDataProperties)

@dynamic name;
@dynamic userid;
@dynamic stocklist;

+ (instancetype)insertItemInManagedObjectContext:(NSManagedObjectContext *)managedObjectContext {
    
    NSFetchRequest* request = [NSFetchRequest fetchRequestWithEntityName:[User entityName]];
    
    NSArray* objects = [managedObjectContext executeFetchRequest:request error:NULL];
    
    User *user = [objects lastObject];
    
    if (!user) {
        user = [NSEntityDescription insertNewObjectForEntityForName:[User entityName]
                                             inManagedObjectContext:managedObjectContext];
    }
    
    return user;
}

+ (NSString*)entityName
{
    return @"User";
}

@end
