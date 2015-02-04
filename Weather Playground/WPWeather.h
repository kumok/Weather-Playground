//
//  WPWeather.h
//  Weather Playground
//
//  Created by Duc Ho on 2/3/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WPWeather : NSObject


@property (nonatomic, strong) NSString *locationName;
@property (nonatomic, strong) NSString *weatherMain;
@property (nonatomic, strong) NSString *weatherDescription;
@property (nonatomic, strong) NSString *weatherIcon;
@property (nonatomic, strong) NSNumber *weatherTemp;
- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
