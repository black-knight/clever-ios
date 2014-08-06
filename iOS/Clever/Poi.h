//
//  JsonResult.h
//  Rumpet
//
//  Created by Daniel Andersen on 15/05/14.
//  Copyright (c) 2014 Alexandra Institute A/S. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Poi : NSObject

+ (Poi *)fromJson:(NSDictionary *)jsonDict;

@property (nonatomic, strong) NSDictionary *cacheableItems;
@property (nonatomic, strong) NSDictionary *connectorVariants;
@property (nonatomic, strong) NSDictionary *locations;

@end
