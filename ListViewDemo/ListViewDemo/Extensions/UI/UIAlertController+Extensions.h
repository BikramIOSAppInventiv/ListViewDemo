//
//  UIAlertController+Extensions.h
//  ListViewDemo
//
//  Created by Bikramjeet Singh  on 24/08/23.
//

// UIAlertController+Extensions.h
#import <UIKit/UIKit.h>

@interface UIAlertController (Extensions)

+ (instancetype)alertWithTitle:(NSString *)title message:(NSString *)message;
- (void)addActionWithTitle:(NSString *)title style:(UIAlertActionStyle)style handler:(void (^)(UIAlertAction *action))handler;

@end
