//
//  JsonResult.m
//  Rumpet
//
//  Created by Daniel Andersen on 15/05/14.
//  Copyright (c) 2014 Alexandra Institute A/S. All rights reserved.
//

#import "Poi.h"
#import "CacheableItem.h"
#import "ConnectorVariant.h"
#import "Location.h"
#import "Constants.h"

@implementation Poi

+ (Poi *)fromJson:(NSDictionary *)jsonDict {
    Poi *poi = [[Poi alloc] init];
    poi.cacheableItems = [self parseCacheableItemsFromDict:jsonDict];
    poi.connectorVariants = [self parseConnectorVariantsFromDict:jsonDict];
    poi.locations = [self parseLocationsFromDict:jsonDict];
    return poi;
}

+ (NSDictionary *)parseCacheableItemsFromDict:(NSDictionary *)jsonDict {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];

    NSDictionary *itemsDict = [jsonDict objectForKey:@"cacheableItems"];
    for (NSString *key in [itemsDict keyEnumerator]) {
        CacheableItem *cacheableItem = [CacheableItem new];
        cacheableItem.pictureUrl = [itemsDict objectForKey:key];
        [dict setObject:cacheableItem forKey:key];
    }
    return dict;
}

+ (NSDictionary *)parseConnectorVariantsFromDict:(NSDictionary *)jsonDict {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    NSDictionary *itemsDict = [jsonDict objectForKey:@"connectorVariants"];
    for (NSString *key in [itemsDict keyEnumerator]) {
        [dict setObject:[self parseConnectorVariantFromDict:[itemsDict objectForKey:key]] forKey:key];
    }
    return dict;
}

+ (ConnectorVariant *)parseConnectorVariantFromDict:(NSDictionary *)dict {
    ConnectorVariant *connectorVariant = [ConnectorVariant new];
    connectorVariant.name = [self stringFromDict:dict key:@"name"];
    connectorVariant.capacity = [self numberFromDict:dict key:@"capacity"];
    connectorVariant.filter = [self numberFromDict:dict key:@"filter"];
    connectorVariant.iconKey = [self stringFromDict:dict key:@"icon"];
    return connectorVariant;
}

+ (NSDictionary *)parseLocationsFromDict:(NSDictionary *)jsonDict {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    NSDictionary *itemsDict = [jsonDict objectForKey:@"locations"];
    for (NSString *key in [itemsDict keyEnumerator]) {
        [dict setObject:[self parseLocationFromDict:[itemsDict objectForKey:key]] forKey:key];
    }
    return dict;
}

+ (Location *)parseLocationFromDict:(NSDictionary *)dict {
    Location *location = [Location new];

    location.name = [self stringFromDict:dict key:@"name"];
    location.description = [self stringFromDict:dict key:@"description"];
    location.accessInfo = [self stringFromDict:dict key:@"accessInfo"];
    location.icon = [self stringFromDict:dict key:@"icon"];
    location.latitude = [self numberFromDict:dict key:@"latitude"];
    location.longitude = [self numberFromDict:dict key:@"longitude"];
    location.city = [self stringFromDict:dict key:@"city"];
    location.postalCode = [self stringFromDict:dict key:@"postalCode"];
    location.streetName = [self stringFromDict:dict key:@"streetName"];
    location.houseNumber = [self stringFromDict:dict key:@"houseNumber"];
    location.minimapUrl = [self stringFromDict:dict key:@"minimapUrl"];
    location.payButtonText = [self stringFromDict:dict key:@"payButtonText"];
    location.payLink = [self stringFromDict:dict key:@"payLink"];
    location.payment = [self stringFromDict:dict key:@"payment"];
    location.pictureUrl = [self stringFromDict:dict key:@"pictureUrl"];

    return location;
}

+ (NSString *)stringFromDict:(NSDictionary *)dict key:(NSString *)key {
    return [dict objectForKey:key];
}

+ (NSNumber *)numberFromDict:(NSDictionary *)dict key:(NSString *)key {
    if ([dict objectForKey:key] != nil) {
        NSString *value = [dict objectForKey:key];
        return [NSNumber numberWithDouble:[value doubleValue]];
    } else {
        return nil;
    }
}

@end
