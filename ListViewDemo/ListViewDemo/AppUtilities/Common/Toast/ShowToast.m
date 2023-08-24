//
//  ShowToast.m
//  ListViewDemo
//
//  Created by Bikramjeet Singh  on 24/08/23.
//

#import "ShowToast.h"

@implementation ShowToast

//MARK: - Public Methods

+ (void)showToast: (NSString *) message {
    
    // create a new style
    CSToastStyle *style = [[CSToastStyle alloc] initWithDefaultStyle];

    // this is just one of many style options
    style.messageColor = [UIColor orangeColor];

    // present the toast with the new style
    [[CommonMethods topViewController].view makeToast: message
                duration:2.0
                position:CSToastPositionBottom
                   style:style];

    // or perhaps you want to use this style for all toasts going forward?
    // just set the shared style and there's no need to provide the style again
    [CSToastManager setSharedStyle:style];

    // toggle "tap to dismiss" functionality
    [CSToastManager setTapToDismissEnabled:YES];

    // toggle queueing behavior
    [CSToastManager setQueueEnabled:YES];

}

@end
