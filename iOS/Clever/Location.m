//
//  Location.m
//  Clever
//
//  Created by Daniel Andersen on 08/08/14.
//  Copyright (c) 2014 Trolls Ahead. All rights reserved.
//

#import "Location.h"

@implementation Location

- (CLLocationCoordinate2D)coordinate {
    return CLLocationCoordinate2DMake([self.latitude floatValue], [self.longitude floatValue]);
}

@end
