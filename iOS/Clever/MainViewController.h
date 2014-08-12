//
//  ViewController.h
//  Clever
//
//  Created by Daniel Andersen on 03/08/14.
//  Copyright (c) 2014 Trolls Ahead. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Location.h"

@interface MainViewController : UIViewController

@end



@protocol MKCustomAnnotationDelegate <NSObject>

- (void)annotationInfoButtonPressed:(id)sender;

@end

@interface MKCustomAnnotation : NSObject <MKAnnotation, MKCustomAnnotationDelegate>

- (MKAnnotationView *)createView;

- (NSString *)reuseIdentifier;

@property (nonatomic, weak) id<MKCustomAnnotationDelegate> delegate;

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly, copy) NSString *subtitle;

@end



@interface MKChargingPointAnnotation : MKCustomAnnotation

@property (nonatomic, strong) Location *location;

- (id)initWithLocation:(Location *)location;

@end
