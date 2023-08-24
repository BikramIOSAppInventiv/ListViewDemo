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
//    // Create a date formatter for the input format
//    NSDateFormatter *inputDateFormatter = [[NSDateFormatter alloc] init];
//    [inputDateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"]; // Input format
//
//    // Parse the input date string into an NSDate
//    NSString *inputDateString = self;
//    NSDate *inputDate = [inputDateFormatter dateFromString:inputDateString];
//
//    // Create another date formatter for the desired output format
////    NSDateFormatter *outputDateFormatter = [[NSDateFormatter alloc] init];
////    [outputDateFormatter setDateFormat:@"MMMM dd, yyyy h:mm a"]; // Output format
//
//    // Convert the NSDate to the desired output format
////    NSString *outputDateString = [outputDateFormatter stringFromDate:inputDate];
//
////    NSLog(@"Input Date: %@", inputDateString);
////    NSLog(@"Output Date: %@", outputDateString);
//
//    NSDate *startDate = [NSDate date]; // Current date and time
////    NSDate *endDate = [NSDate dateWithTimeIntervalSinceNow:3600]; // One hour from now
//    NSTimeInterval timeInterval = [inputDate timeIntervalSinceDate:startDate];
//
//    if (timeInterval < 60) {
//        return [NSString stringWithFormat:@"%.0f seconds ago", timeInterval];
//    } else if (timeInterval < 3600) {
//        NSInteger minutes = timeInterval / 60;
//        return [NSString stringWithFormat:@"%ld minutes ago", (long)minutes];
//    } else if (timeInterval < 86400) {
//        NSInteger hours = timeInterval / 3600;
//        return [NSString stringWithFormat:@"%ld hours ago", (long)hours];
//    } else if (timeInterval < 604800) {
//        NSInteger days = timeInterval / 86400;
//        return [NSString stringWithFormat:@"%ld days ago", (long)days];
//    } else {
//        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//        dateFormatter.dateStyle = NSDateFormatterShortStyle;
//        return [dateFormatter stringFromDate:inputDate];
//    }
    
    
//    return outputDateString;
    
    
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
