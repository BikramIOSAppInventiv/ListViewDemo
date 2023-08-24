//
//  UserListModel.h
//  ListViewDemo
//
//  Created by Bikramjeet Singh  on 23/08/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserListModel : NSObject

//MARK: - Properties

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSInteger userAge;
@property (nonatomic, assign) NSInteger userPostcode;

@property (nonatomic, strong) NSString *mediumUserImage;
@property (nonatomic, strong) NSString *largeUserImage;

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *userFirstName;
@property (nonatomic, strong) NSString *userLastName;

@property (nonatomic, strong) NSString *userEmailAddress;

@property (nonatomic, strong) NSString *userCity;
@property (nonatomic, strong) NSString *userState;
@property (nonatomic, strong) NSString *userCountry;

@property (nonatomic, strong) NSString *registeredDate;

//MARK: - Declared Method

- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
