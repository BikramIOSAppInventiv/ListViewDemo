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
#import "MBProgressHUD.h"
#import "UIAlertController+Extensions.h"
#import "ActivityIndicator.h"

NS_ASSUME_NONNULL_BEGIN

@class UserDetailsViewController;

@interface UserListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

//MARK: - IBOutlets

@property (weak, nonatomic) IBOutlet UITableView *userListTableView;
@property (nonatomic, strong) ActivityIndicator *footerView;

//MARK: - Properties

@property (nonatomic, strong) NSMutableArray<UserListCellViewModel *> *personArray;
@property (nonatomic, strong) UserListViewModel *viewModel;

//MARK: - Public Methods

- (void)configureTableView;
- (void)configureViewModel;
- (void)callGetUserDetailsDataAPI;
- (void)loadNextPageAPIData;

@end

NS_ASSUME_NONNULL_END

