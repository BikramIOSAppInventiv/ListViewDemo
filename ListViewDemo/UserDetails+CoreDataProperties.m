//
//  UserDetails+CoreDataProperties.m
//  ListViewDemo
//
//  Created by Bikramjeet Singh  on 24/08/23.
//
//

#import "UserDetails+CoreDataProperties.h"

@implementation UserDetails (CoreDataProperties)

+ (NSFetchRequest<UserDetails *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"UserDetails"];
}

@dynamic first;
@dynamic last;
@dynamic title;
@dynamic userRegisteredDate;
@dynamic postcode;
@dynamic country;
@dynamic state;
@dynamic city;
@dynamic email;
@dynamic age;
@dynamic largeProfilePic;
@dynamic mediumProfilePic;

@end
