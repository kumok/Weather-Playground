//
//  WPWeather.m
//  Weather Playground
//
//  Created by Duc Ho on 2/3/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "WPWeather.h"

static NSString * const locationKey = @"name";
static NSString * const weatherMainKey = @"main";
static NSString * const weatherDescriptionKey = @"description";
static NSString * const weatherIconKey = @"icon";
static NSString * const weatherTempKey = @"temp";


@implementation WPWeather

- (id)initWithDictionary:(NSDictionary *)dictionary {
    
    self = [super init];
    if (self) {
        self.locationName = dictionary[locationKey];
        self.weatherMain = [dictionary[@"weather"][0] objectForKey:weatherMainKey];
        self.weatherTemp = [dictionary[@"main"] objectForKey:weatherTempKey];
        self.weatherDescription = [dictionary[@"weather"][0] objectForKey:weatherDescriptionKey];
        self.weatherIcon = [dictionary[@"weather"][0] objectForKey:weatherIconKey];
    }
    return self;
}


@end
