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

- (void)getModelData:(UserListModel *)model {
    NSString *fullName = [NSString stringWithFormat:@"%@ %@ %@", model.title, model.userFirstName, model.userLastName];
    [self.userNameLabel setText: fullName];
    [self.userEmailLabel setText: model.userEmailAddress];
    [self.userCountryLabel setText: model.userCountry];
    [self.userProfilePicImageView sd_setImageWithURL:[NSURL URLWithString: model.mediumUserImage]
                                    placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
    // Create a date formatter for the input format
    NSDateFormatter *inputDateFormatter = [[NSDateFormatter alloc] init];
    [inputDateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"]; // Input format
    
    // Parse the input date string into an NSDate
    NSString *inputDateString = model.registeredDate;
    NSDate *inputDate = [inputDateFormatter dateFromString:inputDateString];
    
    // Create another date formatter for the desired output format
    NSDateFormatter *outputDateFormatter = [[NSDateFormatter alloc] init];
    [outputDateFormatter setDateFormat:@"MMMM dd, yyyy h:mm a"]; // Output format
    
    // Convert the NSDate to the desired output format
    NSString *outputDateString = [outputDateFormatter stringFromDate:inputDate];
    
    NSLog(@"Input Date: %@", inputDateString);
    NSLog(@"Output Date: %@", outputDateString);
    
    [self.userRegisteredDateLabel setText: outputDateString];
    
}

@end
