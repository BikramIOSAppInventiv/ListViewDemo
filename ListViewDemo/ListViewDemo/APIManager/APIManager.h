//
//  APIManager.h
//  ListViewDemo
//
//  Created by Bikramjeet Singh  on 23/08/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface APIManager : NSObject

+ (void)fetchDataFromAPIWithURL:(NSURL *)url completion:(void (^)(NSDictionary *response, NSError *error))completion;

@end

NS_ASSUME_NONNULL_END
