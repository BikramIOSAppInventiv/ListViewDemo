//
//  ListViewController.h
//  ListViewDemo
//
//  Created by Bikramjeet Singh  on 23/08/23.
//

#import <UIKit/UIKit.h>
#import "APIManager.h"
#import "UserListTableViewCell.h"
#import "UserListViewModel.h"
#import "MBProgressHUD.h"

NS_ASSUME_NONNULL_BEGIN

@class UserDetailsViewController;

@interface UserListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

//MARK: - IBOutlets

@property (weak, nonatomic) IBOutlet UITableView *userListTableView;
@property (nonatomic, strong) NSMutableArray<UserListModel *> *personArray;

@property (nonatomic, strong) UserListViewModel *viewModel;

@end

NS_ASSUME_NONNULL_END

