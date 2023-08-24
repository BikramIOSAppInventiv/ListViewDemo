//
//  APIManager.m
//  ListViewDemo
//
//  Created by Bikramjeet Singh  on 23/08/23.
//

#import "APIManager.h"

@implementation APIManager

//MARK: - Public Methods

+ (void)fetchDataFromAPIWithURL:(NSURL *)url completion:(void (^)(NSDictionary *response, NSError *error))completion {
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            completion(nil, error);
            return;
        }
        
        NSError *jsonError = nil;
        NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if (jsonError) {
            completion(nil, jsonError);
        } else {
            completion(responseDict, nil);
        }
    }];
    
    [dataTask resume];
}

@end
