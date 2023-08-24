//
//  UserDetails+CoreDataProperties.h
//  ListViewDemo
//
//  Created by Bikramjeet Singh  on 24/08/23.
//
//

#import "UserDetails+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface UserDetails (CoreDataProperties)

+ (NSFetchRequest<UserDetails *> *)fetchRequest NS_SWIFT_NAME(fetchRequest());

@property (nullable, nonatomic, copy) NSString *first;
@property (nullable, nonatomic, copy) NSString *last;
@property (nullable, nonatomic, copy) NSString *title;
@property (nullable, nonatomic, copy) NSString *userRegisteredDate;
@property (nonatomic) int64_t postcode;
@property (nullable, nonatomic, copy) NSString *country;
@property (nullable, nonatomic, copy) NSString *state;
@property (nullable, nonatomic, copy) NSString *city;
@property (nullable, nonatomic, copy) NSString *email;
@property (nonatomic) int16_t age;
@property (nullable, nonatomic, copy) NSString *largeProfilePic;
@property (nullable, nonatomic, copy) NSString *mediumProfilePic;
@property (nullable, nonatomic, copy) NSString *userDOB;

@end

NS_ASSUME_NONNULL_END
