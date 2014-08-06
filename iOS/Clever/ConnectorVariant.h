//
//  ConnectorVariant.h
//  Clever
//
//  Created by Daniel Andersen on 06/08/14.
//  Copyright (c) 2014 Trolls Ahead. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConnectorVariant : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *capacity;
@property (nonatomic, strong) NSNumber *filter;
@property (nonatomic, strong) NSString *iconKey;

@end
