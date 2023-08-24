//
//  UIAlertController+Extensions.m
//  ListViewDemo
//
//  Created by Bikramjeet Singh  on 24/08/23.
//

// UIAlertController+Extensions.m
#import "UIAlertController+Extensions.h"

@implementation UIAlertController (Extensions)

+ (instancetype)alertWithTitle:(NSString *)title message:(NSString *)message {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    return alertController;
}

- (void)addActionWithTitle:(NSString *)title style:(UIAlertActionStyle)style handler:(void (^)(UIAlertAction *action))handler {
    UIAlertAction *action = [UIAlertAction actionWithTitle:title style:style handler:handler];
    [self addAction:action];
}

@end
