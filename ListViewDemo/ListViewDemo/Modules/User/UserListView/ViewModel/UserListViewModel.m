//
//  UserListViewModel.m
//  ListViewDemo
//
//  Created by Bikramjeet Singh  on 24/08/23.
//

#import "UserListViewModel.h"

@implementation UserListViewModel

//MARK: - Defined Method

- (void)fetchUserDataFromAPI:(ModelArrayCompletionBlock)completion  {
    
    NSURL *apiURL = [NSURL URLWithString:@"https://randomuser.me/api/?page=3&results=10"];
    
    [APIManager fetchDataFromAPIWithURL:apiURL completion:^(NSDictionary *response, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            UserListViewModel *person = [[UserListViewModel alloc] init];
            [person saveAPIDataInLocalDB:response];
            self.personArray = [person fetchDataFromLocalDB];
            if (completion) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    // Return the fetched models to the completion block on the main thread
                    completion(self.personArray, nil);
                });
            }
            
            NSLog(@"Response: %@", self.personArray);
            
        }
    }];
}

- (void) saveAPIDataInLocalDB: (NSDictionary *) response {
    
    [CoreDataHelper.sharedInstance clearedLocalDB:@"UserDetails"];
    for (NSDictionary *userDict in response[@"results"]) {
        // Save an object
        
        UserDetails *userDetail = [NSEntityDescription insertNewObjectForEntityForName:@"UserDetails" inManagedObjectContext:CoreDataHelper.sharedInstance.context];
        //
        userDetail.title = userDict[@"name"][@"title"];
        userDetail.first = userDict[@"name"][@"first"];
        userDetail.last = userDict[@"name"][@"last"];
        userDetail.email = userDict[@"email"];
        userDetail.city = userDict[@"location"][@"city"];
        userDetail.state = userDict[@"location"][@"state"];
        userDetail.country = userDict[@"location"][@"country"];
        userDetail.postcode = [userDict[@"location"][@"postcode"] integerValue];
        userDetail.userRegisteredDate = userDict[@"registered"][@"date"];
        userDetail.mediumProfilePic = userDict[@"picture"][@"medium"];
        userDetail.largeProfilePic = userDict[@"picture"][@"large"];
        userDetail.age = [userDict[@"dob"][@"age"] integerValue];
        userDetail.userDOB = userDict[@"dob"][@"date"];
        [CoreDataHelper.sharedInstance saveContext];
    }
}

- (NSMutableArray<UserListCellViewModel *> *) fetchDataFromLocalDB {
    // Fetch objects
    self.personArray = [NSMutableArray array];
    NSPredicate *fetchPredicate = [NSPredicate predicateWithFormat:@"title == %@", @"Value"];
    
    NSArray<UserDetails *> *fetchedItems = [CoreDataHelper.sharedInstance fetchObjectsForEntity:@"UserDetails" withPredicate:fetchPredicate];
    
    for (UserDetails *userData in fetchedItems) {
        NSLog(@"Key: %@", userData.title);
        UserListCellViewModel *user = [[UserListCellViewModel alloc] init];
        [self.personArray addObject: [user initWithUserDetailsModel:userData]];
    }
    
    return  self.personArray;
}

@end
