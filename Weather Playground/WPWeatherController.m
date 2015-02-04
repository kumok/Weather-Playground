//
//  WPWeatherController.m
//  Weather Playground
//
//  Created by Duc Ho on 2/3/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "WPWeatherController.h"
#import "WPNetworkController.h"

@implementation WPWeatherController

+ (WPWeatherController *)sharedInstance {
    static WPWeatherController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [WPWeatherController new];
    });
    return sharedInstance;
}

- (void)getWeatherWithName:(NSString *)name completion:(void (^)(WPWeather *weather))completion {

    NSString *path = [NSString stringWithFormat:@"weather?q=/%@", name];
    
    [[WPNetworkController api] GET:path parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary *responseWeather = responseObject;
        
//        NSMutableArray *weather = [NSMutableArray new];
//        for (NSDictionary *dictionary in responseWeather) {
//            [weather addObject:[[WPWeather alloc] initWithDictionary:dictionary]];
//        }
        WPWeather * w = [[WPWeather alloc] initWithDictionary:responseWeather];
        completion(w);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(nil);
    }];
}

@end
