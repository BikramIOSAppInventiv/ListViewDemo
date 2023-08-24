//
//  UserListViewModel.m
//  ListViewDemo
//
//  Created by Bikramjeet Singh  on 24/08/23.
//

#import "UserListViewModel.h"

@implementation UserListViewModel

//MARK: - Properties

- (NSInteger)totalUserRecords {
    return  self.personArray.count;
}

//MARK: - Public Methods

- (UserListCellViewModel *)getUserRecords: (NSInteger)index {
    return [self.personArray objectAtIndex: index];
}

- (void)fetchUserDataFromAPI:(ModelArrayCompletionBlock)completion  {
    
    NSString *urlString = [NSString stringWithFormat:@"%@ %@", kBaseURL, kAPIKey];
    
    NSURL *apiURL = [NSURL URLWithString:urlString];
    
    [APIManager fetchDataFromAPIWithURL:apiURL completion:^(NSDictionary *response, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
            completion(nil, error);
        } else {
            UserListViewModel *person = [[UserListViewModel alloc] init];
            [person saveAPIDataInLocalDB:response];
            self.personArray = [person fetchDataFromLocalDB];
            if (completion) {
                completion(self.personArray, nil);
            }
        }
    }];
}

- (void) saveAPIDataInLocalDB: (NSDictionary *) response {
    
    [CoreDataManager.sharedInstance clearedLocalDB: kUserDetailsEntity];
    for (NSDictionary *userDict in response[@"results"]) {
        // Save an object
        
        UserDetails *userDetail = [NSEntityDescription insertNewObjectForEntityForName: kUserDetailsEntity inManagedObjectContext:CoreDataManager.sharedInstance.context];
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
        [CoreDataManager.sharedInstance saveContext];
    }
}

- (NSMutableArray<UserListCellViewModel *> *) fetchDataFromLocalDB {
    // Fetch objects
    self.personArray = [NSMutableArray array];
    
    NSArray<UserDetails *> *fetchedItems = [CoreDataManager.sharedInstance fetchObjectsForEntity: kUserDetailsEntity];
    
    for (UserDetails *userData in fetchedItems) {
        NSLog(@"Key: %@", userData.title);
        UserListCellViewModel *user = [[UserListCellViewModel alloc] init];
        [self.personArray addObject: [user initWithUserDetailsModel:userData]];
    }
    
    return  self.personArray;
}

@end
