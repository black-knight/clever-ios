//
//  WebserviceBase.m
//  Rumpet
//
//  Created by Daniel Andersen on 14/05/14.
//  Copyright (c) 2014 Alexandra Institute A/S. All rights reserved.
//

#import "PoiWebservice.h"
#import "Constants.h"

@interface PoiWebservice ()

@property (nonatomic, strong) NSDateFormatter *webDateFormatter;

@end

@implementation PoiWebservice

- (void)getPoiWithSuccess:(void(^)(Poi *poi))successBlock error:(void(^)(NSError *error))errorBlock {
    [[AFHTTPRequestOperationManager manager] GET:[NSString stringWithFormat:@"%@/poi", [Constants sharedInstance].webserviceBaseUrl] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        Poi *poi = [Poi fromJson:responseObject];
        successBlock(poi);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        errorBlock(error);
    }];
}

- (NSString *)dateToString:(NSDate *)date {
    return [[self dateFormatter] stringFromDate:date];
}

- (NSDate *)stringToDate:(NSString *)dateString {
    return [[self dateFormatter] dateFromString:dateString];
}

- (NSDateFormatter *)dateFormatter {
    @synchronized (self) {
        if (self.webDateFormatter == nil) {
            self.webDateFormatter = [[NSDateFormatter alloc] init];
            self.webDateFormatter.dateFormat = [Constants sharedInstance].webserviceDateFormat;
        }
        return self.webDateFormatter;
    }
}

@end
