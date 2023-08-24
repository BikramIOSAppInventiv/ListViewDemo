//
//  NSDate+TimeAgo.m
//  ListViewDemo
//
//  Created by Bikramjeet Singh  on 24/08/23.
//
// NSDate+TimeAgo.m
#import "NSDate+TimeAgo.h"

@implementation NSDate (TimeAgo)

- (NSString *)timeAgo:(NSDate*)registeredDate {
    
    NSDate *startDate = [NSDate date]; // Current date and time
    NSTimeInterval timeInterval = [registeredDate timeIntervalSinceDate:startDate];
    
    if (timeInterval < 60) {
        return [NSString stringWithFormat:@"%.0f seconds ago", timeInterval];
    } else if (timeInterval < 3600) {
        NSInteger minutes = timeInterval / 60;
        return [NSString stringWithFormat:@"%ld minutes ago", (long)minutes];
    } else if (timeInterval < 86400) {
        NSInteger hours = timeInterval / 3600;
        return [NSString stringWithFormat:@"%ld hours ago", (long)hours];
    } else if (timeInterval < 604800) {
        NSInteger days = timeInterval / 86400;
        return [NSString stringWithFormat:@"%ld days ago", (long)days];
    } else {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateStyle = NSDateFormatterShortStyle;
        return [dateFormatter stringFromDate:self];
    }
}

@end
