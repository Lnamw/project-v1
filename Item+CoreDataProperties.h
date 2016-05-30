//
//  Item+CoreDataProperties.h
//  
//
//  Created by Elena Maso Willen on 30/05/2016.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Item.h"

NS_ASSUME_NONNULL_BEGIN

@interface Item (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *picture;
@property (nullable, nonatomic, retain) NSNumber *price;
@property (nullable, nonatomic, retain) NSString *details;
@property (nullable, nonatomic, retain) NSSet<List *> *list;

@end

@interface Item (CoreDataGeneratedAccessors)

- (void)addListObject:(List *)value;
- (void)removeListObject:(List *)value;
- (void)addList:(NSSet<List *> *)values;
- (void)removeList:(NSSet<List *> *)values;

@end

NS_ASSUME_NONNULL_END
