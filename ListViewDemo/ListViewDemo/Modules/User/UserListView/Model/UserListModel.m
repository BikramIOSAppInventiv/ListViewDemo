//
//  UserListModel.m
//  ListViewDemo
//
//  Created by Bikramjeet Singh  on 23/08/23.
//

#import "UserListModel.h"

@implementation UserListModel

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        self.title = dict[@"name"][@"title"];
        self.userFirstName = dict[@"name"][@"first"];
        self.userLastName = dict[@"name"][@"last"];
        self.userEmailAddress = dict[@"email"];
        self.userCity = dict[@"location"][@"city"];
        self.userState = dict[@"location"][@"state"];
        self.userCountry = dict[@"location"][@"country"];
        self.userPostcode = dict[@"location"][@"postcode"];
        self.registeredDate = dict[@"registered"][@"date"];
        self.mediumUserImage = dict[@"picture"][@"medium"];
        self.largeUserImage = dict[@"picture"][@"large"];
        
        _age = [dict[@"age"] integerValue];
    }
    return self;
}


@end
