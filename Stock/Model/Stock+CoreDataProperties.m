//
//  Stock+CoreDataProperties.m
//  Stock
//
//  Created by apple on 15/11/7.
//  Copyright © 2015年 zlf. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Stock+CoreDataProperties.h"

@implementation Stock (CoreDataProperties)

@dynamic code;
@dynamic name;

+ (instancetype)insertItemInManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    
    Stock* stock = [NSEntityDescription insertNewObjectForEntityForName:self.entityName
                                               inManagedObjectContext:managedObjectContext];
    
    
    return stock;
}

+ (NSString*)entityName
{
    return @"Stock";
}

- (void)setStockPropertiesWith:(NSDictionary *)dict {
    
    self.name = dict[@"name"];
    self.code = dict[@"gid"];
    
}

@end
