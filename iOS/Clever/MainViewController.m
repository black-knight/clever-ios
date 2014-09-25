//
//  ViewController.m
//  Clever
//
//  Created by Daniel Andersen on 03/08/14.
//  Copyright (c) 2014 Trolls Ahead. All rights reserved.
//

#import <MapKit/MapKit.h>
#import <UIImageView+WebCache.h>

#import "MainViewController.h"
#import "PoiWebservice.h"
#import "Poi.h"
#import "CacheableItem.h"

static Poi *globalPoi;

@implementation MKCustomAnnotation

- (MKAnnotationView *)createView {
    return nil;
}

- (void)annotationInfoButtonPressed:(id)sender {
}

- (NSString *)reuseIdentifier {
    return nil;
}

@end

@interface MKChargingPointAnnotation ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation MKChargingPointAnnotation

- (id)initWithLocation:(Location *)location {
    if (self = [super init]) {
        self.location = location;
        self.imageView = [UIImageView new];
    }
    return self;
}

- (CLLocationCoordinate2D)coordinate {
    return [self.location coordinate];
}

- (NSString *)title {
    return self.location.name;
}

- (NSString *)subtitle {
    return [self.location friendlyLocation];
}

- (MKAnnotationView *)createView {
    MKAnnotationView *view = [[MKAnnotationView alloc] initWithAnnotation:self reuseIdentifier:[self reuseIdentifier]];
    view.canShowCallout = YES;
    view.calloutOffset = CGPointMake(0.0f, 32.0f);
    CacheableItem *cacheableItem = [globalPoi.cacheableItems objectForKey:self.location.icon];

    [self.imageView sd_setImageWithURL:[NSURL URLWithString:cacheableItem.pictureUrl] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        CGSize imageSize = CGSizeMake(32.0f, 32.0f);
        UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
        [image drawInRect:CGRectMake(0.0f, 0.0f, imageSize.width, imageSize.height)];
        view.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }];
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    view.rightCalloutAccessoryView = rightButton;
    return view;
}

- (void)annotationInfoButtonPressed:(id)sender {
    [self.delegate annotationInfoButtonPressed:self];
}

- (NSString *)reuseIdentifier {
    return @"ChargingPointAnnotationView";
}

@end



@interface MainViewController () <MKMapViewDelegate, MKCustomAnnotationDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (nonatomic, strong) NSMutableArray *annotations;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.annotations = [NSMutableArray array];
    self.mapView.delegate = self;
}

- (void)resetAnnotations {
    [self.mapView removeAnnotations:self.annotations];
    self.annotations = [NSMutableArray array];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    [[[PoiWebservice alloc] init] getPoiWithSuccess:^(Poi *poi) {
        NSLog(@"Successfully fetched POI");
        [self updateMapWithPoi:poi];
    } error:^(NSError *error) {
        NSLog(@"Error fetching POI: %@", error);
    }];
}

- (void)updateMapWithPoi:(Poi *)poi {
    globalPoi = poi;
    [self resetAnnotations];
    for (Location *location in [poi.locations allValues]) {
        MKChargingPointAnnotation *annotation = [[MKChargingPointAnnotation alloc] initWithLocation:location];
        annotation.delegate = self;
        [self.annotations addObject:annotation];
    }
    [self.mapView addAnnotations:self.annotations];
    [self.mapView showAnnotations:self.annotations animated:YES];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    if ([annotation isKindOfClass:[MKCustomAnnotation class]]) {
        MKCustomAnnotation *customAnnotation = (MKCustomAnnotation *)annotation;
        MKAnnotationView *view = (MKAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:[customAnnotation reuseIdentifier]];
        if (view == nil) {
            view = [customAnnotation createView];
        } else {
            view.annotation = annotation;
        }
        return view;
    }
    return nil;
}

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    id <MKAnnotation> annotation = [view annotation];
    if ([annotation isKindOfClass:[MKCustomAnnotation class]]) {
        [((MKCustomAnnotation *) annotation) annotationInfoButtonPressed:annotation];
    }
}

- (void)annotationInfoButtonPressed:(id)sender {
    NSLog(@"!");
}

@end
