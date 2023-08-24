//
//  CoreDataHelper.h
//  ListViewDemo
//
//  Created by Bikramjeet Singh  on 24/08/23.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Constants.h"

NS_ASSUME_NONNULL_BEGIN

@interface CoreDataManager : NSObject

//MARK: - Properties

+ (instancetype)sharedInstance;
@property (readonly, strong, nonatomic) NSManagedObjectContext *context;
@property (readonly, strong, nonatomic) NSPersistentContainer *persistentContainer;

//MARK: - Public Methods

- (void)saveContext;
- (void)clearedLocalDB:(NSString *)entityName;
- (NSArray *)fetchObjectsForEntity:(NSString *)entityName;

@end

NS_ASSUME_NONNULL_END
