//
//  CoreDataHelper.m
//  ListViewDemo
//
//  Created by Bikramjeet Singh  on 24/08/23.
//

#import "CoreDataHelper.h"


@implementation CoreDataHelper

+ (instancetype)sharedInstance {
    static CoreDataHelper *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"ListViewDemo"]; // Replace with your data model name
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

- (NSManagedObjectContext *)context {
    return self.persistentContainer.viewContext;
}

- (void)saveContext {
    NSManagedObjectContext *context = self.context;
    if (context != nil) {
        NSError *error = nil;
        if ([context hasChanges] && ![context save:&error]) {
            NSLog(@"Unresolved error %@, %@", error, error.userInfo);
            abort();
        }else {
            NSLog(@"Data saved successfully.");
        }
    }
}

- (NSArray *)fetchObjectsForEntity:(NSString *)entityName withPredicate:(NSPredicate *)predicate {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:entityName];
//    fetchRequest.predicate = predicate;
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.context executeFetchRequest:fetchRequest error:&error];
    if (error) {
        NSLog(@"Error fetching data: %@", error);
        return @[];
    }else {
        // Fetched objects are available in the fetchedObjects array
//        for (NSManagedObject *object in fetchedObjects) {
//            // Access and use object properties as needed
//            NSLog(@"Error fetching data: %@", object);
//        }
    }
    return fetchedObjects;
}

- (void)clearedLocalDB {
    NSManagedObjectContext *context = self.context;
    if (context != nil) {
        NSError *error = nil;
        if ([context hasChanges] && ![context save:&error]) {
            NSLog(@"Unresolved error %@, %@", error, error.userInfo);
            abort();
        }else {
            NSLog(@"Data saved successfully.");
        }
    }
}

@end
