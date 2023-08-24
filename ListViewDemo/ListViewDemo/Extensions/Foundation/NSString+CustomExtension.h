//
//  NSString+CustomExtension.h
//  ListViewDemo
//
//  Created by Bikramjeet Singh  on 24/08/23.
//

// NSString+CustomExtension.m

#import "NSString+CustomExtension.h"

@implementation NSString (CustomExtension)

- (NSString *)getDate {
    // Create a date formatter for the input format
    NSDateFormatter *inputDateFormatter = [[NSDateFormatter alloc] init];
    [inputDateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"]; // Input format
    
    // Parse the input date string into an NSDate
    NSString *inputDateString = self;
    NSDate *inputDate = [inputDateFormatter dateFromString:inputDateString];
    
    // Create another date formatter for the desired output format
    NSDateFormatter *outputDateFormatter = [[NSDateFormatter alloc] init];
    [outputDateFormatter setDateFormat:@"dd MMM yyyy"]; // Output format
    
    //     Convert the NSDate to the desired output format
    NSString *outputDateString = [outputDateFormatter stringFromDate:inputDate];
    
    return outputDateString;
    
}

- (NSString *)timeAgo {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"];
    NSDate *date = [dateFormatter dateFromString:self];
    
    NSTimeInterval timeInterval = [date timeIntervalSinceNow];
    NSTimeInterval timeInSeconds = -timeInterval; // Make sure it's positive
    
    NSInteger minutes = (NSInteger)(timeInSeconds / 60);
    NSInteger hours = minutes / 60;
    NSInteger days = hours / 24;
    NSInteger weeks = days / 7;
    NSInteger months = days / 30;
    NSInteger years = days / 365;
    
    NSString *timeAgo;
    
    if (years > 0) {
        timeAgo = [NSString stringWithFormat:@"%ld years ago", (long)years];
    } else if (months > 0) {
        timeAgo = [NSString stringWithFormat:@"%ld months ago", (long)months];
    } else if (weeks > 0) {
        timeAgo = [NSString stringWithFormat:@"%ld weeks ago", (long)weeks];
    } else if (days > 0) {
        timeAgo = [NSString stringWithFormat:@"%ld days ago", (long)days];
    } else if (hours > 0) {
        timeAgo = [NSString stringWithFormat:@"%ld hours ago", (long)hours];
    } else if (minutes > 0) {
        timeAgo = [NSString stringWithFormat:@"%ld minutes ago", (long)minutes];
    } else {
        timeAgo = @"Just now";
    }
    
    return  timeAgo;
}

@end
