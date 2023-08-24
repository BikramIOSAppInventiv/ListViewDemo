//
//  UserListTableViewCell.m
//  ListViewDemo
//
//  Created by Bikramjeet Singh  on 23/08/23.
//

#import "UserListTableViewCell.h"

@implementation UserListTableViewCell

//MARK: - View Lifecycle Methods

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

//MARK: - Defined Method

- (void)setIntialUI {
    
}
- (void)getModelData:(UserListCellViewModel *)model {

    [self.userProfilePicImageView sd_setImageWithURL:[NSURL URLWithString: model.mediumUserImage]
                                    placeholderImage:[UIImage imageNamed:@"userPlaceHolder.png"]];
    [self.userNameLabel setText: model.userName];
    [self.userEmailLabel setText: model.userEmailAddress];
    [self.userCountryLabel setText: model.userCountry];
    [self.userRegisteredDateLabel setText: model.registeredDate];
}

@end
