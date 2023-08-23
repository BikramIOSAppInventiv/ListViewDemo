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
    UINib *nib = [UINib nibWithNibName:@"UserListTableViewCell" bundle:nil];
    [self.userListTableView registerNib:nib forCellReuseIdentifier:@"UserListTableViewCell"];
    self.userListTableView.delegate = self;
    self.userListTableView.dataSource = self;
    self.personArray = [NSMutableArray array];
    
    NSURL *apiURL = [NSURL URLWithString:@"https://randomuser.me/api/?page=3&results=10"];
    
    [APIManager fetchDataFromAPIWithURL:apiURL completion:^(NSDictionary *response, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            NSLog(@"Response: %@", response);
            NSUInteger count = [response count];
            NSLog(@"The count of key-value pairs is: %lu", (unsigned long)count);
            for (NSDictionary *userDict in response[@"results"]) {
                NSLog(@"Key: %@", userDict);
                UserListModel *user = [[UserListModel alloc] init];
                [self.personArray addObject: [user initWithDictionary:userDict]];
            }
            
            NSLog(@"Response: %@", self.personArray);
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.userListTableView reloadData];
            });
        }
    }];
}

//MARK: - UITableView Delegate and DataSource Methods

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.personArray.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UserListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserListTableViewCell"];
    [cell printName: [self.personArray objectAtIndex: indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UserDetailsViewController *controler = [self.storyboard instantiateViewControllerWithIdentifier:@"UserDetailsViewController"];
    [controler setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    [controler bindListViewDataWithModel: [self.personArray objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:controler animated:YES];
    
}

@end
