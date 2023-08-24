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

//MARK: - Properties

+ (instancetype)sharedInstance;
@property (readonly, strong, nonatomic) NSManagedObjectContext *context;
@property (readonly, strong, nonatomic) NSPersistentContainer *persistentContainer;

//MARK: - Declared Methods

- (void)saveContext;
- (void)clearedLocalDB:(NSString *)entityName;
- (NSArray *)fetchObjectsForEntity:(NSString *)entityName withPredicate:(NSPredicate *)predicate;

@end

NS_ASSUME_NONNULL_END
