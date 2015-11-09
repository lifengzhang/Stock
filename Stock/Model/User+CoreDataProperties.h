//
//  User+CoreDataProperties.h
//  Stock
//
//  Created by apple on 15/11/8.
//  Copyright © 2015年 zlf. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "User.h"

NS_ASSUME_NONNULL_BEGIN

@interface User (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *userid;
@property (nullable, nonatomic, retain) NSOrderedSet<Stock *> *stocklist;

@end

@interface User (CoreDataGeneratedAccessors)

+ (instancetype)insertItemInManagedObjectContext:(NSManagedObjectContext *)managedObjectContext;

- (void)insertObject:(Stock *)value inStocklistAtIndex:(NSUInteger)idx;
- (void)removeObjectFromStocklistAtIndex:(NSUInteger)idx;
- (void)insertStocklist:(NSArray<Stock *> *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeStocklistAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInStocklistAtIndex:(NSUInteger)idx withObject:(Stock *)value;
- (void)replaceStocklistAtIndexes:(NSIndexSet *)indexes withStocklist:(NSArray<Stock *> *)values;
- (void)addStocklistObject:(Stock *)value;
- (void)removeStocklistObject:(Stock *)value;
- (void)addStocklist:(NSOrderedSet<Stock *> *)values;
- (void)removeStocklist:(NSOrderedSet<Stock *> *)values;

@end

NS_ASSUME_NONNULL_END
