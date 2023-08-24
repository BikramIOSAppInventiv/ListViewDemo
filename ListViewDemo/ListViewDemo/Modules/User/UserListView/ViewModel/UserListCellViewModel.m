//
//  UserListModel.m
//  ListViewDemo
//
//  Created by Bikramjeet Singh  on 23/08/23.
//

#import "UserListCellViewModel.h"

@implementation UserListCellViewModel

//MARK: - Public Methods

- (instancetype)initWithUserDetailsModel:(UserDetails *)model
{
    self = [super init];
    if (self) {
        self.userEmailAddress = model.email;
        self.userCity = model.city;
        self.userState = model.state;
        self.userCountry = model.country;
        self.userPostcode = model.postcode;
        self.mediumUserImage = model.mediumProfilePic;
        self.largeUserImage = model.largeProfilePic;
        self.userAge = model.age;
        NSString *fullName = [NSString stringWithFormat:@"%@ %@ %@", model.title, model.first, model.last];
        self.userName = fullName;
        NSString *registerDate = model.userRegisteredDate;
        NSString *userRegisterDate = [registerDate timeAgo];
        self.registeredDate = userRegisterDate;
        
        NSString *birthDate = model.userRegisteredDate;
        NSString *userDOB = [birthDate getDate];
        self.registeredDate = userRegisterDate;
        
        self.userDOB = userDOB;
    }
    return self;
}


@end
