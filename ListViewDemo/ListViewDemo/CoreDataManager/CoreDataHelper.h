//
//  CoreDataHelper.h
//  ListViewDemo
//
//  Created by Bikramjeet Singh  on 24/08/23.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface CoreDataHelper : NSObject

+ (instancetype)sharedInstance;
- (void)saveContext;
- (void)clearedLocalDB;
- (NSArray *)fetchObjectsForEntity:(NSString *)entityName withPredicate:(NSPredicate *)predicate;
@property (readonly, strong, nonatomic) NSManagedObjectContext *context;
@property (readonly, strong, nonatomic) NSPersistentContainer *persistentContainer;

@end

NS_ASSUME_NONNULL_END
