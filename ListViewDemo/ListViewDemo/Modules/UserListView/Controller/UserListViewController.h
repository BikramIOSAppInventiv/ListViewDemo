//
//  ListViewController.h
//  ListViewDemo
//
//  Created by Bikramjeet Singh  on 23/08/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate> {
    NSArray *fruits;
}

//MARK: - IBOutlets

@property (weak, nonatomic) IBOutlet UITableView *userListTableView;

@end

NS_ASSUME_NONNULL_END

