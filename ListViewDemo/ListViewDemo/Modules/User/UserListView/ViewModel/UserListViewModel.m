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

- (instancetype)init {
    self = [super init];
    if (self) {
        _personArray = [NSMutableArray array];
        _isFeatchingData = false;
        _currentPage = 1;
        _pageSize = 10; // Adjust this value based on your requirements
    }
    return self;
}

//MARK: - Public Methods

- (UserListCellViewModel *)getUserRecords: (NSInteger)index {
    if (index < self.personArray.count) {
        return [self.personArray objectAtIndex: index];
    }else {
        NSLog(@"Index is out of bounds");
        return nil;
    }
}

- (void)fetchUserDataFromAPI:(ModelArrayCompletionBlock)completion  {
    
//    NSString *urlString = [NSString stringWithFormat:@"%@%@", kBaseURL, kAPIKey];
    
//    NSString *urlString = @"https://randomuser.me/api/?page=1&results=10";
    
    NSString *urlString = [NSString stringWithFormat:@"%@?page=%ld&results=%ld", kBaseURL, (long)self.currentPage, (long)self.pageSize];
    
    NSLog(@"Current URL%@", urlString);
    
    NSURL *apiURL = [NSURL URLWithString:urlString];
    self.isFeatchingData = true;
    [APIManager fetchDataFromAPIWithURL:apiURL completion:^(NSDictionary *response, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
            completion(nil, error);
        } else {
            self.isFeatchingData = false;
            [self.personArray removeAllObjects ];
            if (self.currentPage == 1) {
//                [CoreDataManager.sharedInstance clearedLocalDB: kUserDetailsEntity];
            }
            UserListViewModel *person = [[UserListViewModel alloc] init];
            [person saveAPIDataInLocalDB:response];
            [self.personArray addObjectsFromArray:[person fetchDataFromLocalDB]];
            if (completion) {
                completion(self.personArray, nil);
            }
        }
    }];
}

- (void) saveAPIDataInLocalDB: (NSDictionary *) response {
    
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
    
    NSMutableArray<UserListCellViewModel *> *myArray = [NSMutableArray<UserListCellViewModel *> array];
    
    NSMutableArray<UserDetails *> *fetchedItems = [CoreDataManager.sharedInstance fetchObjectsForEntity: kUserDetailsEntity];
    
    for (UserDetails *userData in fetchedItems) {
        UserListCellViewModel *user = [[UserListCellViewModel alloc] init];
        [myArray addObject: [user initWithUserDetailsModel:userData]];
    }
    
    return  myArray;
}

@end
