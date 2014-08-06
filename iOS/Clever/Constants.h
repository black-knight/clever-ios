//
//  Constants.h
//  Rumpet
//
//  Created by Daniel Andersen on 14/05/14.
//  Copyright (c) 2014 Alexandra Institute A/S. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ONE_MINUTE 60.0f
#define ONE_HOUR (60.0f * ONE_MINUTE)
#define ONE_DAY (24.0f * ONE_HOUR)

@interface Constants : NSObject

+ (Constants *)sharedInstance;

@property (nonatomic, strong) NSString *hostBaseUrl;

@property (nonatomic, strong) NSString *webserviceBaseUrl;
@property (nonatomic, strong) NSString *webserviceDateFormat;

@property (nonatomic, assign) float defaultAnimationDuration;

@property (nonatomic, strong) NSDateFormatter *defaultDateFormatter;
@property (nonatomic, strong) NSDateFormatter *shortDateFormatter;
@property (nonatomic, strong) NSDateFormatter *defaultTimeFormatter;

@end
