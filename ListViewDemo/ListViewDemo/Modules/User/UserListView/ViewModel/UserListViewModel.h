//
//  UserListViewModel.h
//  ListViewDemo
//
//  Created by Bikramjeet Singh  on 24/08/23.
//

#import <Foundation/Foundation.h>
#import "APIManager.h"
#import "UserListCellViewModel.h"
#import "CoreDataHelper.h"
#import <CoreData/CoreData.h>
#import "UserDetails+CoreDataClass.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^ModelArrayCompletionBlock)(NSMutableArray<UserListCellViewModel *> * _Nullable models, NSError * _Nullable error);

@interface UserListViewModel : NSObject

//MARK: - Properties

@property (nonatomic, strong) NSMutableArray<UserListCellViewModel *> *personArray;

//MARK: - Declared Method

- (void)fetchUserDataFromAPI:(ModelArrayCompletionBlock)completion;
- (void) saveAPIDataInLocalDB: (NSDictionary *) response;
- (NSMutableArray<UserListCellViewModel *> *) fetchDataFromLocalDB;

@end

NS_ASSUME_NONNULL_END
