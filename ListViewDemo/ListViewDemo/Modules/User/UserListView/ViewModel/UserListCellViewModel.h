//
//  UserListModel.h
//  ListViewDemo
//
//  Created by Bikramjeet Singh  on 23/08/23.
//

#import <Foundation/Foundation.h>
#import "UserDetails+CoreDataClass.h"
#import "NSString+CustomExtension.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserListCellViewModel : NSObject

//MARK: - Properties

@property (nonatomic, strong) NSString *userName;
@property (nonatomic, assign) NSInteger userAge;
@property (nonatomic, assign) NSInteger userPostcode;

@property (nonatomic, strong) NSString *mediumUserImage;
@property (nonatomic, strong) NSString *largeUserImage;

@property (nonatomic, strong) NSString *userEmailAddress;

@property (nonatomic, strong) NSString *userCity;
@property (nonatomic, strong) NSString *userState;
@property (nonatomic, strong) NSString *userCountry;

@property (nonatomic, strong) NSString *registeredDate;
@property (nonatomic, strong) NSString *userDOB;

//MARK: - Declared Method

- (instancetype)initWithUserDetailsModel:(UserDetails *)dict;

@end

NS_ASSUME_NONNULL_END
