//
//  ViewController.m
//  Clever
//
//  Created by Daniel Andersen on 03/08/14.
//  Copyright (c) 2014 Trolls Ahead. All rights reserved.
//

#import "MainViewController.h"
#import "PoiWebservice.h"
#import "Poi.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[[PoiWebservice alloc] init] getPoiWithSuccess:^(Poi *poi) {
        NSLog(@"Successfully fetched POI");
    } error:^(NSError *error) {
        NSLog(@"Error fetching POI: %@", error);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
