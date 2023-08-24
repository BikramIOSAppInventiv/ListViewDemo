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

//MARK: - Defined Methods

- (void)configureTableView {
    UINib *nib = [UINib nibWithNibName:@"UserListTableViewCell" bundle:nil];
    [self.userListTableView registerNib:nib forCellReuseIdentifier:@"UserListTableViewCell"];
    self.userListTableView.delegate = self;
    self.userListTableView.dataSource = self;
}

- (void)configureViewModel {
    self.viewModel = [[UserListViewModel alloc] init];
}

- (void)callGetUserDetailsDataAPI {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [self.viewModel fetchUserDataFromAPI:^(NSMutableArray<UserListModel *> * _Nullable models, NSError * _Nullable error) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        if (error) {
            // Handle error
            NSLog(@"Error: %@", error);
        } else {
            // Use the fetched models
            NSLog(@"Fetched models: %@", models);
            [self.userListTableView reloadData];
        }
    }];
}

//MARK: - UITableView Delegate and DataSource Methods

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.personArray.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UserListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserListTableViewCell"];
    [cell getModelData: [self.viewModel.personArray objectAtIndex: indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UserDetailsViewController *controler = [self.storyboard instantiateViewControllerWithIdentifier:@"UserDetailsViewController"];
    [controler setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    [controler bindListViewDataWithModel: [self.viewModel.personArray objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:controler animated:YES];
    
}

@end
