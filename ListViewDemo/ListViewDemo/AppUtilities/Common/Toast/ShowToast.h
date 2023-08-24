//
//  ShowToast.h
//  ListViewDemo
//
//  Created by Bikramjeet Singh  on 24/08/23.
//

#import <Foundation/Foundation.h>
#import "UIView+Toast.h"
#import "CommonMethods.h"

NS_ASSUME_NONNULL_BEGIN

@interface ShowToast : NSObject

+ (void)showToast: (NSString *) message;

@end

NS_ASSUME_NONNULL_END
