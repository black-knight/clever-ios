//
//  WebserviceBase.h
//  Rumpet
//
//  Created by Daniel Andersen on 14/05/14.
//  Copyright (c) 2014 Alexandra Institute A/S. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

#import "Poi.h"

@interface PoiWebservice : NSObject

- (void)getPoiWithSuccess:(void(^)(Poi *poi))successBlock error:(void(^)(NSError *error))errorBlock;

- (NSString *)dateToString:(NSDate *)date;
- (NSDate *)stringToDate:(NSString *)dateString;

@end
