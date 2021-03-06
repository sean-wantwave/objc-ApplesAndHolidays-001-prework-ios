//
//  FISAppDelegate.m
//  ApplesAndHolidays
//
//  Created by Al Tyus on 5/30/14.
//  Copyright (c) 2014 com.flatironschool. All rights reserved.
//

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}


- (NSArray *)pickApplesFromFruits:(NSArray *)fruits {
    
    NSPredicate *appleFilter = [NSPredicate predicateWithFormat:@"self LIKE 'apple'"];
    NSArray *appleOnlyArray = [fruits filteredArrayUsingPredicate:appleFilter];
    
    return appleOnlyArray;
}

- (NSArray *)holidaysInSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    
    NSArray *holidaysInThisSeason = database[season];
    
    return holidaysInThisSeason;
}

- (NSArray *)suppliesInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    
    NSArray *holidaySuppliesNeeded = database[season][holiday];
    
    return holidaySuppliesNeeded;
}

- (BOOL)holiday:(NSString *)holiday isInSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    
    if ([[database[season] allKeys] containsObject:holiday]) {
        return YES;
    } else {
        return NO;
    }

}

- (BOOL)supply:(NSString *)supply isInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    
    if ([database[season][holiday] containsObject:supply]) {
        return YES;
    } else {
        return NO;
    }
    
}

- (NSDictionary *)addHoliday:(NSString *)holiday toSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    
    database[season][holiday] = @[];
    
    return database;
}

- (NSDictionary *)addSupply:(NSString *)supply toHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    
    [database[season][holiday] addObject:supply];
    
    return database;
}

@end