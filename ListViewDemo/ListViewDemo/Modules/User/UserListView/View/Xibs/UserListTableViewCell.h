//
//  UserListTableViewCell.h
//  ListViewDemo
//
//  Created by Bikramjeet Singh  on 23/08/23.
//

#import <UIKit/UIKit.h>
#import "UserListCellViewModel.h"
#import <SDWebImage/SDWebImage.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserListTableViewCell : UITableViewCell

//MARK: - IBOutlets

@property (weak, nonatomic) IBOutlet UIImageView *userProfilePicImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *userEmailLabel;
@property (weak, nonatomic) IBOutlet UILabel *userCountryLabel;
@property (weak, nonatomic) IBOutlet UILabel *userRegisteredDateLabel;

//MARK: - Declared Method

- (void)getModelData:(UserListCellViewModel *)model ;

@end

NS_ASSUME_NONNULL_END
