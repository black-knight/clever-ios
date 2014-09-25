//
//  Location.h
//  Clever
//
//  Created by Daniel Andersen on 08/08/14.
//  Copyright (c) 2014 Trolls Ahead. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Location : NSObject

- (CLLocationCoordinate2D)coordinate;

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *mDescription;
@property (nonatomic, strong) NSString *accessInfo;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSNumber *latitude;
@property (nonatomic, strong) NSNumber *longitude;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *postalCode;
@property (nonatomic, strong) NSString *streetName;
@property (nonatomic, strong) NSString *houseNumber;
@property (nonatomic, strong) NSString *minimapUrl;
@property (nonatomic, strong) NSString *payButtonText;
@property (nonatomic, strong) NSString *payLink;
@property (nonatomic, strong) NSString *payment;
@property (nonatomic, strong) NSString *pictureUrl;

- (NSString *)friendlyLocation;

@end
