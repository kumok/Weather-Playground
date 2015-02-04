//
//  WPWeatherController.h
//  Weather Playground
//
//  Created by Duc Ho on 2/3/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WPWeather.h"


@interface WPWeatherController : NSObject

+ (WPWeatherController *)sharedInstance;

- (void)getWeatherWithName:(NSString *)name completion:(void (^)(WPWeather *weather))completion;


@end
