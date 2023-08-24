//
//  UserListViewModel.m
//  ListViewDemo
//
//  Created by Bikramjeet Singh  on 24/08/23.
//

#import "UserListViewModel.h"

@implementation UserListViewModel

- (void)fetchUserDataFromAPI:(ModelArrayCompletionBlock)completion  {
    
    NSURL *apiURL = [NSURL URLWithString:@"https://randomuser.me/api/?page=3&results=10"];
    
    [APIManager fetchDataFromAPIWithURL:apiURL completion:^(NSDictionary *response, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            NSLog(@"Response: %@", response);
            NSUInteger count = [response count];
            NSLog(@"The count of key-value pairs is: %lu", (unsigned long)count);
            self.personArray = [NSMutableArray array];
            for (NSDictionary *userDict in response[@"results"]) {
                NSLog(@"Key: %@", userDict);
                UserListModel *user = [[UserListModel alloc] init];
                [self.personArray addObject: [user initWithDictionary:userDict]];
            }
            
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

@end
