//
//  ListViewController.m
//  ListViewDemo
//
//  Created by Bikramjeet Singh  on 23/08/23.
//

#import "UserListViewController.h"
#import "ListViewDemo-Swift.h"

@interface UserListViewController ()

@end

@implementation UserListViewController

//MARK: - View Lifecycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureTableView];
    [self configureViewModel];
    [self callGetUserDetailsDataAPI];
}

//MARK: - Public Methods

- (void)configureTableView {
    UINib *nib = [UINib nibWithNibName: UserListTableViewCell.cellIdentifier bundle:nil];
    [self.userListTableView registerNib:nib forCellReuseIdentifier: UserListTableViewCell.cellIdentifier];
    self.userListTableView.delegate = self;
    self.userListTableView.dataSource = self;
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(refreshData) forControlEvents:UIControlEventValueChanged];
    [self.userListTableView addSubview:self.refreshControl];
    
    self.footerView = [[ActivityIndicator alloc] initWithFrame:CGRectMake(0, 0, self.userListTableView.frame.size.width, 44)];
    
    self.userListTableView.tableFooterView = nil; // Start with no footer view
}

- (void)configureViewModel {
    self.viewModel = [[UserListViewModel alloc] init];
}

- (void)refreshData {
    // Refresh action: Fetch new data or update existing data
    self.viewModel.currentPage = 1;
    [self loadNextPageAPIData];
}

- (void)callGetUserDetailsDataAPI {
    
    if ([self.viewModel fetchDataFromLocalDB].count > 0) {
         self.viewModel.personArray = [self.viewModel fetchDataFromLocalDB];
         NSInteger currentPage = (self.viewModel.totalUserRecords + self.viewModel.pageSize - 1) / self.viewModel.pageSize;
        self.viewModel.currentPage = currentPage;
    }else {
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        [self.viewModel fetchUserDataFromAPI:^(NSMutableArray<UserListCellViewModel *> * _Nullable models, NSError * _Nullable error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                // Return the fetched models to the completion block on the main thread
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                if (error) {
                    // Handle error
                    [ShowToast showToast: error.description];
                } else {
                    // Use the fetched models
                    [self.userListTableView reloadData];
                }
            });
        }];
    }
}

- (void)loadNextPageAPIData {
    self.userListTableView.tableFooterView = self.footerView;
    [self.footerView.activityIndicator startAnimating];
    [self.viewModel fetchUserDataFromAPI:^(NSMutableArray<UserListCellViewModel *> * _Nullable models, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            // Return the fetched models to the completion block on the main thread
            if (error) {
                // Handle error
                [ShowToast showToast: error.description];
            } else {
                // Use the fetched models
                [self.userListTableView reloadData];
                [self.refreshControl endRefreshing];
                [self.footerView.activityIndicator stopAnimating];
                self.userListTableView.tableFooterView = nil; // Hide footer view
            }
        });
    }];
}

//MARK: - UITableView Delegate and DataSource Methods

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.totalUserRecords;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UserListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: UserListTableViewCell.cellIdentifier];
    [cell getModelData: [self.viewModel getUserRecords:indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    // Check if the last cell is about to be displayed
        if ((indexPath.row == self.viewModel.totalUserRecords - 1) && self.viewModel.isFeatchingData == false) {
            self.viewModel.currentPage += 1;
            [self loadNextPageAPIData]; // Load the next page when the last cell is displayed
        }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UserDetailsViewController *controler = [self.storyboard instantiateViewControllerWithIdentifier: kUserDetailsViewController];
    [controler setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    [controler bindListViewDataWithModel: [self.viewModel getUserRecords:indexPath.row]];
    [self.navigationController pushViewController:controler animated:YES];
    
}

@end
