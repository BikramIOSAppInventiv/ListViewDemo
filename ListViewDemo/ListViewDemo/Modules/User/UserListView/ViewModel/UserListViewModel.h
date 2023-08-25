//
//  UserListViewModel.h
//  ListViewDemo
//
//  Created by Bikramjeet Singh  on 24/08/23.
//

#import <Foundation/Foundation.h>
#import "APIManager.h"
#import "UserListCellViewModel.h"
#import "CoreDataManager.h"
#import <CoreData/CoreData.h>
#import "UserDetails+CoreDataClass.h"
#import "Constants.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^ModelArrayCompletionBlock)(NSMutableArray<UserListCellViewModel *> * _Nullable models, NSError * _Nullable error);

@interface UserListViewModel : NSObject

//MARK: - Properties

@property (nonatomic, strong) NSMutableArray<UserListCellViewModel *> *personArray;
- (NSInteger)totalUserRecords;
@property (nonatomic, assign) NSInteger currentPage;
@property (nonatomic, assign) NSInteger pageSize;
@property (nonatomic, assign) BOOL isFeatchingData;

//MARK: - Public Methods

- (UserListCellViewModel *)getUserRecords: (NSInteger)index;
- (void)fetchUserDataFromAPI:(ModelArrayCompletionBlock)completion;
- (void) saveAPIDataInLocalDB: (NSDictionary *) response;
- (NSMutableArray<UserListCellViewModel *> *) fetchDataFromLocalDB;

@end

NS_ASSUME_NONNULL_END
