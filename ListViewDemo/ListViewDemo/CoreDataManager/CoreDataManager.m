//
//  CoreDataHelper.m
//  ListViewDemo
//
//  Created by Bikramjeet Singh  on 24/08/23.
//

#import "CoreDataManager.h"

@implementation CoreDataManager

//MARK: - Private Methods

+ (instancetype)sharedInstance {
    static CoreDataManager *sharedInstance = nil;
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
            _persistentContainer = [[NSPersistentContainer alloc] initWithName: kLocalDBName]; // Replace with your data model name
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    [ShowToast showToast: error.description];
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

//MARK: - Public Methods

//Save Data In Local DB

- (void)saveContext {
    NSManagedObjectContext *context = self.context;
    if (context != nil) {
        NSError *error = nil;
        if ([context hasChanges] && ![context save:&error]) {
            NSLog(@"Unresolved error %@, %@", error, error.userInfo);
            [ShowToast showToast: error.description];
            abort();
        }else {
            NSLog(@"Data saved successfully.");
        }
    }
}

//Fetch Data In Local DB

- (NSArray *)fetchObjectsForEntity:(NSString *)entityName {
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:entityName];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.context executeFetchRequest:fetchRequest error:&error];
    if (error) {
        NSLog(@"Error fetching data: %@", error);
        [ShowToast showToast: error.description];
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

//Cleared Data In Local DB

- (void)clearedLocalDB:(NSString *)entityName {
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:entityName];
    NSError *fetchError = nil;
    NSArray *personsToDelete = [self.context executeFetchRequest:fetchRequest error:&fetchError];
    
    if (fetchError) {
        NSLog(@"Error fetching data: %@", fetchError);
        [ShowToast showToast: fetchError.description];
    } else {
        for (NSManagedObject *person in personsToDelete) {
            [self.context deleteObject:person];
        }
        
        NSError *saveError = nil;
        if (![self.context save:&saveError]) {
            NSLog(@"Error saving context: %@", saveError);
            [ShowToast showToast: saveError.description];
        } else {
            NSLog(@"Entity cleared successfully");
        }
    }
    
}

@end
