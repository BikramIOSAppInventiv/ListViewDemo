//
//  UserListViewModel.h
//  ListViewDemo
//
//  Created by Bikramjeet Singh  on 24/08/23.
//

#import <Foundation/Foundation.h>
#import "APIManager.h"
#import "UserListModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^ModelArrayCompletionBlock)(NSMutableArray<UserListModel *> * _Nullable models, NSError * _Nullable error);

@interface UserListViewModel : NSObject

//MARK: - Properties

@property (nonatomic, strong) NSMutableArray<UserListModel *> *personArray;

//MARK: - Declared Method

- (void)fetchUserDataFromAPI:(ModelArrayCompletionBlock)completion;

@end

NS_ASSUME_NONNULL_END
