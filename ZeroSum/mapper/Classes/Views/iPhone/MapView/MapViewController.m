//
//  MapViewController.m
//  mapper
//
//  Created by jimmy on 7/7/13.
//
//

#import "MapViewController.h"
#import "Annotation.h"


@interface MapViewController () {
    NSArray *googleJson;
    IBOutlet MKMapView* mapView;

}

@end

@implementation MapViewController

- (void)setLocArray:(NSArray *)json
{
    googleJson = json;
}

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
	// Do any additional setup after loading the view.
    
    for (int i=0; i<[googleJson count]; i++) {
        /*
        Annotation *annotation = [[Annotation alloc] initWithLatitude:newLocation.coordinate.latitude
                                                         andLongitude:newLocation.coordinate.longitude];
        
        [mapView addAnnotation:annotation];
        
        MKCoordinateRegion region;
        float latitude = newLocation.coordinate.latitude;
        float longitude = newLocation.coordinate.longitude;
        
        region.span.latitudeDelta=1.0/69*0.5;
        region.span.longitudeDelta=1.0/69*0.5;
        
        region.center.latitude=latitude;
        region.center.longitude=longitude;
        
        [mapView setRegion:region animated:YES];
        [mapView regionThatFits:region];
         */
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
