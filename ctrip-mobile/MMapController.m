//
//  MMapController.m
//  ctrip-mobile
//
//  Created by cao guangyao on 13-4-30.
//  Copyright (c) 2013年 caoguangyao. All rights reserved.
//

#import "MMapController.h"

@interface MMapController ()

@end

@implementation MMapController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = self.name;
    
    CGFloat height = [[UIScreen mainScreen] bounds].size.height-64;
    CGFloat width = [[UIScreen mainScreen] bounds].size.width;
    
    NSLog(@"width == %f",width);
    
    CGRect frame = CGRectMake(0, 0, width, height);
    MKMapView *mapView = [[MKMapView alloc] initWithFrame:frame];
    mapView.delegate = self;
    
    MKCoordinateRegion region;
    
    region.span.latitudeDelta = 0.05;
    region.span.longitudeDelta = 0.05;
    region.center = self.coordinate;
    
    [mapView setRegion:region];
    
    [self.view addSubview:mapView];
    
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
	annotation.coordinate = self.coordinate;
    annotation.title = self.address;
    annotation.subtitle =self.name;
    
    [mapView addAnnotation:annotation];
    // Do any additional setup after loading the view.
}

-(MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    MKPinAnnotationView *pinView = nil;
    
    static NSString *pinIdentify = @"pinindetify";
    
    pinView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:pinIdentify];
    
    if (pinView == nil) {
        pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pinIdentify];
        
        pinView.pinColor = MKPinAnnotationColorRed;
        pinView.canShowCallout = YES;
        pinView.animatesDrop = YES;
        
    }
    
    return pinView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
