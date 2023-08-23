//
//  ListViewController.h
//  ListViewDemo
//
//  Created by Bikramjeet Singh  on 23/08/23.
//

#import <UIKit/UIKit.h>
#import "APIManager.h"
#import "UserListModel.h"
#import "UserListTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@class UserDetailsViewController;

@interface UserListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

//MARK: - IBOutlets

@property (weak, nonatomic) IBOutlet UITableView *userListTableView;
@property (nonatomic, strong) NSMutableArray<UserListModel *> *personArray;

@end

NS_ASSUME_NONNULL_END

