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
    // Do any additional setup after loading the view.
    fruits = @[@"Apple",@"Mango",@"Orange",@"Apple",@"Mango",@"Orange", @"Apple",@"Mango",@"Orange",@"Apple",@"Mango",@"Orange"];
    UINib *nib = [UINib nibWithNibName:@"UserListTableViewCell" bundle:nil];
    [_userListTableView registerNib:nib forCellReuseIdentifier:@"UserListTableViewCell"];
    _userListTableView.delegate = self;
    _userListTableView.dataSource = self;
}

//MARK: - UITableView Delegate and DataSource Methods

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return fruits.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserListTableViewCell"];
    cell.textLabel.text = fruits[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UserDetailsViewController *controler = [self.storyboard instantiateViewControllerWithIdentifier:@"UserDetailsViewController"];
    [controler setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    [self.navigationController pushViewController:controler animated:YES];
    
}

@end
