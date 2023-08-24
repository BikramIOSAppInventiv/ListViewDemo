//
//  UserListTableViewCell.h
//  ListViewDemo
//
//  Created by Bikramjeet Singh  on 23/08/23.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import "UserListCellViewModel.h"
#import <SDWebImage/SDWebImage.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserListTableViewCell : UITableViewCell

//MARK: - Properties

+ (NSString *)cellIdentifier;

//MARK: - IBOutlets

@property (weak, nonatomic) IBOutlet UIImageView *userProfilePicImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *userEmailLabel;
@property (weak, nonatomic) IBOutlet UILabel *userCountryLabel;
@property (weak, nonatomic) IBOutlet UILabel *userRegisteredDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *countryTitleLabel;

//MARK: - Public Methods

- (void)setIntialUI;
- (void)getModelData:(UserListCellViewModel *)model ;

@end

NS_ASSUME_NONNULL_END
