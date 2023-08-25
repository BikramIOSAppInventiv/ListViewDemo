//
//  ActivityIndicator.m
//  ListViewDemo
//
//  Created by Bikramjeet Singh  on 25/08/23.
//

// ActivityIndicator.m

#import "ActivityIndicator.h"

@implementation ActivityIndicator

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _activityIndicator.center = CGPointMake(frame.size.width / 2, frame.size.height / 2);
        [self addSubview:_activityIndicator];
    }
    return self;
}

@end
