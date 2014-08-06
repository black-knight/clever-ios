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
#import "Constants.h"

@implementation Poi

+ (Poi *)fromJson:(NSDictionary *)jsonDict {
    Poi *poi = [[Poi alloc] init];
    poi.cacheableItems = [self parseCacheableItemsFromDict:jsonDict];
    poi.connectorVariants = [self parseConnectorVariantsFromDict:jsonDict];
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
    return itemsDict;
}

+ (NSDictionary *)parseConnectorVariantsFromDict:(NSDictionary *)jsonDict {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    NSDictionary *itemsDict = [jsonDict objectForKey:@"connectorVariants"];
    for (NSString *key in [itemsDict keyEnumerator]) {
        [dict setObject:[self parseConnectorVariantFromDict:[itemsDict objectForKey:key]] forKey:key];
    }
    return itemsDict;
}

+ (ConnectorVariant *)parseConnectorVariantFromDict:(NSDictionary *)dict {
    ConnectorVariant *connectorVariant = [ConnectorVariant new];
    connectorVariant.name = [self stringFromDict:dict key:@"name"];
    connectorVariant.capacity = [self numberFromDict:dict key:@"capacity"];
    connectorVariant.filter = [self numberFromDict:dict key:@"filter"];
    connectorVariant.iconKey = [self stringFromDict:dict key:@"icon"];
    return connectorVariant;
}

+ (NSString *)stringFromDict:(NSDictionary *)dict key:(NSString *)key {
    return [dict objectForKey:key];
}

+ (NSNumber *)numberFromDict:(NSDictionary *)dict key:(NSString *)key {
    if ([dict objectForKey:key] != nil) {
        NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
        [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
        return [numberFormatter numberFromString:[dict objectForKey:key]];
    } else {
        return nil;
    }
}

@end
