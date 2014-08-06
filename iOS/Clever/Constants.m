//
//  Constants.m
//  Rumpet
//
//  Created by Daniel Andersen on 14/05/14.
//  Copyright (c) 2014 Alexandra Institute A/S. All rights reserved.
//

#import "Constants.h"

Constants *constantsInstance = nil;

@implementation Constants

+ (Constants *)sharedInstance {
    @synchronized (self) {
        if (constantsInstance == nil) {
            constantsInstance = [[Constants alloc] init];
        }
        return constantsInstance;
    }
}

- (id)init {
    if (self = [super init]) {
#if TARGET_IPHONE_SIMULATOR
        self.hostBaseUrl = @"http://127.0.0.1:5000/clever";
#else
        self.hostBaseUrl = @"http://trollsahead.pythonanywhere.com/clever";
#endif

        self.webserviceBaseUrl = [NSString stringWithFormat:@"%@/api/v1.0", self.hostBaseUrl];
        self.webserviceDateFormat = @"dd/MM-yyyy HH:mm:ss";
        
        self.defaultAnimationDuration = 0.3f;

        self.defaultDateFormatter = [[NSDateFormatter alloc] init];
        self.defaultDateFormatter.dateFormat = @"dd. MMMM YYYY";

        self.shortDateFormatter = [[NSDateFormatter alloc] init];
        self.shortDateFormatter.dateFormat = @"dd/MM-YYYY";
        
        self.defaultTimeFormatter = [[NSDateFormatter alloc] init];
        self.defaultTimeFormatter.dateFormat = @"HH:mm";

    }
    return self;
}

@end
