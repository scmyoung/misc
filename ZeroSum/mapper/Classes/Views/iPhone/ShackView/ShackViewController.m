//
//  ShackViewController.m
//  mapper
//
//  Created by jimmy on 7/6/13.
//
//

#import "ShackViewController.h"

#define GOOGLE_PLACE_BASE_URL @"https://maps.googleapis.com/maps/api/place/nearbysearch/"
#define GOOGLE_API_KEY @"AIzaSyAtK3jGI1fZaf_ykuLnq1T3ZMJ440S4vYc"
#define RADIUS @"1000"
#define OUTPUT @"json"
#define SENSOR @"true"
#define TYPES @"restaurant"

@interface ShackViewController ()
{
    CLLocationManager *locMgr;
    NSString *location;
    
    
    NSDictionary *oneRes;
    NSString *name;
    NSString *geometry_lat;
    NSString *geometry_lng ;
    NSString *formatted_address;
    NSString *rating ;
    
    NSData *googlePlaceJson;

}

@end

@implementation ShackViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //UIImage * myImage = [UIImage imageWithContentsOfFile: @"img.jpeg"];
    UIImage *myImage = [UIImage imageNamed:@"img.jpeg"];
    
    UIImageView *img = [[UIImageView alloc] initWithImage:myImage];
    img.frame =CGRectMake(0, 0, 320, 568);
    [self.view addSubview:img];
    
    CGRect lframe = CGRectMake(0, 0, 320, 40);
	
	titleLabel = [[UILabel alloc] initWithFrame:lframe];
	titleLabel.text = @"No Shake";
	titleLabel.textAlignment = UITextAlignmentCenter;
	
	//[self.view addSubview:titleLabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)canBecomeFirstResponder{
    return YES;
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    // you can do any thing at this stage what ever you want. Change the song in playlist, show photo, change photo or whatever you want to do
    titleLabel.text = @"Shake Started";
    locMgr = [[CLLocationManager alloc] init];
    locMgr.delegate = self;
    locMgr.distanceFilter = kCLDistanceFilterNone;
    locMgr.desiredAccuracy = kCLLocationAccuracyBest;
    
    [self getCurrentLocation];
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    NSLog(@"strat");
}

- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event{
	titleLabel.text = @"Shake Cancelled";
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    // you can do any thing at this stage what ever you want. Change the song in playlist, show photo, change photo or whatever you want to do
	titleLabel.text = @"Shake Ended";
}




- (void)getCurrentLocation
{
    [locMgr startUpdatingLocation];
}

-(void)fetchedData:(NSData *)responseData {
    //parse out the json data
    
    googlePlaceJson = responseData;
    
    /*

    */
    
    [self performSegueWithIdentifier:@"ThemeListController" sender:nil];
    
    
    //Write out the data to the console.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"ThemeListController"])
    {
        // Get reference to the destination view controller
        ThemeListController *vc = [segue destinationViewController];
        
        // Pass any objects to the view controller here, like...
        [vc setGooglePlaceJson:googlePlaceJson];
    }
}

- (void) requestGooglePlaceApi
{
    
    NSString *url = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/search/json?location=%@&radius=%@&types=%@&sensor=true&key=%@", location, RADIUS, TYPES, GOOGLE_API_KEY];
    
    //Formulate the string as a URL object.
    NSURL *googleRequestURL=[NSURL URLWithString:url];
    
    // Retrieve the results of the URL.
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData* data = [NSData dataWithContentsOfURL: googleRequestURL];
        [self performSelectorOnMainThread:@selector(fetchedData:) withObject:data waitUntilDone:YES];
    });
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *loc =  [locations lastObject];
    NSLog(@"x: %f y: %f", loc.coordinate.latitude, loc.coordinate.longitude);
    
    location = [[NSString alloc] initWithFormat:@"%f,%f", loc.coordinate.latitude, loc.coordinate.longitude];
    
    if (loc != nil) {
        [locMgr stopUpdatingLocation];
        [self requestGooglePlaceApi];
    }
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    NSLog(@"Fail with error %@", error);
}


@end
