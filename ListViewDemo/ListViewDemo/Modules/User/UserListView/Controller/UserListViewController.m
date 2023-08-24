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
}

- (void)configureViewModel {
    self.viewModel = [[UserListViewModel alloc] init];
}

- (void)callGetUserDetailsDataAPI {
    
    if ([self.viewModel fetchDataFromLocalDB].count > 0) {
        [self.viewModel fetchDataFromLocalDB];
    }else {
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        [self.viewModel fetchUserDataFromAPI:^(NSMutableArray<UserListCellViewModel *> * _Nullable models, NSError * _Nullable error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                // Return the fetched models to the completion block on the main thread
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                if (error) {
                    // Handle error
                    UIAlertController *alert = [UIAlertController alertWithTitle: kWarningTitle message:error.description];
                    [alert addActionWithTitle: kOKTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                        // Handle OK action
                    }];
                    [self presentViewController:alert animated:YES completion:nil];
    //                NSLog(@"Error: %@", error);
                } else {
                    // Use the fetched models
                    NSLog(@"Fetched models: %@", models);
                    [self.userListTableView reloadData];
                }
            });
        }];
    }
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UserDetailsViewController *controler = [self.storyboard instantiateViewControllerWithIdentifier: kUserDetailsViewController];
    [controler setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    [controler bindListViewDataWithModel: [self.viewModel getUserRecords:indexPath.row]];
    [self.navigationController pushViewController:controler animated:YES];
    
}

@end
